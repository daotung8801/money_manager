import 'package:flutter/material.dart';
import 'components/ButtonWidget.dart';
import 'components/NavigationDrawerWidget.dart';
import 'screens/HomeScreen.dart';
import 'screens/LoginScreen.dart';
import 'components/Category.dart';
import 'screens/Currency.dart';
import 'screens/RegisterScreen.dart';
import 'screens/ContactScreen.dart';
import 'screens/Reminder.dart';
import 'helpers/ChangeLanguage.dart';
import 'screens/CategoryScreen.dart';
import 'screens/CreateReminder.dart';
import 'screens/ExchangeMoney.dart';
import 'screens/Account.dart';
import 'screens/ColumnChart.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Navigation Drawer';
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      /*home: const GeneratedLeftNavigationPaneWidget(
          title: 'Flutter Demo Home Page'),*/
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        // endDrawer: NavigationDrawerWidget(),
        appBar: AppBar(
          //leading: new Container(),
          title: Text(MyApp.title),
        ),
        body: Builder(
          builder: (context) => Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: ButtonWidget(
              icon: Icons.open_in_new,
              text: 'Open Drawer',
              onClicked: () {
                Scaffold.of(context).openDrawer();
                // Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ),
      );
}

/*
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Manager',
      localizationsDelegates: [
        CustomLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('vi', ''),
      ],
      home: LoginScreen(title: 'title'),
    );
  }
}
*/