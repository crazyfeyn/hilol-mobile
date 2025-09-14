class ResetPassRepositoryParam {
  final String? phone;
  final String? password;
  final String? code;

  ResetPassRepositoryParam({this.phone, this.password, this.code});

  Map<String, dynamic> toJson() {
    return {
      if (phone != null) "phone": phone,
      if (password != null) "password": password,
      if (code != null) "code": code,
    };
  }
}
