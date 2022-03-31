import 'package:flutter/material.dart';
import 'Component/InputText1.dart';
import 'Component/ButtonPrimary.dart';
import 'Component/TitleText1.dart';

class CreateReminder extends StatelessWidget {
  CreateReminder({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: TitleText1(text: 'Tạo lời nhắc', fontFamily: 'Inter', fontSize: 25, fontWeight: FontWeight.bold, r: 255, g: 255, b: 255),
        backgroundColor: Colors.transparent,
        toolbarHeight: 72,
        elevation: 0.0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 35, 111, 87),
                Color.fromARGB(255, 35, 111, 87)
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        leading: IconButton(
          padding: EdgeInsets.only(left: 32),
          iconSize: 30,
          alignment: Alignment.center,
          icon: Icon(Icons.arrow_back_sharp),
          onPressed: () => {},
        ),
      ),
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
