import 'package:flutter/material.dart';
import 'package:flutterapp/helpers/transform/transform.dart';
import 'package:flutterapp/money_managerapp/generatedcolumnchartwidget/generated/GeneratedTaskbarModeWidget9.dart';

/* Instance Task-bar/Mode
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedTaskbarModeWidget8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 122.5680923461914,
      height: 29.0,
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
                final double width = constraints.maxWidth * 1.0163174604557852;

                final double height =
                    constraints.maxHeight * 1.0689655172413792;

                return Stack(children: [
                  TransformHelper.translate(
                      x: 0,
                      y: 0,
                      z: 0,
                      child: Container(
                        width: width,
                        height: height,
                        child: GeneratedTaskbarModeWidget9(),
                      ))
                ]);
              }),
            )
          ]),
    );
  }
}
