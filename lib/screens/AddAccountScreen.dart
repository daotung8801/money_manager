import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_manager/screens/AddAccount.dart';
import 'package:money_manager/src/widgets.dart';
import '../components/ButtonPrimary.dart';
import '../components/Category.dart';
import '../components/CategoryVWidget.dart';
import '../components/InputText1.dart';
import '../components/NavigationDrawerWidget.dart';
import '../components/TitleText1.dart';

class AddAccountScreen extends StatelessWidget {
  AddAccountScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  static String money = '0',
      date = '10 tháng 3, 2022',
      reminder = 'Nạp game lửa chùa';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: TitleText1(
            text: 'Thêm tài khoản',
            fontFamily: 'Inter',
            fontSize: 25,
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
          onPressed: () => {Navigator.of(context).pop()},
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 180.w,
                  height: 100.h,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 30.h),
                    child:
                        InputText1(hintText: money, labelText: '', maxLines: 1),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: TitleText1(
                        text: '₫',
                        fontFamily: 'Inter',
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                        r: 35,
                        g: 111,
                        b: 87)),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 10.h),
              child: TitleText1(
                  text: 'Tên tài khoản',
                  fontFamily: 'Inter',
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  r: 102,
                  g: 102,
                  b: 102),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 5.h),
              child: InputText1(
                  hintText: 'Nhập tên tài khoản', labelText: '', maxLines: 1),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 25.h),
              child: TitleText1(
                  text: 'Biểu tượng',
                  fontFamily: 'Inter',
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  r: 102,
                  g: 102,
                  b: 102),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 300.h),
              child: TitleText1(
                  text: 'Màu sắc',
                  fontFamily: 'Inter',
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  r: 102,
                  g: 102,
                  b: 102),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 70.h),
              child: TitleText1(
                  text: 'Chọn đơn vị tiền tệ',
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
                  text: '₫',
                  fontFamily: 'Inter',
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  r: 35,
                  g: 111,
                  b: 87),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TitleText1(
                      text: 'Không bao gồm tổng số dư',
                      fontFamily: 'Inter',
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      r: 0,
                      g: 0,
                      b: 0
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 120.w),
                    child: Icon(
                        Icons.album_outlined,
                        color: Color.fromARGB(255, 28, 169, 113)),
                  ),
                ],
              ),
            ),
           Center(
             child: Padding(
               padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
               child: SizedBox(
                 width: 93.w,
                 height: 51.h,
                 child: RaisedButton(
                   onPressed: () {
                    Navigator.pop(context);
                   },
                   child: TitleText1(
                       text: 'Thêm',
                       fontFamily: 'Inter',
                       fontSize: 15.sp,
                       fontWeight: FontWeight.bold,
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
           ),
          ],
        ),
      ),
    );
  }
}
