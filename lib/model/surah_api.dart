import 'dart:convert';
import 'package:doa/model/surahmodel.dart';
import 'package:http/http.dart' as http;

class SurahReq {
  final _baseurl = "https://quran-api.santrikoding.com/api/surah";

  Future<List<SurahApi>> getData() async {
    try {
      final response = await http.get(Uri.parse(_baseurl));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<SurahApi> surah = it.map((e) => SurahApi.fromJson(e)).toList();
        return surah;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load data');
    }
  }
}