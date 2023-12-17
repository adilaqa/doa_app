import 'package:doa/model/surahmodel.dart';
import 'package:doa/utils/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:doa/surah/detail_surah.dart';

class AllSurahList extends StatelessWidget {
  final List<SurahApi> dataListSurah;

  AllSurahList({required this.dataListSurah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 255, 190, 106),
        title: Text('Kumpulan Doa', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        height: double.infinity,
        margin: EdgeInsets.all(16.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: dataListSurah.map((SurahApi surah) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 5.0,
                right: 5,
                bottom: 8,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.white))),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: Color.fromARGB(255, 255, 190, 106),
                      foregroundColor: Colors.white,
                      minimumSize: Size(300, 50),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(seconds: 1),
                          transitionsBuilder:
                              (context, animation, animationTime, chil) {
                            animation = CurvedAnimation(
                                parent: animation, curve: Curves.elasticOut);
                            return ScaleTransition(
                              scale: animation,
                              alignment: Alignment.center,
                              child: chil,
                            );
                          },
                          pageBuilder: (context, animation, animationTime) {
                            return DetailSurah(
                              title: surah, 
                            );
                          },
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(surah.nama, style: listTitle),
                      trailing: Icon(Icons.keyboard_arrow_right_rounded,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
