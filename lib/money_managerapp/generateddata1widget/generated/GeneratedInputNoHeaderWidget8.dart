import 'package:flutter/material.dart';
import 'package:flutterapp/money_managerapp/generateddata1widget/generated/GeneratedBGWidget40.dart';
import 'package:flutterapp/money_managerapp/generateddata1widget/generated/GeneratedTnWidget15.dart';
import 'package:flutterapp/helpers/transform/transform.dart';
import 'package:flutterapp/money_managerapp/generateddata1widget/generated/GeneratedXemWidget25.dart';

/* Instance Input/No Header
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedInputNoHeaderWidget8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.0,
      height: 50.0,
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
                double percentWidth = 1.0;
                double scaleX = (constraints.maxWidth * percentWidth) / 343.0;

                double percentHeight = 1.0;
                double scaleY = (constraints.maxHeight * percentHeight) / 50.0;

                return Stack(children: [
                  TransformHelper.translateAndScale(
                      translateX: 0,
                      translateY: 0,
                      translateZ: 0,
                      scaleX: scaleX,
                      scaleY: scaleY,
                      scaleZ: 1,
                      child: GeneratedBGWidget40())
                ]);
              }),
            ),
            Positioned(
              left: 16.0,
              top: null,
              right: null,
              bottom: null,
              width: 145.0,
              height: 21.0,
              child: TransformHelper.translate(
                  x: 0.00, y: 1.50, z: 0, child: GeneratedTnWidget15()),
            ),
            Positioned(
              left: null,
              top: null,
              right: 11.0,
              bottom: null,
              width: 39.0,
              height: 24.0,
              child: TransformHelper.translate(
                  x: 0.00, y: 3.00, z: 0, child: GeneratedXemWidget25()),
            )
          ]),
    );
  }
}
