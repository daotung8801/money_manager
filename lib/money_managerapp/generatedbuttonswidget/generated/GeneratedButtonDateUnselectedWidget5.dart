import 'package:flutter/material.dart';
import 'package:flutterapp/money_managerapp/generatedbuttonswidget/generated/GeneratedDdmmWidget6.dart';
import 'package:flutterapp/money_managerapp/generatedbuttonswidget/generated/GeneratedDateWidget9.dart';
import 'package:flutterapp/helpers/transform/transform.dart';

/* Instance Button/Date/Unselected
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedButtonDateUnselectedWidget5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        width: 119.0,
        height: 48.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
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
                  final double width =
                      constraints.maxWidth * 0.4957983193277311;

                  final double height = constraints.maxHeight * 0.5;

                  return Stack(children: [
                    TransformHelper.translate(
                        x: constraints.maxWidth * 0.27310924369747897,
                        y: constraints.maxHeight * 0.10416666666666667,
                        z: 0,
                        child: Container(
                          width: width,
                          height: height,
                          child: GeneratedDdmmWidget6(),
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
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  final double width =
                      constraints.maxWidth * 0.9327731092436975;

                  final double height = constraints.maxHeight * 0.4375;

                  return Stack(children: [
                    TransformHelper.translate(
                        x: constraints.maxWidth * 0.04201680672268908,
                        y: constraints.maxHeight * 0.5,
                        z: 0,
                        child: Container(
                          width: width,
                          height: height,
                          child: GeneratedDateWidget9(),
                        ))
                  ]);
                }),
              )
            ]),
      ),
    );
  }
}
