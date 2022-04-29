import 'package:flutter/material.dart';
import 'Category.dart';
import 'CategoryIconWidget.dart';
import '../helpers/transform/transform.dart';

class CategoryHWidget extends StatelessWidget {
  Category category;
  bool hasImage;

  CategoryHWidget({Key? key, required this.category, this.hasImage = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.zero,
      child: Container(
        width: 188.0,
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
                child: CategoryIconWidget(
                  icon: this.category.icon,
                  bgColor: this.category.color,
                  buttonSize: CategoryIconWidget.MEDIUM,
                ),
              ),
              Positioned(
                left: 40.0,
                top: null,
                right: null,
                bottom: null,
                width: 85.0,
                height: 20.0,
                child: TransformHelper.translate(
                    x: 0.00,
                    y: 1.00,
                    z: 0,
                    child: Text(
                      this.category.description,
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        height: 1.171875,
                        fontSize: 15.0,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 0, 0, 0),

                        /* letterSpacing: 0.0, */
                      ),
                    )
                ),
              ),
              Positioned(
                left: 22.0,
                top: 15.0,
                right: null,
                bottom: null,
                width: 15.0,
                height: 15.0,
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
