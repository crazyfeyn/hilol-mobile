class SignUpModel {
  String? firstname;
  String? lastname;
  String? phoneNumber;
  String? password;

  SignUpModel({this.firstname, this.lastname, this.phoneNumber, this.password});

  SignUpModel copyWith({
    String? firstname,
    String? lastname,
    String? phoneNumber,
    String? password,
  }) => SignUpModel(
    firstname: firstname ?? this.firstname,
    lastname: lastname ?? this.lastname,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    password: password ?? this.password,
  );

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
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
