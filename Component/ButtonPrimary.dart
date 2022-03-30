import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  ButtonPrimary({Key? key, required this.text, required this.r, required this.g, required this.b, required this.radius, required this.weight, required this.height}) : super(key: key);
  String text;
  int r, g, b;
  double radius;
  double height, weight;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox (
      width: this.weight,
      height: this.height,
      child:RaisedButton(
        onPressed: () {
          print('Raise button');
        },
        child: Text(
          this.text,
          style: TextStyle(fontFamily: 'Inter', fontSize: 18, color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(this.radius)),
        ),
        color: Color.fromARGB(255, this.r, this.g, this.b),
      ),
    );
  }
}
