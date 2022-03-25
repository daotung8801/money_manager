import 'package:flutter/material.dart';
import 'package:flutterapp/helpers/transform/transform.dart';
import 'package:flutterapp/money_managerapp/generatedbuttonswidget/generated/GeneratedDateWidget8.dart';
import 'package:flutterapp/money_managerapp/generatedbuttonswidget/generated/GeneratedDdmmWidget5.dart';

/* Instance Button/Date/Unselected
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedButtonDateUnselectedWidget4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        width: 76.0,
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
                      constraints.maxWidth * 0.7763157894736842;

                  final double height = constraints.maxHeight * 0.5;

                  return Stack(children: [
                    TransformHelper.translate(
                        x: constraints.maxWidth * 0.14473684210526316,
                        y: constraints.maxHeight * 0.10416666666666667,
                        z: 0,
                        child: Container(
                          width: width,
                          height: height,
                          child: GeneratedDdmmWidget5(),
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
                      constraints.maxWidth * 0.8947368421052632;

                  final double height = constraints.maxHeight * 0.4375;

                  return Stack(children: [
                    TransformHelper.translate(
                        x: constraints.maxWidth * 0.06578947368421052,
                        y: constraints.maxHeight * 0.5,
                        z: 0,
                        child: Container(
                          width: width,
                          height: height,
                          child: GeneratedDateWidget8(),
                        ))
                  ]);
                }),
              )
            ]),
      ),
    );
  }
}
