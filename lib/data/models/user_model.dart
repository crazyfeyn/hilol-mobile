// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? id;
  String? clientId;
  String? firstname;
  String? lastname;
  String? phone;
  DateTime? createdAt;
  String? clientStatus;
  String? refreshToken;
  String? imageUrl;

  UserModel({
    this.id,
    this.clientId,
    this.firstname,
    this.lastname,
    this.phone,
    this.createdAt,
    this.clientStatus,
    this.refreshToken,
    this.imageUrl,
  });

  UserModel copyWith({
    int? id,
    String? clientId,
    String? firstname,
    String? lastname,
    String? phone,
    DateTime? createdAt,
    String? clientStatus,
    String? refreshToken,
    String? imageUrl,
  }) => UserModel(
    id: id ?? this.id,
    clientId: clientId ?? this.clientId,
    firstname: firstname ?? this.firstname,
    lastname: lastname ?? this.lastname,
    phone: phone ?? this.phone,
    createdAt: createdAt ?? this.createdAt,
    clientStatus: clientStatus ?? this.clientStatus,
    refreshToken: refreshToken ?? this.refreshToken,
    imageUrl: imageUrl ?? this.imageUrl,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    clientId: json["clientId"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    phone: json["phone"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    clientStatus: json["clientStatus"],
    refreshToken: json["refreshToken"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "clientId": clientId,
    "firstname": firstname,
    "lastname": lastname,
    "phone": phone,
    "createdAt": createdAt?.toIso8601String(),
    "clientStatus": clientStatus,
    "refreshToken": refreshToken,
    "imageUrl": imageUrl,
  };

  String get fullName => "${firstname ?? ''} ${lastname ?? ''}".trim();

  String get displayName => fullName.isNotEmpty ? fullName : (phone ?? 'User');
}
