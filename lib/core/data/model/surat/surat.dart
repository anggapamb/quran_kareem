class Surat {
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? tempatTurun;
  String? arti;
  String? deskripsi;

  Surat({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
  });

  factory Surat.fromJson(Map<String, dynamic> json) => Surat(
        nomor: json['nomor'] as int?,
        nama: json['nama'] as String?,
        namaLatin: json['namaLatin'] as String?,
        jumlahAyat: json['jumlahAyat'] as int?,
        tempatTurun: json['tempatTurun'] as String?,
        arti: json['arti'] as String?,
        deskripsi: json['deskripsi'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'nomor': nomor,
        'nama': nama,
        'namaLatin': namaLatin,
        'jumlahAyat': jumlahAyat,
        'tempatTurun': tempatTurun,
        'arti': arti,
        'deskripsi': deskripsi,
      };

  Surat copyWith({
    int? nomor,
    String? nama,
    String? namaLatin,
    int? jumlahAyat,
    String? tempatTurun,
    String? arti,
    String? deskripsi,
  }) {
    return Surat(
      nomor: nomor ?? this.nomor,
      nama: nama ?? this.nama,
      namaLatin: namaLatin ?? this.namaLatin,
      jumlahAyat: jumlahAyat ?? this.jumlahAyat,
      tempatTurun: tempatTurun ?? this.tempatTurun,
      arti: arti ?? this.arti,
      deskripsi: deskripsi ?? this.deskripsi,
    );
  }
}
