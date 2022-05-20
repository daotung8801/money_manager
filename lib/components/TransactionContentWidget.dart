import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_manager/components/ContentWithoutNoteWidget.dart';
import 'package:money_manager/components/Transaction.dart';

import 'Category.dart';

class TransactionContentWidget extends StatelessWidget {
  TransactionDetails transaction;

  TransactionContentWidget({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () =>
      child: Container(
        width: 343.0.w,
        height: 62.0.h,
        child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 10.0.w,
                top: 10.0.h,
                right: null,
                bottom: null,
                width: 323.0.w,
                height: 42.0.h,
                child: ContentWithoutNoteWidget(
                  categoryID: this.transaction.categoryID,
                  accountID: this.transaction.accountID,
                  amount: this.transaction.value,
                  hasImage: this.transaction.image1 != null,
                ),
              ),
              Positioned(
                left: 10.0.w,
                top: 52.0.h,
                right: null,
                bottom: null,
                width: 233.0.w,
                height: 51.0.h,
                child: Visibility(
                  visible:
                      (this.transaction.description != null ? true : false),
                  child: ClipRRect(
                    borderRadius: BorderRadius.zero,
                    child: Container(
                      width: 233.0.w,
                      height: 51.0.h,
                      child: Stack(
                          clipBehavior: Clip.none,
                          fit: StackFit.expand,
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              left: 40.0.w,
                              top: 0.0,
                              right: null,
                              bottom: null,
                              width: 195.0.w,
                              height: 53.0.h,
                              child: Text(
                                this.transaction.description!,
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  height: 1.171875.h,
                                  fontSize: 14.0.sp,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 102, 102, 102),

                                  /* letterSpacing: 0.0, */
                                ),
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
