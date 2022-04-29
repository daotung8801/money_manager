import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:money_manager/screens/CategoryScreen.dart';
import 'package:money_manager/screens/HomeScreen.dart';
import 'package:money_manager/screens/RegisterScreen.dart';

import '../components/ButtonPrimary.dart';
import '../components/InputText1.dart';
import '../components/TitleText1.dart';
import '/src/widgets.dart';

enum ApplicationLoginState {
  loggedOut,
  register,
  password,
  loggedIn,
}

class Authentication extends StatelessWidget {
  const Authentication({
    required this.loginState,
    required this.email,
    required this.verifyEmail,
    required this.signInWithEmailAndPassword,
    required this.cancelRegistration,
    required this.registerAccount,
    required this.signOut,
  });

  final ApplicationLoginState loginState;
  final String? email;
  final void Function(
      String email,
      void Function(Exception e) error,
      ) verifyEmail;
  final void Function(
      String email,
      String password,
      void Function(Exception e) error,
      ) signInWithEmailAndPassword;
  final void Function() cancelRegistration;
  final void Function(
      String email,
      String displayName,
      String password,
      void Function(Exception e) error,
      ) registerAccount;
  final void Function() signOut;

  @override
  Widget build(BuildContext context) {
    switch (loginState) {
      case ApplicationLoginState.loggedOut:
        return EmailForm(
            callback: (email) =>
                verifyEmail(
                    email, (e) =>
                    _showErrorDialog(context, 'Invalid email', e)));
      case ApplicationLoginState.password:
        return PasswordForm(
          email: email!,
          cancel: () {
            cancelRegistration();
          },
          login: (email, password) {
            signInWithEmailAndPassword(email, password,
                    (e) => _showErrorDialog(context, 'Failed to sign in', e));
          },
        );
      case ApplicationLoginState.register:
        return RegisterForm(
          email: email!,
          cancel: () {
            cancelRegistration();
          },
          registerAccount: (email,
              displayName,
              password,) {
            registerAccount(
                email,
                displayName,
                password,
                    (e) =>
                    _showErrorDialog(context, 'Failed to create account', e));
          },
        );
      case ApplicationLoginState.loggedIn:
        return HomeScreen(title: 'title');
        // return Row(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.only(left: 24, bottom: 8),
        //       child: StyledElevatedButton(
        //         width: 343,
        //         height: 51,
        //         onPressed: () {
        //           signOut();
        //         },
        //         child: const Text('LOGOUT'),
        //       ),
        //     ),
        //   ],
        // );
      default:
        return Row(
          children: const [
            Text("Internal error, this shouldn't happen..."),
          ],
        );
    }
  }

  static Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  static Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
    FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  void _showErrorDialog(BuildContext context, String title, Exception e) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(fontSize: 24),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  '${(e as dynamic).message}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            StyledElevatedButton(
              width: 343,
              height: 51,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ],
        );
      },
    );
  }
}

class EmailForm extends StatefulWidget {
  const EmailForm({required this.callback});

  final void Function(String email) callback;

  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_EmailFormState');
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 50),
          child: TitleText1(
              text: 'Đăng nhập với email',
              fontFamily: 'Inter',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              r: 0,
              g: 0,
              b: 0),
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 100,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 24),
                    child: TextFormField(
                      controller: _controller,
                      decoration: CommonStyle.textFieldStyle(
                          labelText: 'Email', hintText: 'Nhập email của bạn'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nhập địa chỉ email của bạn để tiếp tục';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                    child: StyledElevatedButton(
                      width: 343,
                      height: 51,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          widget.callback(_controller.text);
                        }
                      },
                      child: const Text('Tiếp tục'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 15),
              child: StyledTextButton(
                  onPressed: () async {},
                  child: Text(
                    'Quên mật khẩu?',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      // color: Color.fromARGB(255, 35, 111, 87),
                    ),
                  ))),
          Padding(
            padding: EdgeInsets.only(top: 80),
            child: TitleText1(
                text: 'Đăng nhập với',
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.normal,
                r: 0,
                g: 0,
                b: 0),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: MyIconButton.icon(
                        url: 'assets/fb.png',
                        onPressed: () {
                          Authentication.signInWithFacebook();
                        })),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: MyIconButton.icon(
                        url: 'assets/google.png',
                        onPressed: () {
                          Authentication.signInWithGoogle();
                        }))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    required this.registerAccount,
    required this.cancel,
    required this.email,
  });

  final String email;
  final void Function(String email, String displayName, String password)
  registerAccount;
  final void Function() cancel;

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_RegisterFormState');
  final _emailController = TextEditingController();
  final _displayNameController = TextEditingController();
  final _passwordController = TextEditingController();
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.email;
    _passwordVisible = false;
  }

  void _setVisible() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.zero,
          child: TitleText1(
              text: 'Đăng ký',
              fontFamily: 'Inter',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              r: 0,
              g: 0,
              b: 0),
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 100,
        elevation: 0.0,
        actions: [
          StyledTextButton(onPressed: widget.cancel, child: Text('Quay lại'))
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 24),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: CommonStyle.textFieldStyle(
                          labelText: 'Email', hintText: 'Nhập email của bạn'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nhập địa chỉ email của bạn để tiếp tục';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 24),
                    child: TextFormField(
                      controller: _displayNameController,
                      decoration: CommonStyle.textFieldStyle(
                          labelText: 'Họ và tên', hintText: 'Nhập họ và tên'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return null;
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 24),
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: CommonStyle.passwordFieldStyle(
                          labelText: 'Mật khẩu',
                          hintText: 'Nhập mật khẩu',
                          iconVisibilityOnPressed: _setVisible),
                      obscureText: !_passwordVisible,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                    child: StyledElevatedButton(
                      width: 343,
                      height: 51,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          widget.registerAccount(
                            _emailController.text,
                            _displayNameController.text,
                            _passwordController.text,
                          );
                        }
                      },
                      child: const Text('Đăng ký'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 15),
              child: StyledTextButton(
                  onPressed: () async {},
                  child: Text(
                    'Quên mật khẩu?',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      // color: Color.fromARGB(255, 35, 111, 87),
                    ),
                  ))),
          Padding(
            padding: EdgeInsets.only(top: 80),
            child: TitleText1(
                text: 'Đăng nhập với',
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.normal,
                r: 0,
                g: 0,
                b: 0),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: MyIconButton.icon(
                        url: 'assets/fb.png',
                        onPressed: () {
                          Authentication.signInWithFacebook();
                        })),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: MyIconButton.icon(
                        url: 'assets/google.png',
                        onPressed: () {
                          Authentication.signInWithGoogle();
                        }))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PasswordForm extends StatefulWidget {
  const PasswordForm(
      {required this.login, required this.email, required this.cancel});

  final String email;
  final void Function(String email, String password) login;
  final void Function() cancel;

  @override
  _PasswordFormState createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_PasswordFormState');
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.email;
    _passwordVisible = false;
  }

  void _setVisible() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.zero,
          child: TitleText1(
              text: 'Đăng nhập',
              fontFamily: 'Inter',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              r: 0,
              g: 0,
              b: 0),
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 100,
        elevation: 0.0,
        actions: [
          StyledTextButton(onPressed: widget.cancel, child: Text('Quay lại'))
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 24),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: CommonStyle.textFieldStyle(
                          labelText: 'Email', hintText: 'Nhập email của bạn'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nhập địa chỉ email của bạn để tiếp tục';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 24),
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: CommonStyle.passwordFieldStyle(
                          labelText: 'Mật khẩu',
                          hintText: 'Nhập mật khẩu',
                          iconVisibilityOnPressed: _setVisible),
                      obscureText: !_passwordVisible,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                    child: StyledElevatedButton(
                      width: 343,
                      height: 51,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          widget.login(
                            _emailController.text,
                            _passwordController.text,
                          );
                        }
                      },
                      child: const Text('Đăng nhập'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 15),
              child: StyledTextButton(
                  onPressed: () async {},
                  child: Text(
                    'Quên mật khẩu?',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      // color: Color.fromARGB(255, 35, 111, 87),
                    ),
                  ))),
          Padding(
            padding: EdgeInsets.only(top: 80),
            child: TitleText1(
                text: 'Đăng nhập với',
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.normal,
                r: 0,
                g: 0,
                b: 0),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: MyIconButton.icon(
                        url: 'assets/fb.png',
                        onPressed: () {
                          Authentication.signInWithFacebook();
                        })),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: MyIconButton.icon(
                        url: 'assets/google.png',
                        onPressed: () {
                          Authentication.signInWithGoogle();
                        }))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
