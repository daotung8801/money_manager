import 'package:flutter/material.dart';
import 'package:flutterapp/helpers/transform/transform.dart';
import 'package:flutterapp/money_managerapp/generatedaddtransactionwidget/generated/Generated200000Widget3.dart';
import 'package:flutterapp/money_managerapp/generatedaddtransactionwidget/generated/GeneratedStinWidget3.dart';

/* Instance Content/1
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedContent1Widget3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.0,
      height: 62.0,
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
                final double width = constraints.maxWidth * 1.0058309037900874;

                final double height =
                    constraints.maxHeight * 0.27419354838709675;

                return Stack(children: [
                  TransformHelper.translate(
                      x: 0,
                      y: constraints.maxHeight * 0.16129032258064516,
                      z: 0,
                      child: Container(
                        width: width,
                        height: height,
                        child: GeneratedStinWidget3(),
                      ))
                ]);
              }),
            ),
            Positioned(
              left: 0.0,
              top: null,
              right: null,
              bottom: null,
              width: 84.0,
              height: 21.0,
              child: TransformHelper.translate(
                  x: 0.00, y: 12.50, z: 0, child: Generated200000Widget3()),
            )
          ]),
    );
  }
}
