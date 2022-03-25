import 'package:flutter/material.dart';
import 'package:flutterapp/money_managerapp/generatedaddtransactionwidget/generated/GeneratedDateWidget.dart';
import 'package:flutterapp/helpers/transform/transform.dart';
import 'package:flutterapp/money_managerapp/generatedaddtransactionwidget/generated/GeneratedDdmmWidget.dart';

/* Instance Button/Date/Selected
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedButtonDateSelectedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        width: 75.0,
        height: 48.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            overflow: Overflow.visible,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  color: Color.fromARGB(255, 70, 191, 140),
                ),
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
                      constraints.maxWidth * 0.6533333333333333;

                  final double height = constraints.maxHeight * 0.5;

                  return Stack(children: [
                    TransformHelper.translate(
                        x: constraints.maxWidth * 0.20666666666666667,
                        y: constraints.maxHeight * 0.10416666666666667,
                        z: 0,
                        child: Container(
                          width: width,
                          height: height,
                          child: GeneratedDdmmWidget(),
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
                      constraints.maxWidth * 0.8933333333333333;

                  final double height = constraints.maxHeight * 0.4375;

                  return Stack(children: [
                    TransformHelper.translate(
                        x: constraints.maxWidth * 0.06666666666666667,
                        y: constraints.maxHeight * 0.5,
                        z: 0,
                        child: Container(
                          width: width,
                          height: height,
                          child: GeneratedDateWidget(),
                        ))
                  ]);
                }),
              )
            ]),
      ),
    );
  }
}
