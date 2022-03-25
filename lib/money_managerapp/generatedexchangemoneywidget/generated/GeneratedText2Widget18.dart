import 'package:flutter/material.dart';
import 'package:flutterapp/helpers/transform/transform.dart';
import 'package:flutterapp/money_managerapp/generatedexchangemoneywidget/generated/GeneratedText2Widget19.dart';

/* Instance Text2
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedText2Widget18 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 133.0,
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
                final double width = constraints.maxWidth * 0.9398496240601504;

                final double height =
                    constraints.maxHeight * 0.7894736842105263;

                return Stack(children: [
                  TransformHelper.translate(
                      x: constraints.maxWidth * 0.03759398496240601,
                      y: constraints.maxHeight * 0.13157894736842105,
                      z: 0,
                      child: Container(
                        width: width,
                        height: height,
                        child: GeneratedText2Widget19(),
                      ))
                ]);
              }),
            )
          ]),
    );
  }
}
