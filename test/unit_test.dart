import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:money_manager/main.dart';
import 'package:money_manager/screens/Authentication.dart';

void main() {
  group('test', () {
    test('AppLoginState start with loggedOut', () {
      WidgetsFlutterBinding.ensureInitialized();
      expect(ApplicationState().loginState, ApplicationLoginState.loggedOut);
      expect(ApplicationState().email, null);
    });
  });
}
