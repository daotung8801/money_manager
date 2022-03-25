import 'package:flutter/material.dart';
import 'package:flutterapp/money_managerapp/generatedaccountdetailswidget/generated/GeneratedIcon2mediumWidget.dart';
import 'package:flutterapp/money_managerapp/generatedaccountdetailswidget/generated/GeneratedIcon2smallWidget.dart';
import 'package:flutterapp/helpers/transform/transform.dart';
import 'package:flutterapp/money_managerapp/generatedaccountdetailswidget/generated/GeneratedGiitrWidget.dart';

/* Instance Category/horizontal
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedCategoryhorizontalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.zero,
      child: Container(
        width: 178.0,
        height: 30.0,
        child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            overflow: Overflow.visible,
            children: [
              Positioned(
                left: 0.0,
                top: 0.0,
                right: null,
                bottom: null,
                width: 30.0,
                height: 30.0,
                child: GeneratedIcon2mediumWidget(),
              ),
              Positioned(
                left: 40.0,
                top: null,
                right: null,
                bottom: null,
                width: 48.0,
                height: 23.0,
                child: TransformHelper.translate(
                    x: 0.00, y: 2.50, z: 0, child: GeneratedGiitrWidget()),
              ),
              Positioned(
                left: 22.0,
                top: 15.0,
                right: null,
                bottom: null,
                width: 15.0,
                height: 15.0,
                child: GeneratedIcon2smallWidget(),
              )
            ]),
      ),
    );
  }
}
