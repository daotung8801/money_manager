import 'package:flutter/material.dart';
import 'package:money_manager/screens/HomeScreen.dart';
import '../screens/Reminder.dart';
import 'TitleText1.dart';

class ButtonPrimary extends StatelessWidget {
  ButtonPrimary(
      {Key? key,
      required this.text,
      required this.r,
      required this.g,
      required this.b,
      required this.radius,
      required this.weight,
      required this.height,
      required this.screenName})
      : super(key: key);

  String text;
  int r, g, b;
  double radius;
  double height, weight;
  String screenName;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: this.weight,
      height: this.height,
      child: RaisedButton(
        onPressed: () {
          // if (this.screenName == 'CreateReminder') {
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => Reminder()));
          // }
          if(this.screenName == 'LoginScreen') {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(title: 'Ngân sách')));
          }
        },
        child: TitleText1(
            text: this.text,
            fontFamily: 'Inter',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            r: 255,
            g: 255,
            b: 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(this.radius)),
        ),
        color: Color.fromARGB(255, this.r, this.g, this.b),
      ),
    );
  }
}
