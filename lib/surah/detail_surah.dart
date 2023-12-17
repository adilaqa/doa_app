import 'package:flutter/material.dart';
import 'package:doa/model/surahmodel.dart';

class DetailSurah extends StatelessWidget {
  final SurahApi title;

  const DetailSurah({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 190, 106),
        title: Text(
          title.nama,
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(16.0),
            width: double.infinity,
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                margin: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title.nama,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: Colors.grey[700],
                      ),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      title.nama_latin,
                      style: TextStyle(color: Colors.grey[500]),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      "Artinya :",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      title.deskripsi,
                      style: TextStyle(color: Colors.grey[700]),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      "Jumlah Ayat: ${title.jumlah_ayat}",
                      style: TextStyle(color: Colors.grey[700]),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "Tempat Turun: ${title.tempat_turun}",
                      style: TextStyle(color: Colors.grey[700]),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      "Arti: ${title.arti}",
                      style: TextStyle(color: Colors.grey[700]),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
