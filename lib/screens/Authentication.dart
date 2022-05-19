import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:money_manager/main.dart';
import 'package:money_manager/screens/HomeScreen.dart';
import 'package:provider/provider.dart';
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
            callback: (email) => verifyEmail(
                email, (e) => _showErrorDialog(context, 'Invalid email', e)));
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
          registerAccount: (
              email,
              displayName,
              password,
              ) {
            registerAccount(
                email,
                displayName,
                password,
                    (e) =>
                    _showErrorDialog(context, 'Failed to create account', e));
          },
        );
      case ApplicationLoginState.loggedIn:
        return HomeScreen();
        // return HomeScreen(title: 'title');
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
        break;
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
            SizedBox(
              width: 300.w,
              height: 51.h,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: TitleText1(
                    text: 'OK',
                    fontFamily: 'Inter',
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    r: 255,
                    g: 255,
                    b: 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.r)),
                ),
                color: Color.fromARGB(255, 35, 111, 87),
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
                      decoration: InputDecoration(
                        hintText: 'Nhập email của bạn',
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Inter',
                          color: Colors.black,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Inter',
                          color: Color.fromARGB(255, 189, 189, 189),
                        ),
                        border: OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 189, 189, 189), width: 1.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 35, 111, 87), width: 2.0),
                        ),
                      ),
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
                    child: SizedBox(
                      width: 343.w,
                      height: 51.h,
                      child: RaisedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            widget.callback(_controller.text);
                          }
                        },
                        child: TitleText1(
                            text: 'Tiếp tục',
                            fontFamily: 'Inter',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.normal,
                            r: 255,
                            g: 255,
                            b: 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.r)),
                        ),
                        color: Color.fromARGB(255, 35, 111, 87),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 1.sp),
              child: StyledTextButton(
                  onPressed: () async {},
                  child: Text(
                    'Quên mật khẩu?',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Inter',
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                  ))),
          Padding(
            padding: EdgeInsets.only(top: 100.sp),
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
          StyledTextButton(onPressed: widget.cancel, child: Text('Quay lại', style: TextStyle(color: Color.fromARGB(255, 35, 111, 87))))
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
                      decoration: InputDecoration(
                        hintText: 'Nhập email của bạn',
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Inter',
                          color: Colors.black,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Inter',
                          color: Color.fromARGB(255, 189, 189, 189),
                        ),
                        border: OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 189, 189, 189), width: 1.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 35, 111, 87), width: 2.0),
                        ),
                      ),
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
                      decoration: InputDecoration(
                        hintText: 'Nhập họ và tên',
                        labelText: 'Họ và tên',
                        labelStyle: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Inter',
                          color: Colors.black,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Inter',
                          color: Color.fromARGB(255, 189, 189, 189),
                        ),
                        border: OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 189, 189, 189), width: 1.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 35, 111, 87), width: 2.0),
                        ),
                      ),
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
                    child: SizedBox(
                      width: 343.w,
                      height: 51.h,
                      child: RaisedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            widget.registerAccount(
                              _emailController.text,
                              _displayNameController.text,
                              _passwordController.text,
                            );
                          }
                        },
                        child: TitleText1(
                            text: 'Đăng ký',
                            fontFamily: 'Inter',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.normal,
                            r: 255,
                            g: 255,
                            b: 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.r)),
                        ),
                        color: Color.fromARGB(255, 35, 111, 87),
                      ),
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
                      color: Colors.black,
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
          StyledTextButton(onPressed: widget.cancel, child: Text('Quay lại', style: TextStyle(color: Color.fromARGB(255, 35, 111, 87)))),
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
                      decoration: InputDecoration(
                        hintText: 'Nhập email của bạn',
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Inter',
                          color: Colors.black,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Inter',
                          color: Color.fromARGB(255, 189, 189, 189),
                        ),
                        border: OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 189, 189, 189), width: 1.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 35, 111, 87), width: 2.0),
                        ),
                      ),
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
                    child: SizedBox(
                      width: 343.w,
                      height: 51.h,
                      child: RaisedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            widget.login(
                              _emailController.text,
                              _passwordController.text,
                            );
                          }
                        },
                        child: TitleText1(
                            text: 'Đăng nhập',
                            fontFamily: 'Inter',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.normal,
                            r: 255,
                            g: 255,
                            b: 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.r)),
                        ),
                        color: Color.fromARGB(255, 35, 111, 87),
                      ),
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
                      color: Colors.black,
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
