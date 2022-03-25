import 'package:flutter/material.dart';
import 'package:flutterapp/money_managerapp/generatedexchangemoneywidget/generated/GeneratedLine2Widget3.dart';
import 'package:flutterapp/money_managerapp/generatedexchangemoneywidget/generated/GeneratedTaskbarModeWidget14.dart';
import 'package:flutterapp/money_managerapp/generatedexchangemoneywidget/generated/GeneratedTaskbarModeWidget16.dart';
import 'package:flutterapp/helpers/transform/transform.dart';

/* Instance Small-Task-bar/Mode
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedSmallTaskbarModeWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 201.0,
      height: 29.0,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          overflow: Overflow.visible,
          children: [
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                final double width = constraints.maxWidth * 0.417910447761194;

                final double height = constraints.maxHeight;

                return Stack(children: [
                  TransformHelper.translate(
                      x: 0,
                      y: 0,
                      z: 0,
                      child: Container(
                        width: width,
                        height: height,
                        child: GeneratedTaskbarModeWidget14(),
                      ))
                ]);
              }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                final double width = constraints.maxWidth * 0.417910447761194;

                final double height = constraints.maxHeight;

                return Stack(children: [
                  TransformHelper.translate(
                      x: constraints.maxWidth * 0.8557213930348259,
                      y: 0,
                      z: 0,
                      child: Container(
                        width: width,
                        height: height,
                        child: GeneratedTaskbarModeWidget16(),
                      ))
                ]);
              }),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                double percentWidth = 0.373134328358209;
                double scaleX = (constraints.maxWidth * percentWidth) / 75.0;

                return Stack(children: [
                  TransformHelper.translateAndScale(
                      translateX: constraints.maxWidth * 0.024875621890547265,
                      translateY: constraints.maxHeight * 1.0,
                      translateZ: 0,
                      scaleX: scaleX,
                      scaleY: 1,
                      scaleZ: 1,
                      child: GeneratedLine2Widget3())
                ]);
              }),
            )
          ]),
    );
  }
}
