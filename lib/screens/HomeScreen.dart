import 'package:flutter/material.dart';
import '../components/BudgetTaskBar.dart';
import '../components/NavigationDrawerWidget.dart';
import '../components/PopUpRatingApp.dart';
import '../components/ExpenseTabBar.dart';
import '../components/InComeTabBar.dart';
import '../components/PopUpNotification1.dart';
import '../components/SearchItem.dart';
import '../components/TitleText1.dart';
import 'package:share/share.dart';

import 'ExchangeMoney.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.only(left: 0, bottom: 10),
                    iconSize: 30,
                    icon: Icon(Icons.menu),
                    tooltip: 'Menu',
                    onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 80, bottom: 10),
                    child: TitleText1(
                        text: 'Ngân sách',
                        fontFamily: 'Inter',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        r: 255,
                        g: 255,
                        b: 255),
                  ),
                  IconButton(
                    padding: EdgeInsets.only(left: 70, bottom: 10),
                    iconSize: 30,
                    icon: Image.asset("assets/ngansach.png"),
                    tooltip: 'Tìm kiếm',
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ExchangeMoney(title: 'Nhắc nhở'))),
                    },
                  ),
                ]),
            Padding(
              padding: EdgeInsets.only(left: 16, top: 20),
              child: TitleText1(
                  text: 'Hôm nay',
                  fontFamily: 'Inter',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  r: 198,
                  g: 198,
                  b: 198),
            ),
            Padding(
              padding: EdgeInsets.only(left: 18, top: 25),
              child: TitleText1(
                  text: '–5,450,000 đ',
                  fontFamily: 'Inter',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  r: 255,
                  g: 255,
                  b: 255),
            ),
            Padding(
              padding: EdgeInsets.only(left: 18, top: 10),
              child: TitleText1(
                  text: 'Số dư khả dụng: 122,540,000 đ',
                  fontFamily: 'Inter',
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  r: 255,
                  g: 255,
                  b: 255),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 220,
        elevation: 0.0,
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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          BudgetTaskBar(),
        ],
      ),
    );
  }
}
