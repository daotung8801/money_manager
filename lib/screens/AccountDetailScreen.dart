import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_manager/components/CategoryHWidget.dart';
import 'package:money_manager/components/Transaction.dart';
import 'package:money_manager/main.dart';
import 'package:money_manager/screens/AddAccount.dart';
import 'package:money_manager/src/widgets.dart';
import '../components/ButtonPrimary.dart';
import '../components/Category.dart';
import '../components/CategoryVWidget.dart';
import '../components/NavigationDrawerWidget.dart';
import '../components/TitleText1.dart';

class AccountDetailScreen extends StatelessWidget {
  const AccountDetailScreen({Key? key, required this.transactionDetails})
      : super(key: key);

  final TransactionDetails transactionDetails;

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
                fontSize: 13,
                fontWeight: FontWeight.normal,
                r: 102,
                g: 102,
                b: 102),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 5.h),
            child: TitleText1(
                text: transactionDetails.value.toString() + ' ₫',
                fontFamily: 'Inter',
                fontSize: 18,
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
                fontSize: 13,
                fontWeight: FontWeight.normal,
                r: 102,
                g: 102,
                b: 102),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 5.h),
            child: CategoryHWidget(
                category: Category(
                    id: ApplicationState.getInstance
                        .getAccount(transactionDetails.accountID)!
                        .id,
                    icon: ApplicationState.getInstance
                        .getAccount(transactionDetails.accountID)!
                        .icon,
                    color: ApplicationState.getInstance
                        .getAccount(transactionDetails.accountID)!
                        .color,
                    description: ApplicationState.getInstance
                        .getAccount(transactionDetails.accountID)!
                        .description)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 20.h),
            child: TitleText1(
                text: 'Danh mục',
                fontFamily: 'Inter',
                fontSize: 13,
                fontWeight: FontWeight.normal,
                r: 102,
                g: 102,
                b: 102),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 5.h),
            child: CategoryHWidget(
                category: ApplicationState.getInstance
                    .getCategory(transactionDetails.categoryID)!),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 20.h),
            child: TitleText1(
                text: 'Ngày',
                fontFamily: 'Inter',
                fontSize: 13,
                fontWeight: FontWeight.normal,
                r: 102,
                g: 102,
                b: 102),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 5.h),
            child: TitleText1(
                text:
                    '${transactionDetails.date.toDate().day} tháng ${transactionDetails.date.toDate().month}, ${transactionDetails.date.toDate().year}',
                fontFamily: 'Inter',
                fontSize: 18,
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
                fontSize: 13,
                fontWeight: FontWeight.normal,
                r: 102,
                g: 102,
                b: 102),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 5.h),
            child: TitleText1(
                text: transactionDetails.description!,
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.normal,
                r: 0,
                g: 0,
                b: 0),
          ),
          Center(
            child:   Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 220.h),
              child: SizedBox(
                width: 94.w,
                height: 51.h,
                child: RaisedButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection(
                        'userData/${ApplicationState.getInstance.user!.uid}/transactions')
                        .doc(transactionDetails.id)
                        .delete()
                        .then((_) => print('Deleted'))
                        .catchError((error) => print('Delete failed: $error'));
                    Navigator.pop(context);
                  },
                  child: TitleText1(
                      text: 'Xóa',
                      fontFamily: 'Inter',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      r: 255,
                      g: 255,
                      b: 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.r)),
                  ),
                  color: Colors.red,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
