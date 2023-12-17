class DoaApi {
  final String id;
  final String doa;
  final String ayat;
  final String latin;
  final String artinya;


  const DoaApi({
    required this.id,
    required this.doa,
    required this.ayat,
    required this.latin,
    required this.artinya,

  });

  factory DoaApi.fromJson(Map<String, dynamic> json) {
    return DoaApi(
      id: json['id'] ?? 0, 
      doa: json['doa'] ?? '',
      ayat: json['ayat'] ?? '',
      latin: json['latin'] ?? '',
      artinya: json['artinya'] ?? '',

    );
  }
}
