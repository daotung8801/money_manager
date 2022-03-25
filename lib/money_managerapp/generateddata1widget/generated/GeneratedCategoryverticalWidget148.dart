import 'package:flutter/material.dart';
import 'package:flutterapp/money_managerapp/generateddata1widget/generated/GeneratedIcon2bigWidget148.dart';
import 'package:flutterapp/money_managerapp/generateddata1widget/generated/GeneratedTextWidget149.dart';
import 'package:flutterapp/helpers/transform/transform.dart';

/* Instance Category/vertical
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedCategoryverticalWidget148 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      height: 70.0,
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
                final double width = constraints.maxWidth * 0.6857142857142857;

                final double height =
                    constraints.maxHeight * 0.6857142857142857;

                return Stack(children: [
                  TransformHelper.translate(
                      x: constraints.maxWidth * 0.15714285714285714,
                      y: 0,
                      z: 0,
                      child: Container(
                        width: width,
                        height: height,
                        child: GeneratedIcon2bigWidget148(),
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
                final double width = constraints.maxWidth * 1.0285714285714285;

                final double height =
                    constraints.maxHeight * 0.3142857142857143;

                return Stack(children: [
                  TransformHelper.translate(
                      x: 0,
                      y: constraints.maxHeight * 0.7142857142857143,
                      z: 0,
                      child: Container(
                        width: width,
                        height: height,
                        child: GeneratedTextWidget149(),
                      ))
                ]);
              }),
            )
          ]),
    );
  }
}
