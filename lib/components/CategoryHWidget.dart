import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/transform/transform.dart';
import 'Category.dart';
import 'CategoryIconWidget.dart';

class CategoryHWidget extends StatelessWidget {
  final Category category;
  final bool hasImage;

  const CategoryHWidget({Key? key, required this.category, this.hasImage = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        width: 188.0.w,
        height: 30.0.h,
        child: Stack(
            clipBehavior: Clip.none, fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 0.0.w,
                top: 0.0.h,
                width: 30.0.w,
                height: 30.0.h,
                child: CategoryIconWidget(
                  icon: category.icon,
                  bgColor: category.color,
                  buttonSize: CategoryIconWidget.MEDIUM,
                ),
              ),
              Positioned(
                left: 40.0.w,
                width: 85.0.w,
                height: 20.0.h,
                child: TransformHelper.translate(
                    x: 0,
                    y: 1,
                    z: 0,
                    child: Text(
                      category.description,
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        height: 1.171875.h,
                        fontSize: 15.0.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        color: const Color.fromARGB(255, 0, 0, 0),

                        /* letterSpacing: 0.0, */
                      ),
                    )
                ),
              ),
              Positioned(
                left: 22.0.w,
                top: 15.0.h,
                width: 15.0.w,
                height: 15.0.h,
                child: Visibility(
                  visible: hasImage,
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
