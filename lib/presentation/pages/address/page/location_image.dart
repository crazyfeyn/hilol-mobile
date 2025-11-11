import 'dart:io';
import 'package:commerce_mobile/config/router/navigation_service.dart';
import 'package:commerce_mobile/core/utils/app_enums.dart';
import 'package:commerce_mobile/core/utils/locale_keys.g.dart';
import 'package:commerce_mobile/data/models/order_model.dart';
import 'package:commerce_mobile/presentation/pages/address/bloc/address_bloc.dart';
import 'package:commerce_mobile/presentation/pages/payment/page/payment_page.dart';
import 'package:commerce_mobile/presentation/widgets/custom_elevated_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class LocationImagePage extends StatelessWidget {
  static const String path = "/location_image_page";

  final OrderData orderData;

  const LocationImagePage({super.key, required this.orderData});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressBloc(),
      child: LocationImageView(orderData: orderData),
    );
  }
}

class LocationImageView extends StatefulWidget {
  final OrderData orderData;

  const LocationImageView({super.key, required this.orderData});

  @override
  State<LocationImageView> createState() => _LocationImageViewState();
}

class _LocationImageViewState extends State<LocationImageView> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();
  late AddressBloc _addressBloc;

  @override
  void initState() {
    super.initState();
    _addressBloc = context.read<AddressBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressBloc, AddressState>(
      listener: (context, state) {
        if (state.uploadStatus == FormzSubmissionStatus.success) {
          _navigateToPayment(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.tr(LocaleKeys.location_image)),
          actions: [
            TextButton(
              onPressed: () => _skipAndNavigate(context),
              child: Text(
                context.tr(LocaleKeys.skip),
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildInfoCard(),
                const SizedBox(height: 24),
                _buildImagePreview(),
                const SizedBox(height: 24),
                _buildImageOptions(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline, color: Colors.blue.shade700, size: 20),
              const SizedBox(width: 8),
              Text(
                context.tr(LocaleKeys.optional_step),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            context.tr(LocaleKeys.location_image_description),
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImagePreview() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child:
          _selectedImage != null
              ? ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(_selectedImage!, fit: BoxFit.cover),
              )
              : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 64,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      context.tr(LocaleKeys.no_image_selected),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
    );
  }

  Widget _buildImageOptions() {
    return Row(
      children: [
        Expanded(
          child: _buildImageOptionButton(
            icon: Icons.camera_alt,
            label: context.tr(LocaleKeys.take_photo),
            onTap: () => _pickImage(ImageSource.camera),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildImageOptionButton(
            icon: Icons.photo_library,
            label: context.tr(LocaleKeys.choose_gallery),
            onTap: () => _pickImage(ImageSource.gallery),
          ),
        ),
      ],
    );
  }

  Widget _buildImageOptionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, size: 32, color: Colors.blue.shade700),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return BlocBuilder<AddressBloc, AddressState>(
      builder: (context, state) {
        final isUploading = state.isUploadingImage;
        final hasImage = _selectedImage != null;

        return Padding(
          padding: EdgeInsets.only(
            top: 8,
            left: 16,
            right: 16,
            bottom: MediaQuery.viewPaddingOf(context).bottom + 8,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (hasImage && !isUploading)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TextButton.icon(
                    onPressed: () {
                      setState(() {
                        _selectedImage = null;
                      });
                    },
                    icon: const Icon(Icons.delete_outline),
                    label: Text(context.tr(LocaleKeys.remove_image)),
                    style: TextButton.styleFrom(foregroundColor: Colors.red),
                  ),
                ),
              CustomElevatedButton(
                onTap:
                    isUploading
                        ? null
                        : hasImage
                        ? () => _uploadImage(context)
                        : () => _skipAndNavigate(context),
                title:
                    isUploading
                        ? context.tr(LocaleKeys.uploading)
                        : hasImage
                        ? context.tr(LocaleKeys.upload_and_continue)
                        : context.tr(LocaleKeys.skip_and_continue),
                isLoading: isUploading,
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        maxWidth: 1920,
        maxHeight: 1920,
        imageQuality: 85,
      );

      if (image != null) {
        setState(() {
          _selectedImage = File(image.path);
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              LocaleKeys.image_selection_failed.tr(args: [e.toString()]),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _uploadImage(BuildContext context) {
    if (_selectedImage == null) return;

    context.read<AddressBloc>().add(
      AddressLocationImageUploadRequested(
        widget.orderData.orderId,
        _selectedImage!,
      ),
    );
  }

  void _skipAndNavigate(BuildContext context) {
    _navigateToPayment(context);
  }

  void _navigateToPayment(BuildContext context) {
    NavigationService.push(context, PaymentPage.path, extra: widget.orderData);
  }

  @override
  void dispose() {
    _addressBloc.add(AddressLocationImageUploadCleared());
    super.dispose();
  }
}
