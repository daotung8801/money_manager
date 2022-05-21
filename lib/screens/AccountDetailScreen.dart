import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_manager/screens/AddAccount.dart';
import 'package:money_manager/src/widgets.dart';
import '../components/ButtonPrimary.dart';
import '../components/Category.dart';
import '../components/CategoryVWidget.dart';
import '../components/NavigationDrawerWidget.dart';
import '../components/TitleText1.dart';

class AccountDetailScreen extends StatelessWidget {
  AccountDetailScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  static String money = '800.000', date = '10 tháng 3, 2022', reminder = 'Nạp game lửa chùa';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: TitleText1(
            text: 'Chi tiết tài khoản',
            fontFamily: 'Inter',
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
            r: 255,
            g: 255,
            b: 255),
        backgroundColor: Colors.transparent,
        toolbarHeight: 72.h,
        elevation: 0.0,
        leading: IconButton(
          padding: EdgeInsets.only(left: 32.w),
          iconSize: 30.sp,
          icon: Icon(Icons.arrow_back_sharp),
          tooltip: 'Menu',
          onPressed: () => {Scaffold.of(context).openDrawer()},
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.r),
                bottomRight: Radius.circular(25.r)),
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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 25.h),
            child: TitleText1(
                text: 'Số tiền',
                fontFamily: 'Inter',
                fontSize: 15,
                fontWeight: FontWeight.normal,
                r: 102,
                g: 102,
                b: 102),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 5.h),
            child: TitleText1(
                text: money + ' ₫',
                fontFamily: 'Inter',
                fontSize: 19,
                fontWeight: FontWeight.normal,
                r: 0,
                g: 0,
                b: 0),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 20.h),
            child: TitleText1(
                text: 'Tài khoản',
                fontFamily: 'Inter',
                fontSize: 15,
                fontWeight: FontWeight.normal,
                r: 102,
                g: 102,
                b: 102),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 5.h),
            child: TitleText1(
                text: 'Chính',
                fontFamily: 'Inter',
                fontSize: 19,
                fontWeight: FontWeight.normal,
                r: 0,
                g: 0,
                b: 0),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 20.h),
            child: TitleText1(
                text: 'Danh mục',
                fontFamily: 'Inter',
                fontSize: 15,
                fontWeight: FontWeight.normal,
                r: 102,
                g: 102,
                b: 102),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 5.h),
            child: TitleText1(
                text: 'Giải trí',
                fontFamily: 'Inter',
                fontSize: 19,
                fontWeight: FontWeight.normal,
                r: 0,
                g: 0,
                b: 0),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 20.h),
            child: TitleText1(
                text: 'Ngày',
                fontFamily: 'Inter',
                fontSize: 15,
                fontWeight: FontWeight.normal,
                r: 102,
                g: 102,
                b: 102),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 5.h),
            child: TitleText1(
                text: date,
                fontFamily: 'Inter',
                fontSize: 19,
                fontWeight: FontWeight.normal,
                r: 0,
                g: 0,
                b: 0),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 20.h),
            child: TitleText1(
                text: 'Ghi chú',
                fontFamily: 'Inter',
                fontSize: 15,
                fontWeight: FontWeight.normal,
                r: 102,
                g: 102,
                b: 102),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 5.h),
            child: TitleText1(
                text: reminder,
                fontFamily: 'Inter',
                fontSize: 19,
                fontWeight: FontWeight.normal,
                r: 0,
                g: 0,
                b: 0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: 16.w, right: 16.w, top: 140.h),
                child: ButtonPrimary(
                    text: 'Xóa',
                    r: 255,
                    g: 2,
                    b: 2,
                    radius: 20,
                    weight: 94,
                    height: 51,
                    screenName: 'ContactScreen',
                    ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 16.w, right: 16.w, top: 140.h),
                child: ButtonPrimary(
                    text: 'Chỉnh sửa',
                    r: 35,
                    g: 111,
                    b: 87,
                    radius: 20,
                    weight: 143,
                    height: 51,
                    screenName: 'ContactScreen',
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
