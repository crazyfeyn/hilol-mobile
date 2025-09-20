class TitleData {
  final String en;
  final String kor;
  final String uz;

  TitleData({required this.en, required this.kor, required this.uz});

  factory TitleData.fromJson(Map<String, dynamic> json) {
    return TitleData(
      en: json['en'] ?? '',
      kor: json['kor'] ?? '',
      uz: json['uz'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'en': en, 'kor': kor, 'uz': uz};
  }

  TitleData copyWith({String? en, String? kor, String? uz}) {
    return TitleData(
      en: en ?? this.en,
      kor: kor ?? this.kor,
      uz: uz ?? this.uz,
    );
  }
}
