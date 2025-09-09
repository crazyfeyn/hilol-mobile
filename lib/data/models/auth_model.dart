class AuthModel {
  String? firstname;
  String? lastname;
  String? phoneNumber;
  String? password;

  AuthModel({
    this.firstname,
    this.lastname,
    this.phoneNumber,
    this.password,
  });

  AuthModel copyWith({
    String? firstname,
    String? lastname,
    String? phoneNumber,
    String? password,
  }) =>
      AuthModel(
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        password: password ?? this.password,
      );

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    firstname: json["firstname"],
    lastname: json["lastname"],
    phoneNumber: json["phoneNumber"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "lastname": lastname,
    "phoneNumber": phoneNumber,
    "password": password,
  };
}
