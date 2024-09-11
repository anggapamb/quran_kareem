class Audio {
  String? audio01;
  String? audio02;
  String? audio03;
  String? audio04;
  String? audio05;

  Audio({this.audio01, this.audio02, this.audio03, this.audio04, this.audio05});

  factory Audio.fromJson(Map<String, dynamic> json) => Audio(
        audio01: json['01'] as String?,
        audio02: json['02'] as String?,
        audio03: json['03'] as String?,
        audio04: json['04'] as String?,
        audio05: json['05'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '01': audio01,
        '02': audio02,
        '03': audio03,
        '04': audio04,
        '05': audio05,
      };

  Audio copyWith({
    String? audio01,
    String? audio02,
    String? audio03,
    String? audio04,
    String? audio05,
  }) {
    return Audio(
      audio01: audio01 ?? this.audio01,
      audio02: audio02 ?? this.audio02,
      audio03: audio03 ?? this.audio03,
      audio04: audio04 ?? this.audio04,
      audio05: audio05 ?? this.audio05,
    );
  }
}
