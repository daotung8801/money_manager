import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/ButtonPrimary.dart';
import '../components/DatePicker1.dart';
import '../components/InputText1.dart';
import '../components/TitleText1.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';

class AddTransactionScreen1 extends StatefulWidget {
  const AddTransactionScreen1({Key? key, required this.index}) : super(key: key);

  final int index;
  @override
  AddTransactionScreenState createState() => AddTransactionScreenState(index: this.index);
}

class AddTransactionScreenState extends State<AddTransactionScreen1> {
  AddTransactionScreenState({required this.index});

  static String money = '0';
  final int index;

  Widget DateBar() {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: 16.w),
      child: DatePicker(
        DateTime.now(),
        height: 71.h,
        width: 75.w,
        initialSelectedDate: DateTime.now(),
        selectionColor: Color.fromARGB(255, 35, 111, 87),
        selectedTextColor: Colors.white,
        dateTextStyle: TextStyle(
          fontSize: 13.sp,
          fontFamily: 'Nunito Sans',
          fontWeight: FontWeight.w600,
          color: Color.fromARGB(255, 37, 49, 65),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: this.index,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: TitleText1(
                text: 'Thêm giao dịch',
                fontFamily: 'Inter',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                r: 255,
                g: 255,
                b: 255),
          ),
          backgroundColor: Colors.transparent,
          toolbarHeight: 100.h,
          elevation: 0.0,
          leading: IconButton(
            padding: EdgeInsets.only(left: 32.w, top: 10.h),
            iconSize: 30.sp,
            icon: Icon(Icons.arrow_back_sharp),
            onPressed: () => {Navigator.pop(context)},
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.r),
                  bottomRight: Radius.circular(25.r)),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 35, 111, 87),
                  Color.fromARGB(255, 35, 111, 87),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 3.sp,
            indicatorPadding:
                EdgeInsets.only(left: 50.0.w, right: 50.0.w, bottom: 2.0.h),
            padding: EdgeInsets.only(bottom: 20.0.w),
            tabs: [
              Tab(
                child: TitleText1(
                    text: 'Chi phí',
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    r: 255,
                    g: 255,
                    b: 255),
              ),
              Tab(
                child: TitleText1(
                    text: 'Thu nhập',
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    r: 255,
                    g: 255,
                    b: 255),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
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
                          padding:
                              EdgeInsets.only(left: 16.w, right: 16.r, top: 20.h),
                          child: InputText1(
                              hintText: money, labelText: '', maxLines: 1),
                        ),
                      ),
                      TitleText1(
                          text: 'đ',
                          fontFamily: 'Inter',
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          r: 35,
                          g: 111,
                          b: 87)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w, top: 5.h),
                    child: TitleText1(
                        text: 'Tài khoản',
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        r: 102,
                        g: 102,
                        b: 102),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w, top: 10.h),
                    child: TitleText1(
                        text: 'Chưa chọn',
                        fontFamily: 'Inter',
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        r: 35,
                        g: 111,
                        b: 87),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w, top: 25.h),
                    child: TitleText1(
                        text: 'Danh mục',
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        r: 102,
                        g: 102,
                        b: 102),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 200.h),
                    child: DateBar(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w, top: 10.h),
                    child: TitleText1(
                        text: 'Ghi chú',
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        r: 102,
                        g: 102,
                        b: 102),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 5.h),
                    child: InputText1(
                        hintText: 'Ghi chú', labelText: '', maxLines: 1),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w, top: 25.h),
                    child: TitleText1(
                        text: 'Ảnh',
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        r: 102,
                        g: 102,
                        b: 102),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16.w, right: 16.w, top: 20.h, bottom: 20.h),
                        child: ButtonPrimary(
                            text: '+',
                            r: 156,
                            g: 172,
                            b: 171,
                            radius: 5,
                            weight: 80,
                            height: 80,
                            screenName: 'ContactScreen',
                            fontSize: 50),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16, right: 16, top: 20, bottom: 20),
                        child: ButtonPrimary(
                            text: '+',
                            r: 156,
                            g: 172,
                            b: 171,
                            radius: 5,
                            weight: 80,
                            height: 80,
                            screenName: 'ContactScreen',
                            fontSize: 50),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
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
                          padding:
                          EdgeInsets.only(left: 16.w, right: 16.w, top: 20.h),
                          child: InputText1(
                              hintText: money, labelText: '', maxLines: 1),
                        ),
                      ),
                      TitleText1(
                          text: 'đ',
                          fontFamily: 'Inter',
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          r: 35,
                          g: 111,
                          b: 87)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w, top: 5.h),
                    child: TitleText1(
                        text: 'Tài khoản',
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        r: 102,
                        g: 102,
                        b: 102),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w, top: 10.h),
                    child: TitleText1(
                        text: 'Chưa chọn',
                        fontFamily: 'Inter',
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                        r: 35,
                        g: 111,
                        b: 87),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w, top: 25.h),
                    child: TitleText1(
                        text: 'Danh mục',
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        r: 102,
                        g: 102,
                        b: 102),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 200.h),
                    child: DateBar(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w, top: 10.h),
                    child: TitleText1(
                        text: 'Ghi chú',
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        r: 102,
                        g: 102,
                        b: 102),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 5.h),
                    child: InputText1(
                        hintText: 'Ghi chú', labelText: '', maxLines: 1),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w, top: 25.h),
                    child: TitleText1(
                        text: 'Ảnh',
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        r: 102,
                        g: 102,
                        b: 102),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16.w, right: 16.w, top: 20.h, bottom: 20.h),
                        child: ButtonPrimary(
                            text: '+',
                            r: 156,
                            g: 172,
                            b: 171,
                            radius: 5,
                            weight: 80,
                            height: 80,
                            screenName: 'ContactScreen',
                            fontSize: 50),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16.w, right: 16.w, top: 20.h, bottom: 20.h),
                        child: ButtonPrimary(
                            text: '+',
                            r: 156,
                            g: 172,
                            b: 171,
                            radius: 5,
                            weight: 80,
                            height: 80,
                            screenName: 'AddTransactionScreen',
                            fontSize: 50),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
