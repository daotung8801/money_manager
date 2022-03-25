import 'package:flutter/material.dart';
import 'package:flutterapp/money_managerapp/generatedinputswidget2/generated/GeneratedIconCheckmarkWidget9.dart';
import 'package:flutterapp/helpers/transform/transform.dart';

/* Instance Icon/Checkmark
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedIconCheckmarkWidget8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: false,
      child: Container(
        width: 8.0,
        height: 7.0,
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
                  double percentWidth = 0.8999999761581421;
                  double scaleX =
                      (constraints.maxWidth * percentWidth) / 7.199999809265137;

                  double percentHeight = 0.875;
                  double scaleY =
                      (constraints.maxHeight * percentHeight) / 6.125;

                  return Stack(children: [
                    TransformHelper.translateAndScale(
                        translateX: 0,
                        translateY: constraints.maxHeight * 0.125,
                        translateZ: 0,
                        scaleX: scaleX,
                        scaleY: scaleY,
                        scaleZ: 1,
                        child: GeneratedIconCheckmarkWidget9())
                  ]);
                }),
              )
            ]),
      ),
    );
  }
}
