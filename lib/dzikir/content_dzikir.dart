import 'package:flutter/material.dart';
import 'package:doa/dzikir/detail_dzikir.dart';
import 'package:doa/model/dzikir.dart';
import 'package:doa/utils/custom_widget.dart';

class ContentDzikir extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 255, 190, 106),
        title: Text('Kumpulan Dzikir', style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        height: double.infinity,
        margin: EdgeInsets.all(16.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: dataListDzikir.map((list){
            return Padding(
              padding: const EdgeInsets.only(left :5.0, right: 5, bottom: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 50,
                  // margin: EdgeInsets.only(left: 18.0, right: 18.0,bottom: 8.0),
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white))),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                      backgroundColor: Color.fromARGB(255, 255, 190, 106),
                      foregroundColor: Colors.white
                    ),
                    // elevation: 0,
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(10.0)
                    // ),
                    // color: Colors.orange,
                    onPressed: (){
                      Navigator.push(context,
                          PageRouteBuilder(transitionDuration: Duration(seconds: 1),
                              transitionsBuilder: (context,animation,animationTime,chil){
                                animation = CurvedAnimation(
                                    parent: animation, curve: Curves.elasticOut);
                                return ScaleTransition(
                                    scale: animation,
                                    alignment: Alignment.center,
                                    child: chil
                                );
                              },
                              pageBuilder: (context, animation, animationTime) {
                                return DetailDzikir(
                                  title: list,
                                );
                              }));
                    },
                    child: ListTile(
                      title: Text(list.title, style: listTitle),
                      trailing: Icon (Icons.keyboard_arrow_right_rounded,color: Colors.white,),
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