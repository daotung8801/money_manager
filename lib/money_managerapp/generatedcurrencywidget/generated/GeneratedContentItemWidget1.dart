import 'package:flutter/material.dart';
import 'package:flutterapp/money_managerapp/generatedcurrencywidget/generated/GeneratedDataWidget1.dart';
import 'package:flutterapp/helpers/transform/transform.dart';
import 'package:flutterapp/money_managerapp/generatedcurrencywidget/generated/GeneratedDataNoiconWidget1.dart';

/* Instance Content/Item
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedContentItemWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.0,
      height: 24.0,
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
                final double width = constraints.maxWidth * 0.33527696793002915;

                final double height =
                    constraints.maxHeight * 0.4166666666666667;

                return Stack(children: [
                  TransformHelper.translate(
                      x: 0,
                      y: 0,
                      z: 0,
                      child: Container(
                        width: width,
                        height: height,
                        child: GeneratedDataNoiconWidget1(),
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

                final double height = constraints.maxHeight;

                return Stack(children: [
                  TransformHelper.translate(
                      x: 0,
                      y: 0,
                      z: 0,
                      child: Container(
                        width: width,
                        height: height,
                        child: GeneratedDataWidget1(),
                      ))
                ]);
              }),
            )
          ]),
    );
  }
}
