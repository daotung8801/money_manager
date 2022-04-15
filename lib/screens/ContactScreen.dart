import 'package:flutter/material.dart';
import '../components/NavigationDrawerWidget.dart';
import '../components/SmallHeader.dart';
import '../components/InputText1.dart';
import '../components/ButtonPrimary.dart';
import '../components/TitleText1.dart';

class ContactScreen extends StatelessWidget {
  ContactScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      resizeToAvoidBottomInset: false,
      appBar: SmallHeader(title: 'Liên hệ', icon: Icon(Icons.menu)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 60),
            child: InputText1(hintText: 'Chủ đề thư', labelText: 'Chủ đề', maxLines: 1),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 60),
            child: InputText1(hintText: 'Địa chỉ email', labelText: 'Email', maxLines: 1),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 5),
            child: TitleText1(text: 'Thư trả lời sẽ được gửi đến địa chỉ email này', fontFamily: 'Inter', fontSize: 12, fontWeight: FontWeight.normal, r: 0, g: 0, b: 0),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 60),
            child: InputText1(hintText: 'Nội dung thư', labelText: 'Nội dung', maxLines: 2),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 90),
            child: ButtonPrimary(text: 'Gửi', r: 35, g: 111, b: 87, radius: 30, weight: 343, height: 51, screenName: 'ContactScreen'),
          ),
        ],
      ),
    );
  }
}