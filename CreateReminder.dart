import 'package:flutter/material.dart';
import 'package:money_manager_test/Component/SmallHeader.dart';
import 'Component/InputText1.dart';
import 'Component/ButtonPrimary.dart';

class CreateReminder extends StatelessWidget {
  CreateReminder({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: SmallHeader(title: 'Tạo lời nhắc', icon: Icon(Icons.arrow_back_sharp)),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 60),
            child: InputText1(hintText: 'Tên lời nhắc', labelText: 'Tên', maxLines: 1),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 20),
            child: InputText1(hintText: 'Tần suất', labelText: 'Tần suất', maxLines: 1),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 20),
            child: InputText1(hintText: 'Ngày', labelText: 'Ngày', maxLines: 1),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 20),
            child: InputText1(hintText: 'Giờ', labelText: 'Giờ', maxLines: 1),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 20),
            child: InputText1(hintText: 'Ghi chú', labelText: 'Ghi chú', maxLines: 3),
          ),
          Padding(
            padding: EdgeInsets.only(top: 90),
            child: SizedBox (
              width: 93,
              height: 51,
              child: ButtonPrimary(text: 'Tạo', r: 35, g: 111, b: 87, radius: 30, weight: 93, height: 51,),
            ),
          ),
        ],
      ),
    );
  }
}
