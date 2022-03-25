import 'package:flutter/material.dart';
import 'package:flutterapp/money_managerapp/generatedunselectedwidget/generated/GeneratedButtonUnselectedWidget.dart';

/* Frame Unselected
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedUnselectedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/GeneratedSelectedWidget'),
      child: Container(
        width: 16.0,
        height: 16.0,
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
                width: 16.0,
                height: 16.0,
                child: GeneratedButtonUnselectedWidget(),
              )
            ]),
      ),
    ));
  }
}
