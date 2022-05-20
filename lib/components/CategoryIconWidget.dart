import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helpers/transform/transform.dart';

class CategoryIconWidget extends StatelessWidget {
  String icon;
  String iconColor;
  String bgColor;
  double buttonSize;
  double borderRadius;
  static const double BIG = 48.0;
  static const double MEDIUM = 30.0;
  static const double SMALL = 15.0;

  CategoryIconWidget(
      {Key? key,
      required this.icon,
      required this.bgColor,
      this.buttonSize = BIG,
      this.iconColor = '0xFF000000',
      this.borderRadius = 28.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.buttonSize.w,
      height: this.buttonSize.h,
      child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          alignment: Alignment.center,
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
                final double width = constraints.maxWidth;

                final double height = constraints.maxHeight;

                return Stack(children: [
                  TransformHelper.translate(
                      x: 0,
                      y: 0,
                      z: 0,
                      child: Container(
                        width: width.w,
                        height: height.h,
                        child: Opacity(
                          opacity: 1.0,
                          child: Container(
                            width: this.buttonSize.w,
                            height: this.buttonSize.h,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(this.borderRadius.r),
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(this.borderRadius.r),
                              child: Container(
                                color: Color(int.parse(this.bgColor)),
                              ),
                            ),
                          ),
                        ),
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
                final double width = constraints.maxWidth * 1.1041666666666667;

                final double height =
                    constraints.maxHeight * 1.1041666666666667;

                return Stack(children: [
                  TransformHelper.translate(
                      x: 0,
                      y: 0,
                      z: 0,
                      child: Container(
                        width: width.w,
                        height: height.h,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            this.icon,
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              height: 1.1666666666666667.h,
                              fontSize: this.buttonSize / 2.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              color: Color(int.parse(this.iconColor)),

                              /* letterSpacing: 0.0, */
                            ),
                          ),
                        ),
                      ))
                ]);
              }),
            )
          ]),
    );
  }
}
