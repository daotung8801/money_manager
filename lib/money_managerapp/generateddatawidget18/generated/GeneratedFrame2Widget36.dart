import 'package:flutter/material.dart';
import 'package:flutterapp/money_managerapp/generateddatawidget18/generated/GeneratedIcon2mediumWidget52.dart';
import 'package:flutterapp/money_managerapp/generateddatawidget18/generated/GeneratedRectangle358Widget21.dart';
import 'package:flutterapp/helpers/transform/transform.dart';
import 'package:flutterapp/money_managerapp/generateddatawidget18/generated/GeneratedGiitrWidget51.dart';

/* Frame Frame 2
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedFrame2Widget36 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.zero,
      child: Container(
        width: 281.0,
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
                width: 15.0,
                height: 15.0,
                child: GeneratedIcon2mediumWidget52(),
              ),
              Positioned(
                left: 38.0,
                top: null,
                right: null,
                bottom: null,
                width: 245.0,
                height: 21.0,
                child: TransformHelper.translate(
                    x: 0.00, y: 1.50, z: 0, child: GeneratedGiitrWidget51()),
              ),
              Positioned(
                left: 0.0,
                top: 4.0,
                right: null,
                bottom: null,
                width: 22.0,
                height: 22.0,
                child: GeneratedRectangle358Widget21(),
              )
            ]),
      ),
    );
  }
}
