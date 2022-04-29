import 'package:flutter/material.dart';
import 'package:money_manager/components/Category.dart';
import 'package:money_manager/components/CategoryHWidget.dart';
import 'package:money_manager/components/CategoryIconWidget.dart';
import 'package:money_manager/main1.dart';

class ContentWithoutNoteWidget extends StatelessWidget {
  String categoryID;
  String amount;
  String accountID;
  bool hasImage;

  ContentWithoutNoteWidget(
      {Key? key,
      required this.categoryID,
      required this.accountID,
      required this.amount,
      this.hasImage = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 323.0,
      height: 42.0,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          overflow: Overflow.visible,
          children: [
            Positioned(
              left: null,
              top: 6.0,
              right: -2.0,
              bottom: null,
              width: 78.0,
              height: 20.0,
              child: Text(
                this.amount,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.right,
                style: TextStyle(
                  height: 1.171875,
                  fontSize: 15.0,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 0, 0, 0),

                  /* letterSpacing: 0.0, */
                ),
              ),
            ),
            Positioned(
              left: null,
              top: 25.0,
              right: -4.0,
              bottom: null,
              width: 44.0,
              height: 22.0,
              child: Text(
                this.accountID,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.right,
                style: TextStyle(
                  height: 1.171875,
                  fontSize: 14.0,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 102, 102, 102),

                  /* letterSpacing: 0.0, */
                ),
              ),
            ),
            Positioned(
              left: 2.2737367544323206e-13,
              top: 0.0,
              right: null,
              bottom: null,
              width: 188.0,
              height: 30.0,
              child: CategoryHWidget(
                category: new Category(icon: '💼', description: 'Kinh doanh', color: '0xFFE0E0E0'),
                hasImage: this.hasImage,
              ),
            )
          ]),
    );
  }
}
