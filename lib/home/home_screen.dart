import 'package:doa/doa/detail_doa.dart';
import 'package:doa/dzikir/detail_dzikir.dart';
import 'package:doa/model/doa_api.dart';
import 'package:doa/model/surah_api.dart';
import 'package:doa/model/surahmodel.dart';
import 'package:doa/surah/detail_surah.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doa/home/header_content.dart';
import 'package:doa/model/doamodel.dart';
import 'package:doa/model/dzikir.dart';
import 'package:doa/doa/list_doa.dart';
import 'package:doa/home/menu_content.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<DoaApi> sampleDataList = [];
  final List<SurahApi> surahList = [];

  int _currentIndex = 0;
  final DoaReq doaReq = DoaReq();
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchData();
    _fetchSurahData();
  }

  Future<void> _fetchData() async {
    try {
      final data = await doaReq.getData();
      setState(() {
        sampleDataList.addAll(data);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _fetchSurahData() async {
    try {
      final data = await SurahReq().getData();
      setState(() {
        surahList.addAll(data);
      });
    } catch (e) {
      print('Error fetching Surah data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doa'),
        backgroundColor: Color.fromARGB(255, 255, 190, 106),
      ),
      body: _getBody(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        unselectedItemColor: Colors.grey,
        selectedItemColor: Color.fromARGB(255, 255, 190, 106),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book),
            label: 'Doa',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book_circle_fill),
            label: 'Dzikir',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book_fill),
            label: 'Surah',
          ),
        ],
      ),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return _buildHome();
      case 1:
        return _buildDoa();
      case 2:
        return _buildDzikir();
      case 3:
        return _buildSurah();
      default:
        return Container();
    }
  }

  Widget _buildHome() {
  return Container(
    color: Colors.white,
    child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderContent(),
          ContentMenu(
            dataListDoa: sampleDataList,
            dataListSurah: surahList,
          ),
          ListDoa(),
        ],
      ),
    ),
  );
}


  Widget _buildDoa() {
    List<DoaApi> filteredList = _searchController.text.isEmpty
        ? sampleDataList
        : sampleDataList
            .where((doa) => doa.doa
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()))
            .toList();

    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final doa = filteredList[index];
                return Card(
                  color: Color.fromARGB(255, 255, 190, 106),
                  elevation: 2,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(
                      doa.doa,
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(seconds: 1),
                          transitionsBuilder:
                              (context, animation, animationTime, child) {
                            animation = CurvedAnimation(
                              parent: animation,
                              curve: Curves.elasticOut,
                            );
                            return ScaleTransition(
                              scale: animation,
                              alignment: Alignment.center,
                              child: child,
                            );
                          },
                          pageBuilder: (context, animation, animationTime) {
                            return DetailDoa(title: doa);
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDzikir() {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: dataListDzikir.length,
        itemBuilder: (context, index) {
          final dzikir = dataListDzikir[index];
          return Card(
            color: Color.fromARGB(255, 255, 190, 106),
            elevation: 2,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(
                dzikir.title,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
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
                      return DetailDzikir(title: dzikir);
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildSurah() {
    List<SurahApi> filteredList = _searchController.text.isEmpty
        ? surahList
        : surahList
            .where((surah) => surah.nama_latin
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()))
            .toList();

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            ),
            onChanged: (value) {
              setState(() {});
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredList.length,
            itemBuilder: (context, index) {
              final surah = filteredList[index];
              final heroTag = 'surahName_${surah.id}_$index';

              return Card(
                color: Color.fromARGB(255, 255, 190, 106),
                elevation: 2,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Hero(
                    tag: heroTag,
                    child: Text(
                      surah.nama,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  subtitle: Text(
                    surah.nama_latin,
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(seconds: 1),
                        transitionsBuilder:
                            (context, animation, animationTime, child) {
                          animation = CurvedAnimation(
                            parent: animation,
                            curve: Curves.elasticOut,
                          );
                          return ScaleTransition(
                            scale: animation,
                            alignment: Alignment.center,
                            child: child,
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
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
