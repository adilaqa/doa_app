import 'package:doa/model/doamodel.dart';
import 'package:doa/utils/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:doa/doa/detail_doa.dart';

class AllDoaList extends StatelessWidget {
  final List<DoaApi> dataListDoa;  

  AllDoaList({required this.dataListDoa});
  
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
          children: dataListDoa.map((DoaApi doa) { 
            return Padding(
              padding: const EdgeInsets.only(left:5.0, right: 5, bottom: 8,),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white))),
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
                          transitionsBuilder: (context, animation, animationTime, chil) {
                            animation = CurvedAnimation(
                              parent: animation, curve: Curves.elasticOut);
                            return ScaleTransition(
                              scale: animation,
                              alignment: Alignment.center,
                              child: chil,
                            );
                          },
                          pageBuilder: (context, animation, animationTime) {
                            return DetailDoa(
                              title: doa,
                            );
                          },
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(doa.doa, style: listTitle), 
                      trailing: Icon(Icons.keyboard_arrow_right_rounded, color: Colors.white),
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
