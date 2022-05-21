import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:money_manager/components/Account.dart';
import 'package:money_manager/components/Transaction.dart';
import 'package:money_manager/screens/AccountDetailScreen.dart';
import 'package:money_manager/screens/AddAccountScreen.dart';
import 'package:money_manager/screens/ColumnChart.dart';
import 'package:money_manager/screens/ContactScreen.dart';
import 'package:provider/provider.dart';
import 'components/Category.dart';
import 'firebase_options.dart';
import 'screens/Authentication.dart';
import 'helpers/ChangeLanguage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'screens/HomeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider.value(
      value: ApplicationState.getInstance,
      builder: (context, _) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (BuildContext c, Widget) => MaterialApp(
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
        theme: ThemeData(
          buttonTheme: Theme.of(context).buttonTheme.copyWith(
                highlightColor: Color.fromARGB(255, 35, 111, 87),
              ),
          primarySwatch: createMaterialColor(Color.fromARGB(255, 35, 111, 87)),
        ),
        home: HomePage(),
      ),
    );
  }

  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    ;
    return MaterialColor(color.value, swatch);
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

  static ApplicationState instance = ApplicationState();

  static ApplicationState get getInstance => instance;

  void init() {
    // var personalTransactions = FirebaseFirestore.instance
    //     .collection('userData/h4JluZuETmPkj2XpsPzX2tvHRFw2/transactions');
    // FirebaseFirestore.instance
    //     .collection('userData/XbIZdSb3l8NHHdwTffWv72qB3i33/transactions')
    //     .snapshots()
    //     .listen((snapshot) {
    //   for (final document in snapshot.docs) {
    //     personalTransactions
    //         .doc(document.id)
    //         .set(document.data())
    //         .then((_) => print(
    //         'Added'))
    //         .catchError((error) => print('Add failed: $error'));
    //   }
    // });
    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _user = user;
        _timeTab = 0;
        _loginState = ApplicationLoginState.loggedIn;
        final userRef =
            FirebaseFirestore.instance.collection('userData').doc(user.uid);
        userRef.get().then((docSnapshot) {
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
            FirebaseFirestore.instance
                .collection('userData/${user.uid}/accounts')
                .doc('chinh')
                .set({
                  'color': "0x1FB07553",
                  'description': "Chính",
                  'icon': "💳",
                  'index': 1,
                  'value': 0,
                  'currencyunit': "₫",
                  'visible': true
                })
                .then((_) => print('Added tk chinh to ${user.uid}'))
                .catchError((error) => print('Add failed: $error'));
          } else {
            print('userdata exists');
          }
        });

        FirebaseFirestore.instance
            .collection('userData/${user.uid}/expenseCategories')
            .orderBy('index')
            .snapshots()
            .listen((snapshot) {
          _expenseCategories = [];
          for (final document in snapshot.docs) {
            _expenseCategories.add(Category(
                id: document.id,
                index: document.data()['index'] as int,
                icon: document.data()['icon'] as String,
                color: document.data()['color'] as String,
                description: document.data()['description'] as String));
          }
          notifyListeners();
        });
        FirebaseFirestore.instance
            .collection('userData/${user.uid}/incomeCategories')
            .orderBy('index')
            .snapshots()
            .listen((snapshot) {
          _incomeCategories = [];
          for (final document in snapshot.docs) {
            _incomeCategories.add(Category(
                id: document.id,
                index: document.data()['index'] as int,
                icon: document.data()['icon'] as String,
                color: document.data()['color'] as String,
                description: document.data()['description'] as String));
          }
          notifyListeners();
        });

        FirebaseFirestore.instance
            .collection('userData/${user.uid}/accounts')
            .orderBy('index')
            .snapshots()
            .listen((snapshot) {
          _accounts = [];
          for (final document in snapshot.docs) {
            _accounts.add(Account(
              id: document.id,
              index: document.data()['index'] as int,
              icon: document.data()['icon'] as String,
              color: document.data()['color'] as String,
              description: document.data()['description'] as String,
              currentunit: document.data()['currencyunit'] as String,
              value: document.data()['value'] as int,
              visible: document.data()['visible'] as bool,
            ));
          }
          notifyListeners();
        });
        FirebaseFirestore.instance
            .collection('userData/${user.uid}/accounts')
            .where('visible', isEqualTo: true)
            .snapshots()
            .listen((snapshot) {
          int remainingAmount = 0;
          for (final document in snapshot.docs) {
            remainingAmount += document.data()['value'] as int;
            print(document.data()['value']);
          }
          _remainingAmount = remainingAmount;
          notifyListeners();
        });
      } else {
        _loginState = ApplicationLoginState.loggedOut;
      }
      notifyListeners();
    });

    // var collection = FirebaseFirestore.instance.collection('expenseCategories');
    // var myData = {'color': "0x1FB07553", 'description': "Kinh doanh", 'icon': "💼", 'index': 1};
    // collection.doc('kinhdoanh').set(myData).then((_) => print('Added')).catchError((error) => print('Add failed: $error'));
    // myData = {'color': "0x5FFF5342", 'description': "Giải trí", 'icon': "🕹", 'index': 2};
    // collection.doc('giaitri').set(myData).then((_) => print('Added')).catchError((error) => print('Add failed: $error'));
    // myData = {'color': "0x5FFFCF33", 'description': "Đi lại", 'icon': "🚖", 'index': 3};
    // collection.doc('dilai').set(myData).then((_) => print('Added')).catchError((error) => print('Add failed: $error'));
    // myData = {'color': "0x5FFF5342", 'description': "Học tập", 'icon': "🎓", 'index': 4};
    // collection.doc('hoctap').set(myData).then((_) => print('Added')).catchError((error) => print('Add failed: $error'));
    // myData = {'color': "0x5FFF5342", 'description': "Thực phẩm", 'icon': "🥕", 'index': 5};
    // collection.doc('thucpham').set(myData).then((_) => print('Added')).catchError((error) => print('Add failed: $error'));
    // myData = {'color': "0x5FB07553", 'description': "Chuyển khoản", 'icon': "💳", 'index': 6};
    // collection.doc('chuyenkhoan').set(myData).then((_) => print('Added')).catchError((error) => print('Add failed: $error'));
    // myData = {'color': "0x5FFF5342", 'description': "Quà tặng", 'icon': "🎁", 'index': 7};
    // collection.doc('quatang').set(myData).then((_) => print('Added')).catchError((error) => print('Add failed: $error'));
    // myData = {'color': "0x5FFFA325", 'description': "Đồ ăn", 'icon': "🍔", 'index': 8};
    // collection.doc('doan').set(myData).then((_) => print('Added')).catchError((error) => print('Add failed: $error'));
    // myData = {'color': "0x5FFFCF33", 'description': "Sức khoẻ", 'icon': "❤", 'index': 9};
    // collection.doc('suckhoe').set(myData).then((_) => print('Added')).catchError((error) => print('Add failed: $error'));
    // myData = {'color': "0x5FFF5342", 'description': "Nhà ở", 'icon': "🏠", 'index': 10};
    // collection.doc('nhao').set(myData).then((_) => print('Added')).catchError((error) => print('Add failed: $error'));
    // myData = {'color': "0x5FB07553", 'description': "Cà phê", 'icon': "☕", 'index': 11};
    // collection.doc('caphe').set(myData).then((_) => print('Added')).catchError((error) => print('Add failed: $error'));
    // myData = {'color': "0x5FFFA325", 'description': "Mua sắm", 'icon': "🛒", 'index': 12};
    // collection.doc('muasam').set(myData).then((_) => print('Added')).catchError((error) => print('Add failed: $error'));
    // myData = {'color': "0x5FB07553", 'description': "Thêm", 'icon': "➕", 'index': 13};
    // collection.doc('them').set(myData).then((_) => print('Added')).catchError((error) => print('Add failed: $error'));

    // var collection = FirebaseFirestore.instance.collection('incomeCategories');
    // var myData = {'color': "0x1FB07553", 'description': "Phiếu lương", 'icon': "💼", 'index': 1};
    // collection.doc('phieuluong').set(myData).then((_) => print('Added')).catchError((error) => print('Add failed: $error'));
    // myData = {'color': "0x5FFF5342", 'description': "Quà tặng", 'icon': "🎁", 'index': 2};
    // collection.doc('quatang').set(myData).then((_) => print('Added')).catchError((error) => print('Add failed: $error'));
    // myData = {'color': "0x5FFFCF33", 'description': "Chuyển khoản", 'icon': "💳", 'index': 3};
    // collection.doc('chuyenkhoan').set(myData).then((_) => print('Added')).catchError((error) => print('Add failed: $error'));
    // myData = {'color': "0x5FFF5342", 'description': "Khác", 'icon': "?", 'index': 4};
    // collection.doc('khac').set(myData).then((_) => print('Added')).catchError((error) => print('Add failed: $error'));
    // myData = {'color': "0x5FFF5342", 'description': "Tạo", 'icon': "➕", 'index': 5};
    // collection.doc('tao').set(myData).then((_) => print('Added')).catchError((error) => print('Add failed: $error'));
  }

  int _timeTab = 0;

  int get timeTab => _timeTab;

  set timeTab(int tab) {
    _timeTab = tab;
  }

  int? _remainingAmount;

  int? get remainingAmount => _remainingAmount;

  User? _user;

  User? get user => _user;

  Screen _mainScreen = Screen.budget;

  Screen get mainScreen => _mainScreen;

  set mainScreen(Screen screen) {
    _mainScreen = screen;
    notifyListeners();
  }

  ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;

  ApplicationLoginState get loginState => _loginState;

  set loginState(ApplicationLoginState state) {
    _loginState = state;
  }

  String? _email;

  String? get email => _email;

  List<Account> _accounts = [];

  List<Account> get accounts => _accounts;

  int getTotalAmount() {
    int sum = 0;
    for (Account acc in _accounts) {
      if (acc.visible) {
        sum += acc.value;
      }
    }
    return sum;
  }

  List<TransactionDetails> _transactions = [];

  List<TransactionDetails> get transactions => _transactions;

  List<Category> _expenseCategories = [];

  List<Category> get expenseCategories => _expenseCategories;

  List<Category> _incomeCategories = [];

  List<Category> get incomeCategories => _incomeCategories;

  void getTransactions(bool isExpense, DateTimeRange range) {
    if (_user != null) {
      FirebaseFirestore.instance
          .collection('userData/${_user!.uid}/transactions')
          .where('isExpense', isEqualTo: isExpense)
          .where('date', isGreaterThanOrEqualTo: range.start)
          .where('date', isLessThanOrEqualTo: range.end)
          .snapshots()
          .listen((snapshot) {
        for (final document in snapshot.docs) {
          _transactions.add(TransactionDetails(
              categoryID: document.data()['categoryID'],
              accountID: document.data()['accountID'],
              isExpense: isExpense,
              currencyunit: document.data()['currencyunit'],
              value: document.data()['value'],
              date: document.data()['date'],
              description: document.data()['description'],
              image1: document.data()['image1'],
              image2: document.data()['image2']));
        }
        notifyListeners();
      });
    }
  }

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

  Account? getAccount(String accountID) {
    for (Account acc in _accounts) {
      if (acc.id == accountID) {
        return acc;
      }
    }
  }

  Category? getCategory(String categoryID) {
    List<Category> categories = [];
    categories.addAll(_expenseCategories);
    categories.addAll(_incomeCategories);
    for (Category category in categories) {
      if (categoryID == category.id) {
        return category;
      }
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
    FacebookAuth.instance.logOut();
    _loginState = ApplicationLoginState.loggedOut;
    print('signOut');
    // notifyListeners();
  }
}
