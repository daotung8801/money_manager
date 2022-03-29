import 'package:flutter/material.dart';
import 'package:money_manager_test/CreatReminder.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Manager',
      home: CreateReminder(title: 'title'),
    );
  }
}
