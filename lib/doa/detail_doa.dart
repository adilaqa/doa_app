import 'package:doa/model/doamodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailDoa extends StatelessWidget {
  final DoaApi title;  

  DetailDoa({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 190, 106),
        title: Text(title.doa, style: TextStyle(color: Colors.white)),
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
                margin: EdgeInsets.only(left: 20.0,right: 20.0,top: 16.0,bottom: 16.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [
                      Text(title.ayat,
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0,color: Colors.grey[700]),
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.justify),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(title.latin,
                          style: TextStyle(color: Colors.grey[500]),
                          textAlign: TextAlign.center,),
                      ),
                      Text("Artinya :", style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Text(title.artinya, style: TextStyle(color: Colors.grey[700]),
                        textAlign: TextAlign.justify,),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
