import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:money_manager/screens/AddTransactionScreen1.dart';
import 'package:money_manager/screens/ContactScreen.dart';
import 'package:provider/provider.dart';
import 'components/Category.dart';
import 'firebase_options.dart';
import 'screens/Authentication.dart';
import 'helpers/ChangeLanguage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(ChangeNotifierProvider(
  create: (context) => ApplicationState(),
  builder: (context, _) => MyApp(),
),);

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
      home: AddTransactionScreen1(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(
      builder: (context, appState, _) => Authentication(
        email: appState.email,
        loginState: appState.loginState,
        verifyEmail: appState.verifyEmail,
        signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
        cancelRegistration: appState.cancelRegistration,
        registerAccount: appState.registerAccount,
        signOut: appState.signOut,
      ),
    );
  }
}

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseAuth.instance.userChanges().listen((user) async {
      if (user != null) {
        _loginState = ApplicationLoginState.loggedIn;
        final userRef =
        FirebaseFirestore.instance.collection('userData').doc(user.uid);
        await userRef.get().then((docSnapshot) {
          print(docSnapshot);
          if (!docSnapshot.exists) {
            print('userdata not exists');
            FirebaseFirestore.instance
                .collection('userData')
                .doc(user.uid)
                .set({})
                .then((value) => print('Create userData/${user.uid}'))
                .catchError((error) => print('Create failed: $error'));
            var personalExpenseCategories = FirebaseFirestore.instance
                .collection('userData/${user.uid}/expenseCategories');
            FirebaseFirestore.instance
                .collection('expenseCategories')
                .snapshots()
                .listen((snapshot) {
              for (final document in snapshot.docs) {
                personalExpenseCategories
                    .doc(document.id)
                    .set(document.data())
                    .then((_) => print(
                    'Added ${document.data()['description']} to ${user.uid}'))
                    .catchError((error) => print('Add failed: $error'));
              }
            });
            var personalIncomeCategories = FirebaseFirestore.instance
                .collection('userData/${user.uid}/incomeCategories');
            FirebaseFirestore.instance
                .collection('incomeCategories')
                .snapshots()
                .listen((snapshot) {
              for (final document in snapshot.docs) {
                personalIncomeCategories
                    .doc(document.id)
                    .set(document.data())
                    .then((_) => print(
                    'Added ${document.data()['description']} to ${user.uid}'))
                    .catchError((error) => print('Add failed: $error'));
              }
            });
          } else {
            print('userdata exists');
          }
        });

        _expenseCategorySubscription = FirebaseFirestore.instance
            .collection('userData/${user.uid}/categories')
            .orderBy('index')
            .snapshots()
            .listen((snapshot) {
          for (final document in snapshot.docs) {
            _expenseCategories.add(Category(
                index: document.data()['index'] as int,
                icon: document.data()['icon'] as String,
                color: document.data()['color'] as String,
                description: document.data()['description'] as String));
          }

          notifyListeners();
        });
        _incomeCategorySubscription = FirebaseFirestore.instance
            .collection('userData/${user.uid}/expenseCategories')
            .orderBy('index')
            .snapshots()
            .listen((snapshot) {
          for (final document in snapshot.docs) {
            _incomeCategories.add(Category(
                index: document.data()['index'] as int,
                icon: document.data()['icon'] as String,
                color: document.data()['color'] as String,
                description: document.data()['description'] as String));
          }
          notifyListeners();
        });
      } else {
        _loginState = ApplicationLoginState.loggedOut;
        _expenseCategorySubscription?.cancel();
        _incomeCategorySubscription?.cancel();
      }
      notifyListeners();
    });
  }

  ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;

  ApplicationLoginState get loginState => _loginState;

  String? _email;

  String? get email => _email;

  StreamSubscription<QuerySnapshot>? _expenseCategorySubscription;

  StreamSubscription<QuerySnapshot>? _incomeCategorySubscription;

  List<Category> _expenseCategories = [];

  List<Category> get expenseCategories => _expenseCategories;

  List<Category> _incomeCategories = [];

  List<Category> get incomeCategories => _incomeCategories;

  Future<void> verifyEmail(
      String email,
      void Function(FirebaseAuthException e) errorCallback,
      ) async {
    try {
      var methods =
      await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      if (methods.contains('password')) {
        _loginState = ApplicationLoginState.password;
      } else {
        _loginState = ApplicationLoginState.register;
      }
      _email = email;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  Future<void> signInWithEmailAndPassword(
      String email,
      String password,
      void Function(FirebaseAuthException e) errorCallback,
      ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void cancelRegistration() {
    _loginState = ApplicationLoginState.loggedOut;
    notifyListeners();
  }

  Future<void> registerAccount(
      String email,
      String displayName,
      String password,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(displayName);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
    FacebookAuth.instance.logOut();
  }

}

