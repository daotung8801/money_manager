import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'TitleText1.dart';

class PopUpNotification1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      title: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: TitleText1(text: 'Xuất dữ liệu dưới dạng', fontFamily: 'Inter', fontSize: 20, fontWeight: FontWeight.bold, r: 0, g: 0, b: 0),
      ),
      content: Row(children: [
        Padding(
          padding: EdgeInsets.only(left: 75.w),
          child: Icon(
              Icons.album_outlined,
              color: Color.fromARGB(255, 28, 169, 113)),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: TitleText1(text: 'Excel', fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.bold, r: 0, g: 0, b: 0),
        ),
      ]),
      actions: <Widget>[
        FlatButton(
          padding: EdgeInsets.only(right: 70.w, bottom: 10.h),
          child: TitleText1(text: 'Hủy', fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.bold, r: 28, g: 169, b: 113),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          padding: EdgeInsets.only(right: 50.w, bottom: 10.h),
          child: TitleText1(text: 'Xuất', fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.bold, r: 28, g: 169, b: 113),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}