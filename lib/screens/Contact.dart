import 'package:flutter/material.dart';
import '../components/SmallHeader.dart';
import '../components/InputText1.dart';
import '../components/ButtonPrimary.dart';
import '../components/TitleText1.dart';

class Contact extends StatelessWidget {
  Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: SmallHeader(title: 'Liên hệ', icon: Icon(Icons.menu)),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 60),
            child:
                InputText1(hintText: '', labelText: 'Chủ đề thư', maxLines: 1),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 20),
            child: InputText1(
                hintText: '', labelText: 'Địa chỉ email', maxLines: 1),
          ),
          Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TitleText1(
                    text: 'Thư trả lời sẽ được gửi đến địa chỉ email này',
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    r: 0,
                    g: 0,
                    b: 0),
              )),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 20),
            child: InputText1(
                hintText: '', labelText: 'Nội dung thư', maxLines: 1),
          ),
          Padding(
            padding: EdgeInsets.only(top: 90),
            child: SizedBox(
              width: 93,
              height: 51,
              child: ButtonPrimary(
                text: 'Gửi',
                r: 35,
                g: 111,
                b: 87,
                radius: 30,
                weight: 343,
                height: 51,
                screenName: 'ContactScreen',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
