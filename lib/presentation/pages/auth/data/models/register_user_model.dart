class RegisterUserModel {
  final String firstname;
  final String lastname;
  final String phoneNumber;

  RegisterUserModel({
    required this.firstname,
    required this.lastname,
    required this.phoneNumber,
  });

  // Convert JSON map to RegisterUserModel
  factory RegisterUserModel.fromJson(Map<String, dynamic> json) {
    return RegisterUserModel(
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );
  }

  // Convert RegisterUserModel to JSON map
  Map<String, dynamic> toJson() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'phoneNumber': phoneNumber,
    };
  }
}
