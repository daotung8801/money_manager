import 'package:flutter/material.dart';
import 'package:flutterapp/money_managerapp/generateddata2widget/generated/GeneratedText2Widget43.dart';
import 'package:flutterapp/helpers/transform/transform.dart';

/* Instance Text2
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedText2Widget42 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.0,
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
                final double width = constraints.maxWidth * 0.8863636363636364;

                final double height = constraints.maxHeight * 0.868421052631579;

                return Stack(children: [
                  TransformHelper.translate(
                      x: constraints.maxWidth * 0.11363636363636363,
                      y: constraints.maxHeight * 0.13157894736842105,
                      z: 0,
                      child: Container(
                        width: width,
                        height: height,
                        child: GeneratedText2Widget43(),
                      ))
                ]);
              }),
            )
          ]),
    );
  }
}
