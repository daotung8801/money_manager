import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:money_manager/screens/CategoryScreen.dart';
import 'package:money_manager/screens/ContactScreen.dart';

void main() {
  // testWidgets('HomeScreen', (WidgetTester tester) async {
  //   Widget testWidget = new MediaQuery(
  //       data: new MediaQueryData(),
  //       child: new MaterialApp(
  //         home: new HomeScreen(title: 'Ngân sách'),
  //       ));
  //   await tester.pumpWidget(testWidget);
  // });

  testWidgets('CategoryScreen', (WidgetTester tester) async {
    final Widget testWidget = MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(
          home: CategoryScreen(title: 'Danh mục'),
        ));
    await tester.pumpWidget(testWidget);
    expect(find.text('Chi phí'), findsOneWidget);
  });

  testWidgets('CategoryScreen', (WidgetTester tester) async {
    final Widget testWidget = MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(
          home: ContactScreen(title: 'Liên hệ'),
        ));
    await tester.pumpWidget(testWidget);
    expect(find.text('Liên hệ'), findsOneWidget);
  });
}
