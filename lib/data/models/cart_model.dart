// To parse this JSON data, do
//
//     final cartModel = cartModelFromMap(jsonString);

import 'dart:convert';

CartModel cartModelFromMap(String str) => CartModel.fromMap(json.decode(str));

String cartModelToMap(CartModel data) => json.encode(data.toMap());

class CartModel {
  final int? id;
  final String? image;
  final String? title;
  final String? description;
  final String? brand;
  final int? amount;
  final String? currency;
  final double? price;
  final int? measurementId;
  final int? count;

  CartModel({
    this.id,
    this.image,
    this.title,
    this.description,
    this.brand,
    this.amount,
    this.currency,
    this.price,
    this.measurementId,
    this.count,
  });

  CartModel copyWith({
    int? id,
    String? image,
    String? title,
    String? description,
    String? brand,
    int? amount,
    String? currency,
    double? price,
    int? measurementId,
    int? count,
  }) =>
      CartModel(
        id: id ?? this.id,
        image: image ?? this.image,
        title: title ?? this.title,
        description: description ?? this.description,
        brand: brand ?? this.brand,
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        price: price ?? this.price,
        measurementId: measurementId ?? this.measurementId,
        count: count ?? this.count,
      );

  factory CartModel.fromMap(Map<String, dynamic> json) => CartModel(
    id: json["id"],
    image: json["image"],
    title: json["title"],
    description: json["description"],
    brand: json["brand"],
    amount: json["amount"],
    currency: json["currency"],
    price: json["price"]?.toDouble(),
    measurementId: json["measurementId"],
    count: json["count"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "image": image,
    "title": title,
    "description": description,
    "brand": brand,
    "amount": amount,
    "currency": currency,
    "price": price,
    "measurementId": measurementId,
    "count": count,
  };
}
