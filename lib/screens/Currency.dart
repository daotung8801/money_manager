import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/NavigationDrawerWidget.dart';
import '../components/SmallHeader.dart';
import '../components/TitleText1.dart';

class Currency extends StatelessWidget {
  Currency({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      resizeToAvoidBottomInset: false,
      appBar: SmallHeader(title: 'Tiền tệ', icon: Icon(Icons.menu)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 36.h),
            child: TitleText1(
                text: 'Chọn đơn vị tiền tệ mặc định',
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.normal,
                r: 0,
                g: 0,
                b: 0),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
            child: TitleText1(
                text: 'Đóng tiền điện nước',
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.normal,
                r: 0,
                g: 0,
                b: 0),
          ),
        ],
      ),
    );
  }
}