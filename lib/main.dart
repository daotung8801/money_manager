import 'package:flutter/material.dart';
import 'package:flutterapp/money_managerapp/generatedsignupwidget/GeneratedSignUpWidget.dart';
import 'package:flutterapp/money_managerapp/generatedloginwidget/GeneratedLogInWidget.dart';
import 'package:flutterapp/money_managerapp/generatedhidewidget/GeneratedHideWidget.dart';
import 'package:flutterapp/money_managerapp/generatedcreatereminderwidget/GeneratedCreatereminderWidget.dart';
import 'package:flutterapp/money_managerapp/generatedaccountdetailswidget/GeneratedAccountdetailsWidget.dart';
import 'package:flutterapp/money_managerapp/generatedaccountspopupwidget/GeneratedAccountsPopupWidget.dart';
import 'package:flutterapp/money_managerapp/generatedaddtransactionwidget/GeneratedAddtransactionWidget.dart';
import 'package:flutterapp/money_managerapp/generatedcolumnchartwidget/GeneratedColumnchartWidget.dart';
import 'package:flutterapp/money_managerapp/generatedaccountwidget/GeneratedAccountWidget.dart';
import 'package:flutterapp/money_managerapp/generatedcategorywidget/GeneratedCategoryWidget.dart';
import 'package:flutterapp/money_managerapp/generatedaddaccountwidget/GeneratedAddAccountWidget.dart';
import 'package:flutterapp/money_managerapp/generatedexchangemoneywidget/GeneratedExchangemoneyWidget.dart';
import 'package:flutterapp/money_managerapp/generatedpopupnotificationwidget/GeneratedPopupNotificationWidget.dart';
import 'package:flutterapp/money_managerapp/generatedhomescreenwidget/GeneratedHomescreenWidget.dart';
import 'package:flutterapp/money_managerapp/generatedcontactwidget/GeneratedContactWidget.dart';
import 'package:flutterapp/money_managerapp/generatednotificationwidget/GeneratedNotificationWidget.dart';
import 'package:flutterapp/money_managerapp/generatedcurrencywidget/GeneratedCurrencyWidget.dart';
import 'package:flutterapp/money_managerapp/generatedleftnavigationpanewidget/GeneratedLeftNavigationPaneWidget.dart';
import 'package:flutterapp/money_managerapp/generatedshareappwidget/GeneratedShareAppWidget.dart';
import 'package:flutterapp/money_managerapp/generatedratingappwidget/GeneratedRatingAppWidget.dart';
import 'package:flutterapp/money_managerapp/generatedfrequencypopupwidget/GeneratedFrequencypopupWidget.dart';
import 'package:flutterapp/money_managerapp/generatedunselectedwidget/GeneratedUnselectedWidget.dart';
import 'package:flutterapp/money_managerapp/generatedselectedwidget/GeneratedSelectedWidget.dart';
import 'package:flutterapp/money_managerapp/generatediconswidget/GeneratedIconsWidget.dart';
import 'package:flutterapp/money_managerapp/generatedwidget142/GeneratedWidget142.dart';
import 'package:flutterapp/money_managerapp/generatednavigationwidget/GeneratedNavigationWidget.dart';
import 'package:flutterapp/money_managerapp/generatedinputswidget/GeneratedInputsWidget.dart';
import 'package:flutterapp/money_managerapp/generatedbuttonswidget/GeneratedButtonsWidget.dart';
import 'package:flutterapp/money_managerapp/generatedinputswidget2/GeneratedInputsWidget2.dart';
import 'package:flutterapp/money_managerapp/generatedcontentwidget2/GeneratedContentWidget2.dart';
import 'package:flutterapp/money_managerapp/generateddatawidget18/GeneratedDataWidget18.dart';
import 'package:flutterapp/money_managerapp/generatedheaderwidget20/GeneratedHeaderWidget20.dart';
import 'package:flutterapp/money_managerapp/generateddata1widget/GeneratedData1Widget.dart';
import 'package:flutterapp/money_managerapp/generateddata2widget/GeneratedData2Widget.dart';

void main() {
  runApp(money_managerApp());
}

class money_managerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/GeneratedExchangemoneyWidget',
      routes: {
        '/GeneratedSignUpWidget': (context) => GeneratedSignUpWidget(),
        '/GeneratedLogInWidget': (context) => GeneratedLogInWidget(),
        '/GeneratedHideWidget': (context) => GeneratedHideWidget(),
        '/GeneratedCreatereminderWidget': (context) =>
            GeneratedCreatereminderWidget(),
        '/GeneratedAccountdetailsWidget': (context) =>
            GeneratedAccountdetailsWidget(),
        '/GeneratedAccountsPopupWidget': (context) =>
            GeneratedAccountsPopupWidget(),
        '/GeneratedAddtransactionWidget': (context) =>
            GeneratedAddtransactionWidget(),
        '/GeneratedColumnchartWidget': (context) =>
            GeneratedColumnchartWidget(),
        '/GeneratedAccountWidget': (context) => GeneratedAccountWidget(),
        '/GeneratedCategoryWidget': (context) => GeneratedCategoryWidget(),
        '/GeneratedAddAccountWidget': (context) => GeneratedAddAccountWidget(),
        '/GeneratedExchangemoneyWidget': (context) =>
            GeneratedExchangemoneyWidget(),
        '/GeneratedPopupNotificationWidget': (context) =>
            GeneratedPopupNotificationWidget(),
        '/GeneratedHomescreenWidget': (context) => GeneratedHomescreenWidget(),
        '/GeneratedContactWidget': (context) => GeneratedContactWidget(),
        '/GeneratedNotificationWidget': (context) =>
            GeneratedNotificationWidget(),
        '/GeneratedCurrencyWidget': (context) => GeneratedCurrencyWidget(),
        '/GeneratedLeftNavigationPaneWidget': (context) =>
            GeneratedLeftNavigationPaneWidget(),
        '/GeneratedShareAppWidget': (context) => GeneratedShareAppWidget(),
        '/GeneratedRatingAppWidget': (context) => GeneratedRatingAppWidget(),
        '/GeneratedFrequencypopupWidget': (context) =>
            GeneratedFrequencypopupWidget(),
        '/GeneratedUnselectedWidget': (context) => GeneratedUnselectedWidget(),
        '/GeneratedSelectedWidget': (context) => GeneratedSelectedWidget(),
        '/GeneratedIconsWidget': (context) => GeneratedIconsWidget(),
        '/GeneratedWidget142': (context) => GeneratedWidget142(),
        '/GeneratedNavigationWidget': (context) => GeneratedNavigationWidget(),
        '/GeneratedInputsWidget': (context) => GeneratedInputsWidget(),
        '/GeneratedButtonsWidget': (context) => GeneratedButtonsWidget(),
        '/GeneratedInputsWidget2': (context) => GeneratedInputsWidget2(),
        '/GeneratedContentWidget2': (context) => GeneratedContentWidget2(),
        '/GeneratedDataWidget18': (context) => GeneratedDataWidget18(),
        '/GeneratedHeaderWidget20': (context) => GeneratedHeaderWidget20(),
        '/GeneratedData1Widget': (context) => GeneratedData1Widget(),
        '/GeneratedData2Widget': (context) => GeneratedData2Widget(),
      },
    );
  }
}
