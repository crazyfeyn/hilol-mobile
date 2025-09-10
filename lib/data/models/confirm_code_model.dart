class ConfirmCodeModel {
  String? clientId;
  String? code;

  ConfirmCodeModel({this.clientId, this.code});

  ConfirmCodeModel copyWith({String? clientId, String? code}) =>
      ConfirmCodeModel(
        clientId: clientId ?? this.clientId,
        code: code ?? this.code,
      );

  factory ConfirmCodeModel.fromJson(Map<String, dynamic> json) {
    return ConfirmCodeModel(clientId: json['clientId'], code: json['code']);
  }

  Map<String, dynamic> toJson() => {'clientId': clientId, 'code': code};
}
