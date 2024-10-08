import 'package:quran_kareem/core/data/model/detailSurat/audio.dart';

import 'ayat.dart';

class DetailSurat {
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? tempatTurun;
  String? arti;
  String? deskripsi;
  Audio? audioFull;
  List<Ayat>? ayat;

  DetailSurat({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audioFull,
    this.ayat,
  });

  factory DetailSurat.fromJson(Map<String, dynamic> json) => DetailSurat(
        nomor: json['nomor'] as int?,
        nama: json['nama'] as String?,
        namaLatin: json['namaLatin'] as String?,
        jumlahAyat: json['jumlahAyat'] as int?,
        tempatTurun: json['tempatTurun'] as String?,
        arti: json['arti'] as String?,
        deskripsi: json['deskripsi'] as String?,
        audioFull: json['audioFull'] == null ? null : Audio.fromJson(json['audioFull'] as Map<String, dynamic>),
        ayat: (json['ayat'] as List<dynamic>?)?.map((e) => Ayat.fromJson(e as Map<String, dynamic>)).toList(),
      );

  Map<String, dynamic> toJson() => {
        'nomor': nomor,
        'nama': nama,
        'namaLatin': namaLatin,
        'jumlahAyat': jumlahAyat,
        'tempatTurun': tempatTurun,
        'arti': arti,
        'deskripsi': deskripsi,
        'audioFull': audioFull?.toJson(),
        'ayat': ayat?.map((e) => e.toJson()).toList(),
      };

  DetailSurat copyWith({
    int? nomor,
    String? nama,
    String? namaLatin,
    int? jumlahAyat,
    String? tempatTurun,
    String? arti,
    String? deskripsi,
    Audio? audioFull,
    List<Ayat>? ayat,
  }) {
    return DetailSurat(
      nomor: nomor ?? this.nomor,
      nama: nama ?? this.nama,
      namaLatin: namaLatin ?? this.namaLatin,
      jumlahAyat: jumlahAyat ?? this.jumlahAyat,
      tempatTurun: tempatTurun ?? this.tempatTurun,
      arti: arti ?? this.arti,
      deskripsi: deskripsi ?? this.deskripsi,
      audioFull: audioFull ?? this.audioFull,
      ayat: ayat ?? this.ayat,
    );
  }
}
