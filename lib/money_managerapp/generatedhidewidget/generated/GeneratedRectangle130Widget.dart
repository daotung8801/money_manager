import 'package:flutter/material.dart';
import 'package:flutterapp/helpers/svg/svg.dart';
import 'package:flutterapp/helpers/transform/transform.dart';

/* Vector Rectangle 130
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedRectangle130Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TransformHelper.rotate(
        a: -0.71,
        b: 0.71,
        c: -0.71,
        d: -0.71,
        child: Container(
          width: 8.0,
          height: 8.0,
          child: SvgWidget(painters: [
            SvgPathPainter.stroke(
              2.0,
              strokeJoin: StrokeJoin.miter,
            )
              ..addPath(
                  'M0 8L-1 8L-1 9L0 9L0 8ZM8 7L0 7L0 9L8 9L8 7ZM1 8L1 0L-1 0L-1 8L1 8Z')
              ..color = Color.fromARGB(255, 81, 98, 249),
          ]),
        ));
  }
}
