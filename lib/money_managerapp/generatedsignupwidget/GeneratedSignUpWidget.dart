import 'package:flutter/material.dart';
import 'package:flutterapp/helpers/transform/transform.dart';
import 'package:flutterapp/money_managerapp/generatedsignupwidget/generated/GeneratedInputTextWidget.dart';
import 'package:flutterapp/money_managerapp/generatedsignupwidget/generated/GeneratedInputTextWidget2.dart';
import 'package:flutterapp/money_managerapp/generatedsignupwidget/generated/GeneratedngnhpviWidget.dart';
import 'package:flutterapp/money_managerapp/generatedsignupwidget/generated/Generated3rdSignInWidget.dart';
import 'package:flutterapp/money_managerapp/generatedsignupwidget/generated/GeneratedIOSStatusBarBlackWidget.dart';
import 'package:flutterapp/money_managerapp/generatedsignupwidget/generated/GeneratedCheckboxOptionEmptyWidget.dart';
import 'package:flutterapp/money_managerapp/generatedsignupwidget/generated/GeneratedButtonPrimaryWidget.dart';
import 'package:flutterapp/money_managerapp/generatedsignupwidget/generated/GeneratedInputTextWidget1.dart';
import 'package:flutterapp/money_managerapp/generatedsignupwidget/generated/GeneratedPageHeaderWidget.dart';

/* Frame Sign Up
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedSignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: ClipRRect(
      borderRadius: BorderRadius.zero,
      child: Container(
        width: 375.0,
        height: 812.0,
        child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            overflow: Overflow.visible,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.zero,
                child: Container(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: null,
                width: null,
                height: 44.0,
                child: GeneratedIOSStatusBarBlackWidget(),
              ),
              Positioned(
                left: 16.0,
                top: 60.0,
                right: 16.0,
                bottom: null,
                width: null,
                height: 36.0,
                child: GeneratedPageHeaderWidget(),
              ),
              Positioned(
                left: 16.0,
                top: 128.0,
                right: 16.0,
                bottom: null,
                width: null,
                height: 50.0,
                child: GeneratedInputTextWidget(),
              ),
              Positioned(
                left: 16.0,
                top: 194.0,
                right: 16.0,
                bottom: null,
                width: null,
                height: 50.0,
                child: GeneratedInputTextWidget1(),
              ),
              Positioned(
                left: 16.0,
                top: 260.0,
                right: 16.0,
                bottom: null,
                width: null,
                height: 50.0,
                child: GeneratedInputTextWidget2(),
              ),
              Positioned(
                left: 16.0,
                top: 342.0,
                right: 16.0,
                bottom: null,
                width: null,
                height: 17.0,
                child: GeneratedCheckboxOptionEmptyWidget(),
              ),
              Positioned(
                left: 16.0,
                top: null,
                right: 16.0,
                bottom: 342.0,
                width: null,
                height: 51.0,
                child: GeneratedButtonPrimaryWidget(),
              ),
              Positioned(
                left: null,
                top: null,
                right: null,
                bottom: 191.0,
                width: 112.0,
                height: 21.0,
                child: TransformHelper.translate(
                    x: 0.50, y: 0.00, z: 0, child: GeneratedngnhpviWidget()),
              ),
              Positioned(
                left: 93.0,
                top: 630.0,
                right: null,
                bottom: null,
                width: 190.0,
                height: 100.0,
                child: Generated3rdSignInWidget(),
              )
            ]),
      ),
    ));
  }
}
