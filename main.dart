import 'package:flutter/material.dart';
import 'package:money_manager_test/Category.dart';
import 'package:money_manager_test/CreateReminder.dart';
import 'package:money_manager_test/ExchangeMoney.dart';
import 'package:money_manager_test/Account.dart';

import 'ColumnChart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Manager',
      home: ExchangeMoney(title: 'title'),
    );
  }
}
