class SurahApi {
  final int id;
  final String nama;
  final String nama_latin;
  final int jumlah_ayat;
  final String tempat_turun;
  final String arti;
  final String deskripsi;

  const SurahApi({
    required this.id,
    required this.nama,
    required this.nama_latin,
    required this.jumlah_ayat,
    required this.tempat_turun,
    required this.arti,
    required this.deskripsi,
  });

  factory SurahApi.fromJson(Map<String, dynamic> json) {
    return SurahApi(
      id: json['id'] ?? 0,
      nama: json['nama'] ?? '',
      nama_latin: json['nama_latin'] ?? '',
      jumlah_ayat: json['jumlah_ayat'] ?? '',
      tempat_turun: json['tempat_turun'] ?? '',
      arti: json['arti'] ?? '',
      deskripsi: json['deskripsi'] ?? '',
    );
  }
}
