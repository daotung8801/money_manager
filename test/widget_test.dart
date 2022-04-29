// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:money_manager/components/Category.dart';

import 'package:money_manager/main.dart';
import 'package:money_manager/main1.dart';
import 'package:money_manager/screens/CategoryScreen.dart';
import 'package:money_manager/screens/ContactScreen.dart';
import 'package:money_manager/screens/ExchangeMoney.dart';
import 'package:money_manager/screens/HomeScreen.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('HomeScreen', (WidgetTester tester) async {
    Widget testWidget = new MediaQuery(
        data: new MediaQueryData(),
        child: new MaterialApp(
          home: new HomeScreen(title: 'Ngân sách'),
        ));
    await tester.pumpWidget(testWidget);
  });

  testWidgets('CategoryScreen', (WidgetTester tester) async {
    Widget testWidget = new MediaQuery(
        data: new MediaQueryData(),
        child: new MaterialApp(
          home: new CategoryScreen(title: 'Danh mục'),
        ));
    await tester.pumpWidget(testWidget);
    expect(find.text('Chi phí'), findsOneWidget);
  });

  testWidgets('CategoryScreen', (WidgetTester tester) async {
    Widget testWidget = new MediaQuery(
        data: new MediaQueryData(),
        child: new MaterialApp(
          home: new ContactScreen(title: 'Liên hệ'),
        ));
    await tester.pumpWidget(testWidget);
    expect(find.text('Liên hệ'), findsOneWidget);
  });
}
