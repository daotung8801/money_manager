import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Category.dart';
import 'CategoryIconWidget.dart';
import '../helpers/transform/transform.dart';

class CategoryHWidget extends StatelessWidget {
  final Category category;
  final bool hasImage;

  CategoryHWidget({Key? key, required this.category, this.hasImage = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.zero,
      child: Container(
        width: 188.0.w,
        height: 30.0.h,
        child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            overflow: Overflow.visible,
            children: [
              Positioned(
                left: 0.0.w,
                top: 0.0.h,
                right: null,
                bottom: null,
                width: 30.0.w,
                height: 30.0.h,
                child: CategoryIconWidget(
                  icon: this.category.icon,
                  bgColor: this.category.color,
                  buttonSize: CategoryIconWidget.MEDIUM,
                ),
              ),
              Positioned(
                left: 40.0.w,
                top: null,
                right: null,
                bottom: null,
                width: 85.0.w,
                height: 20.0.h,
                child: TransformHelper.translate(
                    x: 0.00,
                    y: 1.00,
                    z: 0,
                    child: Text(
                      this.category.description,
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        height: 1.171875.h,
                        fontSize: 15.0.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 0, 0, 0),

                        /* letterSpacing: 0.0, */
                      ),
                    )
                ),
              ),
              Positioned(
                left: 22.0.w,
                top: 15.0.h,
                right: null,
                bottom: null,
                width: 15.0.w,
                height: 15.0.h,
                child: Visibility(
                  visible: this.hasImage,
                  child: CategoryIconWidget(
                    icon: '📷',
                    bgColor: '0xFFE0E0E0',
                    buttonSize: CategoryIconWidget.SMALL,
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
