import 'package:flutter/material.dart';
import 'package:flutterapp/money_managerapp/generatedpopupnotificationwidget/generated/GeneratedContentWidget.dart';
import 'package:flutterapp/money_managerapp/generatedpopupnotificationwidget/generated/GeneratedExcelWidget.dart';
import 'package:flutterapp/helpers/transform/transform.dart';
import 'package:flutterapp/money_managerapp/generatedpopupnotificationwidget/generated/GeneratedText2Widget20.dart';
import 'package:flutterapp/money_managerapp/generatedpopupnotificationwidget/generated/GeneratedRectangle356Widget.dart';
import 'package:flutterapp/money_managerapp/generatedpopupnotificationwidget/generated/GeneratedExceliconWidget.dart';
import 'package:flutterapp/money_managerapp/generatedpopupnotificationwidget/generated/GeneratedText2Widget22.dart';

/* Instance Pop-up/Notification
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedPopupNotificationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      width: 244.0,
      height: 138.0,
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
                final double width = constraints.maxWidth * 0.9139344262295082;

                final double height = constraints.maxHeight;

                return Stack(children: [
                  TransformHelper.translate(
                      x: constraints.maxWidth * 0.045081967213114756,
                      y: 0,
                      z: 0,
                      child: Container(
                        width: width,
                        height: height,
                        child: GeneratedRectangle356Widget(),
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
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                final double width = constraints.maxWidth * 1.0081967213114753;

                final double height =
                    constraints.maxHeight * 0.37681159420289856;

                return Stack(children: [
                  TransformHelper.translate(
                      x: 0,
                      y: constraints.maxHeight * 0.10869565217391304,
                      z: 0,
                      child: Container(
                        width: width,
                        height: height,
                        child: GeneratedContentWidget(),
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
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                final double width = constraints.maxWidth * 0.3442622950819672;

                final double height =
                    constraints.maxHeight * 0.2463768115942029;

                return Stack(children: [
                  TransformHelper.translate(
                      x: constraints.maxWidth * 0.4057377049180328,
                      y: constraints.maxHeight * 0.39855072463768115,
                      z: 0,
                      child: Container(
                        width: width,
                        height: height,
                        child: GeneratedExcelWidget(),
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
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                double percentWidth = 0.08196721311475409;
                double scaleX = (constraints.maxWidth * percentWidth) / 20.0;

                double percentHeight = 0.14492753623188406;
                double scaleY = (constraints.maxHeight * percentHeight) / 20.0;

                return Stack(children: [
                  TransformHelper.translateAndScale(
                      translateX: constraints.maxWidth * 0.29508196721311475,
                      translateY: constraints.maxHeight * 0.427536231884058,
                      translateZ: 0,
                      scaleX: scaleX,
                      scaleY: scaleY,
                      scaleZ: 1,
                      child: GeneratedExceliconWidget())
                ]);
              }),
            ),
            Positioned(
              left: 0.0,
              top: null,
              right: 0.0,
              bottom: null,
              width: null,
              height: 38.0,
              child: TransformHelper.translate(
                  x: 0.00,
                  y: 45.00,
                  z: 0,
                  child: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    final double width =
                        constraints.maxWidth * 0.1598360655737705;

                    return Stack(children: [
                      TransformHelper.translate(
                          x: constraints.maxWidth * 0.19262295081967212,
                          y: 0,
                          z: 0,
                          child: Container(
                            width: width,
                            child: GeneratedText2Widget20(),
                          ))
                    ]);
                  })),
            ),
            Positioned(
              left: 0.0,
              top: null,
              right: 0.0,
              bottom: null,
              width: null,
              height: 38.0,
              child: TransformHelper.translate(
                  x: 0.00,
                  y: 45.00,
                  z: 0,
                  child: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    final double width =
                        constraints.maxWidth * 0.18032786885245902;

                    return Stack(children: [
                      TransformHelper.translate(
                          x: constraints.maxWidth * 0.6127049180327869,
                          y: 0,
                          z: 0,
                          child: Container(
                            width: width,
                            child: GeneratedText2Widget22(),
                          ))
                    ]);
                  })),
            )
          ]),
    ));
  }
}
