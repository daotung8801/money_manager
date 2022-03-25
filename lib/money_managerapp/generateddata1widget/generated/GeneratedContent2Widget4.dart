import 'package:flutter/material.dart';
import 'package:flutterapp/money_managerapp/generateddata1widget/generated/GeneratedDanhmcWidget7.dart';
import 'package:flutterapp/helpers/transform/transform.dart';
import 'package:flutterapp/money_managerapp/generateddata1widget/generated/GeneratedCategoryhorizontalWidget30.dart';

/* Instance Content/2
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedContent2Widget4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 178.0,
      height: 73.0,
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
                final double width = constraints.maxWidth * 0.4348443277766196;

                final double height =
                    constraints.maxHeight * 0.2328767123287671;

                return Stack(children: [
                  TransformHelper.translate(
                      x: 0,
                      y: constraints.maxHeight * 0.136986301369863,
                      z: 0,
                      child: Container(
                        width: width,
                        height: height,
                        child: GeneratedDanhmcWidget7(),
                      ))
                ]);
              }),
            ),
            Positioned(
              left: 0.0,
              top: 33.0,
              right: null,
              bottom: null,
              width: 178.0,
              height: 30.0,
              child: GeneratedCategoryhorizontalWidget30(),
            )
          ]),
    );
  }
}
