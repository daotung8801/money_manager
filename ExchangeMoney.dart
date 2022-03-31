import 'package:flutter/material.dart';
import 'Component/SearchItem.dart';
import 'Component/TitleText1.dart';

class ExchangeMoney extends StatelessWidget {
  ExchangeMoney({Key? key, required this.title}) : super(key: key);
  final String title;

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Padding(
            padding: EdgeInsets.only(left: 16),
            child: TitleText1(text: 'Xuất dữ liệu dưới dạng', fontFamily: 'Inter', fontSize: 20, fontWeight: FontWeight.bold, r: 0, g: 0, b: 0),
          ),
          content: Row(children: [
            Padding(
              padding: EdgeInsets.only(left: 75),
              child: Icon(
                  Icons.album_outlined,
                  color: Color.fromARGB(255, 28, 169, 113)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: TitleText1(text: 'Excel', fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.bold, r: 0, g: 0, b: 0),
            ),
          ]),
          actions: <Widget>[
            FlatButton(
              padding: EdgeInsets.only(right: 80, bottom: 20),
              child: TitleText1(text: 'Hủy', fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.bold, r: 28, g: 169, b: 113),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              padding: EdgeInsets.only(right: 55, bottom: 20),
              child: TitleText1(text: 'Xuất', fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.bold, r: 28, g: 169, b: 113),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(top: 10),
            child: TitleText1(text: 'Giao dịch', fontFamily: 'Inter', fontSize: 25, fontWeight: FontWeight.bold, r: 255, g: 255, b: 255),
          ),
          backgroundColor: Colors.transparent,
          toolbarHeight: 100,
          elevation: 0.0,
          leading: IconButton(
            padding: EdgeInsets.only(left: 32, top: 10),
            iconSize: 30,
            icon: Icon(Icons.menu),
            tooltip: 'Menu',
            onPressed: () => {},
          ),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.only(right: 5, top: 10),
              iconSize: 30,
              icon: Icon(Icons.search),
              tooltip: 'Tìm kiếm',
              onPressed: () => {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                )
              },
            ),
            IconButton(
              padding: EdgeInsets.only(right: 20, top: 10),
              iconSize: 30,
              icon: Icon(Icons.download),
              tooltip: 'Tải xuống',
              onPressed: () => {
                _showDialog(context),
              },
            ),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 35, 111, 87),
                  Color.fromARGB(255, 35, 111, 87),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            indicatorPadding:
                EdgeInsets.only(left: 50.0, right: 50.0, bottom: 2.0),
            padding: EdgeInsets.only(bottom: 20.0),
            tabs: [
              Tab(
                child: TitleText1(text: 'Chi phí', fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.bold, r: 255, g: 255, b: 255),
              ),
              Tab(
                child: TitleText1(text: 'Thu nhập', fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.bold, r: 255, g: 255, b: 255),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: TitleText1(text: 'Chi phí', fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.normal, r: 0, g: 0, b: 0)),
            Center(child: TitleText1(text: 'Thu nhập', fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.normal, r: 0, g: 0, b: 0)),
          ],
        ),
      ),
    );
  }
}
