import 'package:flutter/material.dart';
import 'package:money_manager/components/Account.dart';
import 'package:money_manager/components/Category.dart';
import 'package:money_manager/components/CategoryHWidget.dart';
import 'package:money_manager/main.dart';
import 'package:provider/provider.dart';

class ContentWithoutNoteWidget extends StatelessWidget {
  String categoryID;
  int amount;
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
    return ChangeNotifierProvider.value(
      value: ApplicationState.getInstance,
      builder: (context, _) =>
          Consumer<ApplicationState>(builder: (context, appState, _) {
        Category category =
            Category(id: '', icon: '', color: '', description: '');
        String accountName = '';
        final List<Category> categories = [];
        categories.addAll(appState.expenseCategories);
        categories.addAll(appState.incomeCategories);
        for (Category e in categories) {
          if (categoryID == e.id) {
            category = e;
          }
        }

        for (Account e in appState.accounts) {
          if (accountID == e.id) {
            accountName = e.description;
          }
        }

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
                    amount < 1000000
                        ? '$amount ₫'
                        : '${(amount ~/ 100000) / 10} Tr ₫',
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
                  width: 70.0,
                  height: 22.0,
                  child: Text(
                    accountName,
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
                    child: CategoryHWidget(category: category))
              ]),
        );
      }),
    );
  }
}
