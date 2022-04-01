import 'package:flutter/material.dart';
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
      required this.height})
      : super(key: key);

  String text;
  int r, g, b;
  double radius;
  double height, weight;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: this.weight,
      height: this.height,
      child: RaisedButton(
        onPressed: () {
          print('Raise button');
        },
        child: TitleText1(text: this.text, fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.bold, r: 255, g: 255, b: 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(this.radius)),
        ),
        color: Color.fromARGB(255, this.r, this.g, this.b),
      ),
    );
  }
}