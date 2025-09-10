class SignInModel {
  String? phoneNumber;
  String? password;

  SignInModel({this.phoneNumber, this.password});

  SignInModel copyWith({String? phoneNumber, String? password}) => SignInModel(
    phoneNumber: phoneNumber ?? this.phoneNumber,
    password: password ?? this.password,
  );

  factory SignInModel.fromJson(Map<String, dynamic> json) =>
      SignInModel(phoneNumber: json['phoneNumber'], password: json["password"]);

  Map<String, dynamic> toJson() => {
    "phoneNumber": phoneNumber,
    "password": password,
  };
}
