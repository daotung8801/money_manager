import 'package:flutter/material.dart';
import 'package:money_manager/screens/Reminder.dart';

import 'TitleText1.dart';

class DoctorInfo extends StatelessWidget {
  String reminderName, note, time;
  double imageSize;
  Color bigBox;

  DoctorInfo({
    Key? key,
    required this.reminderName,
    required this.note,
    required this.imageSize,
    required this.time,
    required this.bigBox,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 320,
      height: 120,
      child: Row(children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 25, top: 26),
              child: TitleText1(
                  text: this.time,
                  fontFamily: 'Nunito Sans',
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  r: 255,
                  g: 255,
                  b: 255),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, top: 5),
              child: TitleText1(
                  text: this.reminderName,
                  fontFamily: 'Nunito Sans',
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  r: 255,
                  g: 255,
                  b: 255),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, top: 5),
              child: TitleText1(
                text: this.note,
                fontFamily: 'Nunito Sans',
                fontSize: 15,
                fontWeight: FontWeight.normal,
                r: 255,
                g: 255,
                b: 255,
              ),
            ),
          ],
        ),
      ]),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: this.bigBox,
      ),
    );
  }
}
