import 'package:flutter/material.dart';
import 'package:money_manager/components/ContentWithoutNoteWidget.dart';
import 'package:money_manager/components/Transaction.dart';

import 'Category.dart';

class TransactionContentWidget extends StatelessWidget {
  Transaction transaction;

  TransactionContentWidget({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () =>
      child: Container(
        width: 343.0,
        height: 62.0,
        child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            overflow: Overflow.visible,
            children: [
              Positioned(
                left: 10.0,
                top: 10.0,
                right: null,
                bottom: null,
                width: 323.0,
                height: 42.0,
                child: ContentWithoutNoteWidget(
                  categoryID: this.transaction.categoryID,
                  accountID: this.transaction.accountID,
                  amount: this.transaction.amount,
                  hasImage: this.transaction.image1 != null,
                ),
              ),
              Positioned(
                left: 10.0,
                top: 52.0,
                right: null,
                bottom: null,
                width: 233.0,
                height: 51.0,
                child: Visibility(
                  visible: (this.transaction.note != null ? true : false),
                  child: ClipRRect(
                    borderRadius: BorderRadius.zero,
                    child: Container(
                      width: 233.0,
                      height: 51.0,
                      child: Stack(
                          fit: StackFit.expand,
                          alignment: Alignment.center,
                          overflow: Overflow.visible,
                          children: [
                            Positioned(
                              left: 40.0,
                              top: 0.0,
                              right: null,
                              bottom: null,
                              width: 195.0,
                              height: 53.0,
                              child: Text(
                                this.transaction.note!,
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  height: 1.171875,
                                  fontSize: 14.0,
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
