import 'package:flutter/material.dart';
import 'package:flutterapp/money_managerapp/generatedexchangemoneywidget/generated/GeneratedGiitrWidget12.dart';
import 'package:flutterapp/money_managerapp/generatedexchangemoneywidget/generated/GeneratedIcon2smallWidget12.dart';
import 'package:flutterapp/money_managerapp/generatedexchangemoneywidget/generated/GeneratedIcon2mediumWidget13.dart';
import 'package:flutterapp/helpers/transform/transform.dart';

/* Instance Frame 2
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedFrame2Widget8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.zero,
      child: Container(
        width: 188.0,
        height: 30.0,
        child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            overflow: Overflow.visible,
            children: [
              Positioned(
                left: 0.0,
                top: 0.0,
                right: null,
                bottom: null,
                width: 30.0,
                height: 30.0,
                child: GeneratedIcon2mediumWidget13(),
              ),
              Positioned(
                left: 40.0,
                top: null,
                right: null,
                bottom: null,
                width: 50.0,
                height: 20.0,
                child: TransformHelper.translate(
                    x: 0.00, y: 1.00, z: 0, child: GeneratedGiitrWidget12()),
              ),
              Positioned(
                left: 22.0,
                top: 15.0,
                right: null,
                bottom: null,
                width: 15.0,
                height: 15.0,
                child: GeneratedIcon2smallWidget12(),
              )
            ]),
      ),
    );
  }
}
