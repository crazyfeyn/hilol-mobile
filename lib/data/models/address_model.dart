import 'dart:convert';

AddressModel addressModelFromMap(String str) =>
    AddressModel.fromMap(json.decode(str));

String addressModelToMap(AddressModel data) => json.encode(data.toMap());

class AddressModel {
  final double? latitute;
  final double? longitude;
  final String? address;
  final String? receiverName;
  final String? homeNumber;
  final String? entrancePassword;
  final String? phoneNumber;
  final String? city;
  final String? region;
  final String? street;

  AddressModel({
    this.latitute,
    this.longitude,
    this.address,
    this.receiverName,
    this.homeNumber,
    this.entrancePassword,
    this.phoneNumber,
    this.city,
    this.region,
    this.street,
  });

  AddressModel copyWith({
    double? latitute,
    double? longitude,
    String? address,
    String? receiverName,
    String? homeNumber,
    String? entrancePassword,
    String? phoneNumber,
    String? city,
    String? region,
    String? street,
  }) => AddressModel(
    latitute: latitute ?? this.latitute,
    longitude: longitude ?? this.longitude,
    address: address ?? this.address,
    receiverName: receiverName ?? this.receiverName,
    homeNumber: homeNumber ?? this.homeNumber,
    entrancePassword: entrancePassword ?? this.entrancePassword,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    city: city ?? this.city,
    region: region ?? this.region,
    street: street ?? this.street,
  );

  factory AddressModel.fromMap(Map<String, dynamic> json) => AddressModel(
    latitute: json["latitute"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    address: json["address"],
    receiverName: json["receiver_name"],
    homeNumber: json["home_number"],
    entrancePassword: json["entrance_password"],
    phoneNumber: json["phone_number"],
    city: json["city"],
    region: json["region"],
    street: json["street"],
  );

  Map<String, dynamic> toMap() => {
    "latitute": latitute,
    "longitude": longitude,
    "address": address,
    "receiver_name": receiverName,
    "home_number": homeNumber,
    "entrance_password": entrancePassword,
    "phone_number": phoneNumber,
    "city": city,
    "region": region,
    "street": street,
  };
}
