import 'audio.dart';

class Ayat {
  int? nomorAyat;
  String? teksArab;
  String? teksLatin;
  String? teksIndonesia;
  Audio? audio;
  String? namaSurat;

  Ayat({
    this.nomorAyat,
    this.teksArab,
    this.teksLatin,
    this.teksIndonesia,
    this.audio,
    this.namaSurat,
  });

  factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
        nomorAyat: json['nomorAyat'] as int?,
        teksArab: json['teksArab'] as String?,
        teksLatin: json['teksLatin'] as String?,
        teksIndonesia: json['teksIndonesia'] as String?,
        namaSurat: json['namaSurat'] as String?,
        audio: json['audio'] == null ? null : Audio.fromJson(json['audio'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'nomorAyat': nomorAyat,
        'teksArab': teksArab,
        'teksLatin': teksLatin,
        'teksIndonesia': teksIndonesia,
        'namaSurat': namaSurat,
        'audio': audio?.toJson(),
      };

  Ayat copyWith({
    int? nomorAyat,
    String? teksArab,
    String? teksLatin,
    String? teksIndonesia,
    Audio? audio,
    String? namaSurat,
  }) {
    return Ayat(
      nomorAyat: nomorAyat ?? this.nomorAyat,
      teksArab: teksArab ?? this.teksArab,
      teksLatin: teksLatin ?? this.teksLatin,
      teksIndonesia: teksIndonesia ?? this.teksIndonesia,
      audio: audio ?? this.audio,
      namaSurat: namaSurat ?? this.namaSurat,
    );
  }
}
