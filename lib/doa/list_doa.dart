import 'package:doa/doa/all_doa_list.dart';
import 'package:doa/doa/detail_doa.dart';
import 'package:doa/model/doa_api.dart';
import 'package:doa/model/doamodel.dart';
import 'package:flutter/material.dart';

class ListDoa extends StatelessWidget {
  final DoaReq doaReq = DoaReq();
  
  final TextStyle styleTitle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DoaApi>>(
      future: doaReq.getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<DoaApi> dataListDoa = snapshot.data ?? [];

          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: <Widget>[
                  Container(
                    height: 400.0,
                    child: ListView(
                      padding: EdgeInsets.only(top: 15),
                      children: dataListDoa.map((doa) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8.0, left: 5, right: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 190, 106),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration: Duration(seconds: 1),
                                    transitionsBuilder: (context, animation,
                                        animationTime, chil) {
                                      animation = CurvedAnimation(
                                        parent: animation,
                                        curve: Curves.elasticOut,
                                      );
                                      return ScaleTransition(
                                        scale: animation,
                                        alignment: Alignment.center,
                                        child: chil,
                                      );
                                    },
                                    pageBuilder:
                                        (context, animation, animationTime) {
                                      return DetailDoa(
                                        title: doa,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: ListTile(
                                title: Text(
                                  doa.doa,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ],
          );
        }
      },
    );
  }
}


class FloatingNavbar extends StatelessWidget {
  const FloatingNavbar({
    Key? key,
    required this.dataListDoa, 
  }) : super(key: key);

  final List<DoaApi> dataListDoa; 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 10,
          shape: RoundedRectangleBorder(),
          backgroundColor: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 30),
              transitionsBuilder: (context, animation, animationTime, child) {
                animation = CurvedAnimation(
                    parent: animation, curve: Curves.elasticOut);
                return ScaleTransition(
                    scale: animation, alignment: Alignment.center, child: child);
              },
              pageBuilder: (context, animation, animationTime) {
                return AllDoaList(dataListDoa: dataListDoa);
              },
            ),
          );
        },
        child: Container(
          child: ListTile(
            title: Center(
              child: Text(
                'Lihat Semua',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 190, 106),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

