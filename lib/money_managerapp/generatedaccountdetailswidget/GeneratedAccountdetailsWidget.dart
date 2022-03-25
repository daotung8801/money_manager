import 'package:flutter/material.dart';
import 'package:flutterapp/helpers/transform/transform.dart';
import 'package:flutterapp/money_managerapp/generatedaccountdetailswidget/generated/GeneratedDetailsScrollableWidget.dart';
import 'package:flutterapp/money_managerapp/generatedaccountdetailswidget/generated/GeneratedBacksymbolWidget1.dart';
import 'package:flutterapp/money_managerapp/generatedaccountdetailswidget/generated/GeneratedSmallHeaderWidget1.dart';

/* Frame Account details
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedAccountdetailsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: ClipRRect(
      borderRadius: BorderRadius.zero,
      child: Container(
        width: 375.0,
        height: 812.0,
        child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            overflow: Overflow.visible,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.zero,
                child: Container(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                right: null,
                bottom: null,
                width: 375.0,
                height: 72.0,
                child: GeneratedSmallHeaderWidget1(),
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
                      constraints.maxWidth * 0.06666666666666667;

                  final double height =
                      constraints.maxHeight * 0.01847290640394089;

                  return Stack(children: [
                    TransformHelper.translate(
                        x: constraints.maxWidth * 0.08533333333333333,
                        y: constraints.maxHeight * 0.03571428571428571,
                        z: 0,
                        child: Container(
                          width: width,
                          height: height,
                          child: GeneratedBacksymbolWidget1(),
                        ))
                  ]);
                }),
              ),
              Positioned(
                left: 0.0,
                top: 72.0,
                right: null,
                bottom: null,
                width: 375.0,
                height: 740.0,
                child: GeneratedDetailsScrollableWidget(),
              )
            ]),
      ),
    ));
  }
}
