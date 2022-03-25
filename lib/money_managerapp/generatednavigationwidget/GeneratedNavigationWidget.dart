import 'package:flutter/material.dart';
import 'package:flutterapp/money_managerapp/generatednavigationwidget/generated/GeneratedHeaderWidget12.dart';
import 'package:flutterapp/money_managerapp/generatednavigationwidget/generated/GeneratedIOSStatusBarBlackWidget2.dart';

/* Frame Navigation
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedNavigationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: ClipRRect(
      borderRadius: BorderRadius.zero,
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              height: 1012.0,
              child: Stack(children: [
                Container(
                    width: constraints.maxWidth,
                    child: Container(
                      width: 445.0,
                      height: 1012.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.0,
                          color: Color.fromARGB(255, 236, 236, 236),
                        ),
                      ),
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
                              left: 38.0,
                              top: 168.0,
                              right: null,
                              bottom: null,
                              width: 258.0,
                              height: 59.0,
                              child: GeneratedIOSStatusBarBlackWidget2(),
                            ),
                            Positioned(
                              left: 8.0,
                              top: 8.0,
                              right: 8.0,
                              bottom: null,
                              width: null,
                              height: 128.0,
                              child: GeneratedHeaderWidget12(),
                            )
                          ]),
                    ))
              ])),
        );
      }),
    ));
  }
}
