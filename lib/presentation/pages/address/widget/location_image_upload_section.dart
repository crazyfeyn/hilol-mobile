import 'dart:io';
import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/presentation/pages/address/bloc/address_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class LocationImageUploadSection extends StatefulWidget {
  final int orderId;
  final Function(File) onImageSelected;

  const LocationImageUploadSection({
    super.key,
    required this.orderId,
    required this.onImageSelected,
  });

  @override
  State<LocationImageUploadSection> createState() =>
      _LocationImageUploadSectionState();
}

class _LocationImageUploadSectionState
    extends State<LocationImageUploadSection> {
  File? _selectedImage;
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _pickImage() async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
        });
        widget.onImageSelected(_selectedImage!);
      }
    } catch (e) {
      _showErrorSnackbar(context.tr(LocaleKeys.failed_to_pick_image));
    }
  }

  Future<void> _takePhoto() async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
        });
        widget.onImageSelected(_selectedImage!);
      }
    } catch (e) {
      _showErrorSnackbar(context.tr(LocaleKeys.failed_to_take_photo));
    }
  }

  void _clearImage() {
    setState(() {
      _selectedImage = null;
    });
    context.read<AddressBloc>().add(AddressLocationImageUploadCleared());
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressBloc, AddressState>(
      builder: (context, state) {
        // Build the children list properly
        final List<Widget> children = [
          // Header
          Row(
            children: [
              Icon(Icons.photo_camera, color: Theme.of(context).primaryColor),
              const SizedBox(width: 8),
              Text(
                context.tr(LocaleKeys.location_image),
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 12),
        ];

        // Upload Status
        if (state.isUploadingImage) {
          children.add(_buildUploadingIndicator(context));
        } else if (state.uploadStatus == FormzSubmissionStatus.success) {
          children.add(_buildSuccessIndicator(context));
        } else if (state.uploadStatus == FormzSubmissionStatus.failure) {
          children.add(
            _buildErrorIndicator(context, state.uploadErrorMessage ?? ''),
          );
        }

        // Selected Image Preview
        if (_selectedImage != null && !state.isUploadingImage) {
          children.add(_buildImagePreview());
          children.add(const SizedBox(height: 12));
        }

        // Action Buttons
        children.addAll([
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.photo_library),
                  label: Text(context.tr(LocaleKeys.choose_from_gallery)),
                  onPressed: state.isUploadingImage ? null : _pickImage,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.camera_alt),
                  label: Text(context.tr(LocaleKeys.take_photo)),
                  onPressed: state.isUploadingImage ? null : _takePhoto,
                ),
              ),
            ],
          ),
        ]);

        // Clear Button
        if (_selectedImage != null && !state.isUploadingImage) {
          children.addAll([
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: _clearImage,
                child: Text(context.tr(LocaleKeys.clear_image)),
              ),
            ),
          ]);
        }

        return Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        );
      },
    );
  }

  Widget _buildUploadingIndicator(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              context.tr(LocaleKeys.uploading_image),
              style: TextStyle(color: Colors.blue[800]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessIndicator(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              context.tr(LocaleKeys.upload_successful),
              style: TextStyle(color: Colors.green[800]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorIndicator(BuildContext context, String error) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.error, color: Colors.red, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(error, style: TextStyle(color: Colors.red[800])),
          ),
        ],
      ),
    );
  }

  Widget _buildImagePreview() {
    return Container(
      width: double.infinity,
      height: 150,
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.file(
          _selectedImage!,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[200],
              child: const Icon(Icons.error, color: Colors.grey),
            );
          },
        ),
      ),
    );
  }
}
