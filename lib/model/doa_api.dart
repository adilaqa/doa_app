import 'dart:convert';
import 'package:doa/model/doamodel.dart';
import 'package:http/http.dart' as http;

class DoaReq {
  final _baseurl = "https://doa-doa-api-ahmadramadhan.fly.dev/api";

  Future<List<DoaApi>> getData() async {
    try {
      final response = await http.get(Uri.parse(_baseurl));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<DoaApi> doa = it.map((e) => DoaApi.fromJson(e)).toList();
        return doa;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load data');
    }
  }
}