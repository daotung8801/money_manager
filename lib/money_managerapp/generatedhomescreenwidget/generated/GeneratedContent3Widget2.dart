import 'package:flutter/material.dart';
import 'package:flutterapp/money_managerapp/generatedhomescreenwidget/generated/GeneratedCategoryhorizontalWidget6.dart';
import 'package:flutterapp/money_managerapp/generatedhomescreenwidget/generated/Generated500000Widget17.dart';
import 'package:flutterapp/helpers/transform/transform.dart';
import 'package:flutterapp/money_managerapp/generatedhomescreenwidget/generated/Generated79Widget2.dart';

/* Instance Content/3
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedContent3Widget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, '/GeneratedAccountdetailsWidget'),
      child: Container(
        width: 323.0,
        height: 56.0,
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
                  color: Color.fromARGB(255, 255, 255, 255),
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
                      constraints.maxWidth * 0.4953560371517028;

                  final double height =
                      constraints.maxHeight * 0.5357142857142857;

                  return Stack(children: [
                    TransformHelper.translate(
                        x: constraints.maxWidth * 0.030959752321981424,
                        y: constraints.maxHeight * 0.23214285714285715,
                        z: 0,
                        child: Container(
                          width: width,
                          height: height,
                          child: GeneratedCategoryhorizontalWidget6(),
                        ))
                  ]);
                }),
              ),
              Positioned(
                left: null,
                top: null,
                right: 102.0,
                bottom: null,
                width: 42.0,
                height: 22.0,
                child: TransformHelper.translate(
                    x: 0.00, y: 2.50, z: 0, child: Generated79Widget2()),
              ),
              Positioned(
                left: null,
                top: null,
                right: 5.0,
                bottom: null,
                width: 93.0,
                height: 19.0,
                child: TransformHelper.translate(
                    x: 0.00, y: 1.00, z: 0, child: Generated500000Widget17()),
              )
            ]),
      ),
    );
  }
}
