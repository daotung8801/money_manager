import 'package:flutter/material.dart';
import 'package:flutterapp/helpers/transform/transform.dart';
import 'package:flutterapp/money_managerapp/generateddata2widget/generated/GeneratedText2Widget35.dart';

/* Component Text2
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedText2Widget34 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 47.0,
      height: 38.0,
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
                final double width = constraints.maxWidth * 0.8936170212765957;

                final double height = constraints.maxHeight * 0.868421052631579;

                return Stack(children: [
                  TransformHelper.translate(
                      x: constraints.maxWidth * 0.10638297872340426,
                      y: constraints.maxHeight * 0.13157894736842105,
                      z: 0,
                      child: Container(
                        width: width,
                        height: height,
                        child: GeneratedText2Widget35(),
                      ))
                ]);
              }),
            )
          ]),
    );
  }
}
