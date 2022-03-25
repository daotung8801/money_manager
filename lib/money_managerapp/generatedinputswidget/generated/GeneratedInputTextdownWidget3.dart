import 'package:flutter/material.dart';
import 'package:flutterapp/helpers/transform/transform.dart';
import 'package:flutterapp/money_managerapp/generatedinputswidget/generated/GeneratedInputTextdownWidget5.dart';
import 'package:flutterapp/money_managerapp/generatedinputswidget/generated/GeneratedInputTextdownWidget4.dart';

/* Component Input/Text-down
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedInputTextdownWidget3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.0,
      height: 68.0,
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
                final double width = constraints.maxWidth * 1.0145772594752187;

                final double height =
                    constraints.maxHeight * 0.3382352941176471;

                return Stack(children: [
                  TransformHelper.translate(
                      x: 0,
                      y: constraints.maxHeight * 0.7352941176470589,
                      z: 0,
                      child: Container(
                        width: width,
                        height: height,
                        child: GeneratedInputTextdownWidget4(),
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
                final double width = constraints.maxWidth;

                final double height =
                    constraints.maxHeight * 0.7352941176470589;

                return Stack(children: [
                  TransformHelper.translate(
                      x: 0,
                      y: 0,
                      z: 0,
                      child: Container(
                        width: width,
                        height: height,
                        child: GeneratedInputTextdownWidget5(),
                      ))
                ]);
              }),
            )
          ]),
    );
  }
}
