import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/transform/transform.dart';
import 'Category.dart';
import 'CategoryIconWidget.dart';

class CategoryVWidget extends StatelessWidget {
  Category category;
  String iconColor;
  double iconSize;
  double iconBorderRadius;

  CategoryVWidget(
      {Key? key,
      required this.category,
      this.iconColor = '0xFF000000',
      this.iconSize = CategoryIconWidget.BIG,
      this.iconBorderRadius = 28.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0.w,
      height: 70.0.h,
      child: Stack(
          clipBehavior: Clip.none, fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              bottom: 0,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                final double width = constraints.maxWidth * 0.6857142857142857;

                final double height =
                    constraints.maxHeight * 0.6857142857142857;

                return Stack(children: [
                  TransformHelper.translate(
                      x: constraints.maxWidth * 0.15714285714285714,
                      y: 0,
                      z: 0,
                      child: Container(
                        width: width.w,
                        height: height.h,
                        child: CategoryIconWidget(
                          icon: category.icon,
                          bgColor: category.color,
                          iconColor: iconColor,
                          buttonSize: iconSize,
                          borderRadius: iconBorderRadius,
                        ),
                      ))
                ]);
              }),
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              bottom: 0,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                final double width = constraints.maxWidth * 1.0285714285714285;

                final double height =
                    constraints.maxHeight * 0.3142857142857143;

                return Stack(children: [
                  TransformHelper.translate(
                      x: 0,
                      y: constraints.maxHeight * 0.7142857142857143,
                      z: 0,
                      child: Container(
                        width: width.w,
                        height: height.h,
                        child: Text(
                          category.description,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            height: 1.5384615384615385.h,
                            fontSize: 13.0.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 0, 16, 38),

                            /* letterSpacing: 0.0, */
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
