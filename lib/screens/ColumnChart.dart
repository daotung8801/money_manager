import 'package:flutter/material.dart';
import '../components/ColumnChartExpenseTabBar.dart';
import '../components/ColumnChartGeneralTabBar.dart';
import '../components/ColumnChartInComeTabBar.dart';
import '../components/NavigationDrawerWidget.dart';
import '../components/TitleText1.dart';

class ColumnChart extends StatelessWidget {
  ColumnChart ({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(top: 10),
            child: TitleText1(text: 'Biểu đồ', fontFamily: 'Inter', fontSize: 25, fontWeight: FontWeight.bold, r: 255, g: 255, b: 255),
          ),
          backgroundColor: Colors.transparent,
          toolbarHeight: 100,
          elevation: 0.0,
          leading: Builder(
            builder: (context) => Container(
              child: IconButton(
                padding: EdgeInsets.only(left: 32, top: 10),
                iconSize: 30,
                icon: Icon(Icons.menu),
                tooltip: 'Menu',
                onPressed: () => {Scaffold.of(context).openDrawer()},
              ),
            ),
          ),
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
            indicatorPadding: EdgeInsets.only(left: 25.0, right: 25.0, bottom: 2.0),
            padding: EdgeInsets.only(bottom: 20.0),
            tabs: [
              Tab(
                child: TitleText1(text: 'Chung', fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.bold, r: 255, g: 255, b: 255),
              ),
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
            ColumnChartGeneralTabBar(),
            ColumnChartExpenseTabBar(),
            ColumnChartInComeTabBar(),
          ],
        ),
      ),
    );
  }
}