import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      this.fontSize = 18,
      required this.screenName})
      : super(key: key);

  double fontSize;
  String text;
  int r, g, b;
  double radius;
  double height, weight;
  String screenName;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: weight.w,
      height: height.h,
      child: RaisedButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius.r)),
        ),
        color: Color.fromARGB(255, r, g, b),
        child: TitleText1(
            text: text,
            fontFamily: 'Inter',
            fontSize: fontSize.sp,
            fontWeight: FontWeight.bold,
            r: 255,
            g: 255,
            b: 255),
      ),
    );
  }
}
