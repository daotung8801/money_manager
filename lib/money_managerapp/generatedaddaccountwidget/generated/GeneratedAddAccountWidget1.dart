import 'package:flutter/material.dart';
import 'package:flutterapp/money_managerapp/generatedaddaccountwidget/generated/GeneratedListbydateWidget.dart';

/* Instance Add Account
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedAddAccountWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.zero,
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              height: 795.0,
              child: Stack(children: [
                Container(
                    width: constraints.maxWidth,
                    child: Container(
                      width: 375.0,
                      height: 741.0,
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
                              width: 377.0,
                              height: 795.0,
                              child: GeneratedListbydateWidget(),
                            )
                          ]),
                    ))
              ])),
        );
      }),
    );
  }
}
