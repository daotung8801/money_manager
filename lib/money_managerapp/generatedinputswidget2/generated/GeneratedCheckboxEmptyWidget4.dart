import 'package:flutter/material.dart';
import 'package:flutterapp/money_managerapp/generatedinputswidget2/generated/GeneratedBGWidget27.dart';
import 'package:flutterapp/helpers/transform/transform.dart';
import 'package:flutterapp/money_managerapp/generatedinputswidget2/generated/GeneratedIconCheckmarkWidget8.dart';

/* Instance Checkbox/Empty
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedCheckboxEmptyWidget4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16.0,
      height: 16.0,
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
                final double width = constraints.maxWidth;

                final double height = constraints.maxHeight;

                return Stack(children: [
                  TransformHelper.translate(
                      x: 0,
                      y: 0,
                      z: 0,
                      child: Container(
                        width: width,
                        height: height,
                        child: GeneratedBGWidget27(),
                      ))
                ]);
              }),
            ),
            Positioned(
              left: 4.0,
              top: 4.0,
              right: null,
              bottom: null,
              width: 8.0,
              height: 7.0,
              child: GeneratedIconCheckmarkWidget8(),
            )
          ]),
    );
  }
}
