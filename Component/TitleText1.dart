import 'package:flutter/material.dart';

class TitleText1 extends StatelessWidget {
  TitleText1({Key? key, required this.text, required this.fontFamily, required this.fontSize, required this.fontWeight}) : super(key: key);
  String text, fontFamily;
  double fontSize;
  FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      this.text,
      style: TextStyle(fontFamily: this.fontFamily, fontSize: this.fontSize, fontWeight: this.fontWeight),
    );
  }
}
