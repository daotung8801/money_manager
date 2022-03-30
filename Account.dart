import 'package:flutter/material.dart';

import 'Component/ButtonPrimary.dart';
import 'Component/TitleText1.dart';

class Account extends StatelessWidget {
  Account({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: TitleText1(text: 'Tài khoản', fontFamily: 'Inter', fontSize: 25, fontWeight: FontWeight.bold),
        backgroundColor: Colors.transparent,
        toolbarHeight: 72,
        elevation: 0.0,
        leading: IconButton(
          padding: EdgeInsets.only(left: 32),
          iconSize: 30,
          alignment: Alignment.center,
          icon: Icon(Icons.menu),
          onPressed: () => {},
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 35, 111, 87),
                Color.fromARGB(255, 35, 111, 87)
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text(
                'Tổng cộng',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    color: Color.fromARGB(255, 127, 130, 103)),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: TitleText1(text: '20,000,000 đ', fontFamily: 'Inter', fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Row(children: [
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: 80, top: 15),
                child: SizedBox(
                  width: 55,
                  height: 55,
                  child: RaisedButton(
                    onPressed: () {
                      print('Raise button');
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 1000),
                      child: Icon(Icons.history, size: 30),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    color: Color.fromARGB(255, 70, 191, 140),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 100, top: 15),
              child: SizedBox(
                width: 52,
                height: 52,
                child: RaisedButton(
                  onPressed: () {
                    print('Raise button');
                  },
                  child: Text(
                    '⇄',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Inter', fontSize: 35, color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  color: Color.fromARGB(255, 70, 191, 140),
                ),
              ),
            ),
          ]),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 50),
              child: SizedBox(
                width: 344,
                height: 53,
                child: RaisedButton.icon(
                  onPressed: () {
                    print('Raise button');
                  },
                  icon: Icon(Icons.attach_money),
                  label: Text(
                    'Chính            20,000,000 đ',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        color: Color.fromARGB(255, 127, 130, 103)),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  color: Color.fromARGB(255, 248, 248, 248),
                  elevation: 0.5,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 250),
              child: SizedBox (
                width: 93,
                height: 51,
                child: ButtonPrimary(text: 'Thêm', r: 35, g: 111, b: 87, radius: 30, weight: 109, height: 51,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
