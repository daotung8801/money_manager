import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  Category({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
                'Danh mục',
                style: TextStyle(fontFamily: "Inter", fontSize: 25),
            ),
            backgroundColor: Colors.transparent,
            toolbarHeight: 100,
            elevation: 0.0,
            leading: IconButton(
              padding: EdgeInsets.only(left: 32),
              iconSize: 30,
              icon: Icon(Icons.menu),
              onPressed: () => {},
            ),
            actions: <Widget>[
              IconButton(
                padding: EdgeInsets.only(right: 5),
                iconSize: 30,
                icon: Icon(Icons.search),
                tooltip: 'Tìm kiếm',
                onPressed: () => {},
              ),
              IconButton(
                padding: EdgeInsets.only(right: 20),
                iconSize: 30,
                icon: Icon(Icons.download),
                tooltip: 'Tải xuống',
                onPressed: () => {},
              ),
            ],
            flexibleSpace: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(1000, 35, 111, 87),
                        Color.fromARGB(1000, 35, 111, 87)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                ),
            ),
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 4,
              indicatorPadding: EdgeInsets.only(left: 45.0, right: 45.0, bottom: 5.0),
              padding: EdgeInsets.only(bottom: 25.0),
              tabs: [
                Tab(
                  child: Text(
                    "Chi phí",
                    style: TextStyle(fontFamily: "Inter", fontSize: 18),
                  ),
                ),
                Tab(
                  child: Text(
                    "Thu nhập",
                    style: TextStyle(fontFamily: "Inter", fontSize: 18),
                  ),
                ),
              ],
            ),
        ),
        body: TabBarView (
          children: [
            buildPage('Chi Phí'),
            buildPage('Thu nhập'),
          ],
        ),
      ),
    );
  }
  Widget buildPage(String text) => Center(
    child: Text(
      text,
      style: TextStyle(fontFamily: "Inter", fontSize: 18),
    )
  );
}
