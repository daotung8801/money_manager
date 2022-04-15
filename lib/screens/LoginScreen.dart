import 'package:flutter/material.dart';
import 'package:money_manager/screens/RegisterScreen.dart';
import '../components/PasswordTextField.dart';
import '../components/InputText1.dart';
import '../components/ButtonPrimary.dart';
import '../components/TitleText1.dart';
import 'HomeScreen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 50),
          child: TitleText1(text: 'Đăng nhập', fontFamily: 'Inter', fontSize: 25, fontWeight: FontWeight.bold, r: 0, g: 0, b: 0),
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 100,
        elevation: 0.0,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen(title: 'Tạo lời nhắc')));
            },
            child: Padding(
              padding: EdgeInsets.only(right: 16, top: 62),
              child: Text(
                'Đăng ký',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 35, 111, 87),
                ),),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 30),
            child: InputText1(hintText: 'Email', labelText: 'Email', maxLines: 1),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 20),
            child: PasswordTextField(hintText: 'Mật khẩu', labelText: 'Mật khẩu', maxLines: 1),
          ),
          Padding(
            padding: EdgeInsets.only(top: 130),
            child: ButtonPrimary(text: 'Đăng nhập', r: 35, g: 111, b: 87, radius: 30, weight: 343, height: 51, screenName: 'LoginScreen'),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'Quên mật khẩu?',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 35, 111, 87),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 80),
            child: TitleText1(text: 'Đăng nhập với', fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.normal, r: 0, g: 0, b: 0),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                IconButton(
                  padding: EdgeInsets.only(top: 10),
                  iconSize: 60,
                  icon: Image.asset("assets/fb.png"),
                  onPressed: () => {},
                ),
                IconButton(
                  padding: EdgeInsets.only(left: 30, top: 10),
                  iconSize: 60,
                  icon: Image.asset("assets/google.png"),
                  onPressed: () => {
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}