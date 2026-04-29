import 'dart:convert';

ProductCategoryResponse productCategoryResponseFromMap(String str) =>
    ProductCategoryResponse.fromMap(json.decode(str));

String productCategoryResponseToMap(ProductCategoryResponse data) =>
    json.encode(data.toMap());

class ProductCategoryResponse {
  final List<ProductCategoryModel>? list;

  ProductCategoryResponse({this.list});

  factory ProductCategoryResponse.fromMap(Map<String, dynamic> json) =>
      ProductCategoryResponse(
        list:
            json["data"]?["list"] != null
                ? List<ProductCategoryModel>.from(
                  json["data"]["list"].map(
                    (x) => ProductCategoryModel.fromMap(x),
                  ),
                )
                : null,
      );

  Map<String, dynamic> toMap() => {
    "data": {"list": list?.map((x) => x.toMap()).toList()},
  };
}

class ProductCategoryModel {
  final int? id;
  final String? title;
  final String? imageIdentity; // ← real field name from API
  final String? description;

  ProductCategoryModel({
    this.id,
    this.title,
    this.imageIdentity,
    this.description,
  });

  ProductCategoryModel copyWith({
    int? id,
    String? title,
    String? imageIdentity,
    String? description,
  }) => ProductCategoryModel(
    id: id ?? this.id,
    title: title ?? this.title,
    imageIdentity: imageIdentity ?? this.imageIdentity,
    description: description ?? this.description,
  );

  factory ProductCategoryModel.fromMap(Map<String, dynamic> json) =>
      ProductCategoryModel(
        id: json["id"],
        title: json["title"],
        imageIdentity: json["imageIdentity"], // ← real field name from API
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "imageIdentity": imageIdentity,
    "description": description,
  };
}
