import 'package:flutter/material.dart';
import 'package:flutterapp/money_managerapp/generatedaddaccountwidget/generated/GeneratedBGWidget13.dart';
import 'package:flutterapp/money_managerapp/generatedaddaccountwidget/generated/GeneratedXemWidget12.dart';
import 'package:flutterapp/helpers/transform/transform.dart';
import 'package:flutterapp/money_managerapp/generatedaddaccountwidget/generated/Generated0Widget1.dart';

/* Frame Input/No Header
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedInputNoHeaderWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.zero,
      child: Container(
        width: 111.0,
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
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  double percentWidth = 1.0;
                  double scaleX = (constraints.maxWidth * percentWidth) / 111.0;

                  double percentHeight = 1.0;
                  double scaleY =
                      (constraints.maxHeight * percentHeight) / 50.0;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX: 0,
                        translateY: 0,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: GeneratedBGWidget13())
                  ]);
                }),
              ),
              Positioned(
                left: null,
                top: null,
                right: -5.0,
                bottom: null,
                width: 20.0,
                height: 34.0,
                child: TransformHelper.translate(
                    x: 0.00, y: 2.00, z: 0, child: Generated0Widget1()),
              ),
              Positioned(
                left: null,
                top: null,
                right: 11.0,
                bottom: null,
                width: 39.0,
                height: 24.0,
                child: TransformHelper.translate(
                    x: 0.00, y: 3.00, z: 0, child: GeneratedXemWidget12()),
              )
            ]),
      ),
    );
  }
}
