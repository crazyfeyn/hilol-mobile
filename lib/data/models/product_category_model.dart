import 'package:commerce_mobile/data/models/title_data_model.dart';

class ProductCategoryModel {
  final int id;
  final String title;
  final TitleData? titleData;
  final String imageIdentity;
  final String description;

  ProductCategoryModel({
    required this.id,
    required this.title,
    this.titleData,
    required this.imageIdentity,
    required this.description,
  });

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    return ProductCategoryModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      titleData:
          json['titleData'] != null
              ? TitleData.fromJson(json['titleData'])
              : null,
      imageIdentity: json['imageIdentity'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
