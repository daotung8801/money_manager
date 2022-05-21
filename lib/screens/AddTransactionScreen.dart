import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_manager/components/Category.dart';
import 'package:money_manager/components/CategoryHWidget.dart';
import 'package:money_manager/components/InputTextDown.dart';
import 'package:money_manager/components/InputTextField.dart';
import 'package:money_manager/main.dart';
import '../components/Account.dart';
import '../components/ButtonPrimary.dart';
import '../components/CategoryVWidget.dart';
import '../components/DatePicker1.dart';
import '../components/InputText1.dart';
import '../components/TitleText1.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  _AddTransactionScreenState createState() =>
      _AddTransactionScreenState(index: this.index);
}

class _AddTransactionScreenState extends State<AddTransactionScreen>
    with SingleTickerProviderStateMixin {
  _AddTransactionScreenState({required this.index});

  final _formKey =
      GlobalKey<FormState>(debugLabel: '_AddTransactionScreenState');
  TextEditingController _amountController = TextEditingController();
  final int index;
  String? _selectedAccount;
  late List<bool> selectedExpense;
  late List<bool> selectedIncome;
  DateTime? selectedDate;
  List<bool> isSelectedDate = [false, false, false];
  TextEditingController _descriptionController = TextEditingController();
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: index);
    selectedExpense = List.filled(
        ApplicationState.getInstance.expenseCategories.length, false);
    selectedIncome = List.filled(
        ApplicationState.getInstance.incomeCategories.length, false);
  }

  void onControlPress(int index, bool isExpense) {
    setState(() {
      if (isExpense) {
        selectedExpense.fillRange(0, selectedExpense.length, false);
        selectedExpense[index] = true;
      } else {
        selectedIncome.fillRange(0, selectedIncome.length, false);
        selectedIncome[index] = true;
      }
    });
  }

  // Widget DateBar() {
  //   // TODO: implement build
  //   return Container(
  //     margin: EdgeInsets.only(left: 16.w),
  //     child: DatePicker(
  //       DateTime.now(),
  //       height: 71.h,
  //       width: 75.w,
  //       initialSelectedDate: DateTime.now(),
  //       selectionColor: Color.fromARGB(255, 35, 111, 87),
  //       selectedTextColor: Colors.white,
  //       dateTextStyle: TextStyle(
  //         fontSize: 13.sp,
  //         fontFamily: 'Nunito Sans',
  //         fontWeight: FontWeight.w600,
  //         color: Color.fromARGB(255, 37, 49, 65),
  //       ),
  //     ),
  //   );
  // }

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
            controller: _tabController,
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
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.save),
            tooltip: 'Lưu',
            backgroundColor: Color.fromARGB(255, 35, 111, 87),
            onPressed: () {
              bool isExpense = _tabController!.index == 0 ? true : false;
              print(_tabController!.index);
              if (_formKey.currentState!.validate()) {
                if (selectedDate != null) {
                  if (_selectedAccount != null) {
                    Category? category;
                    if (isExpense && selectedExpense.contains(true)) {
                      for (int i = 0; i < selectedExpense.length; i++) {
                        if (selectedExpense[i] == true) {
                          category =
                              ApplicationState.getInstance.expenseCategories[i];
                          break;
                        }
                      }
                    } else if (!isExpense && selectedIncome.contains(true)) {
                      for (int i = 0; i < selectedIncome.length; i++) {
                        if (selectedIncome[i] == true) {
                          category =
                              ApplicationState.getInstance.incomeCategories[i];
                          break;
                        }
                      }
                    } else {}
                    FirebaseFirestore.instance
                        .collection(
                            'userData/${ApplicationState.getInstance.user!.uid}/transactions')
                        .add({
                          'accountID': _selectedAccount,
                          'categoryID': category!.id,
                          'currencyunit': "₫",
                          'date': Timestamp.fromDate(selectedDate!),
                          'description': _descriptionController.text,
                          'isExpense': isExpense,
                          'value': num.parse(_amountController.text)
                        })
                        .then((_) => print('Success'))
                        .catchError((error) => print('Add failed: $error'));
                  }
                };
                Navigator.of(context).pop();
              }
            }),
        body: TabBarView(
          controller: _tabController,
          children: [
            SingleChildScrollView(
              child: Form(
                key: _formKey,
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
                            padding: EdgeInsets.only(
                                left: 16.w, right: 16.w, top: 20.h),
                            child: TextFormField(
                              controller: _amountController,
                              textAlign: TextAlign.end,
                              keyboardType: TextInputType.number,
                              autofocus: true,
                              style: TextStyle(fontSize: 30),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Số tiền không được bỏ trống';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        TitleText1(
                            text: '₫',
                            fontFamily: 'Inter',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
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
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          r: 102,
                          g: 102,
                          b: 102),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w, top: 10.h),
                      child: PopupMenuButton<String>(
                        onSelected: (String value) {
                          setState(() {
                            _selectedAccount = value;
                          });
                        },
                        child: _selectedAccount == null
                            ? Text('Chọn tài khoản')
                            : CategoryHWidget(
                                category: Category(
                                    index: ApplicationState.getInstance
                                        .getAccount(_selectedAccount!)!
                                        .index,
                                    id: ApplicationState.getInstance
                                        .getAccount(_selectedAccount!)!
                                        .id,
                                    icon: ApplicationState.getInstance
                                        .getAccount(_selectedAccount!)!
                                        .icon,
                                    color: ApplicationState.getInstance
                                        .getAccount(_selectedAccount!)!
                                        .color,
                                    description: ApplicationState.getInstance
                                        .getAccount(_selectedAccount!)!
                                        .description),
                              ),
                        itemBuilder: (BuildContext context) {
                          return ApplicationState.getInstance.accounts.map((e) {
                            return PopupMenuItem<String>(
                              child: Text('${e.icon} ${e.description}'),
                              value: e.id,
                            );
                          }).toList();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w, top: 25.h),
                      child: TitleText1(
                          text: 'Danh mục',
                          fontFamily: 'Inter',
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          r: 102,
                          g: 102,
                          b: 102),
                    ),
                    SizedBox(
                      height: 210.h,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.w, top: 10.h),
                        child: GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 4,
                          crossAxisSpacing: 4.0.h,
                          mainAxisSpacing: 4.0.w,
                          children: List.generate(
                              ApplicationState.getInstance.expenseCategories
                                          .length >
                                      8
                                  ? 8
                                  : ApplicationState
                                      .getInstance.expenseCategories.length,
                              (categoryIndex) => ToggleButtons(
                                    children: [
                                      CategoryVWidget(
                                          category: ApplicationState.getInstance
                                              .expenseCategories[categoryIndex])
                                    ],
                                    fillColor: Color(int.parse(ApplicationState
                                        .getInstance
                                        .expenseCategories[categoryIndex]
                                        .color)),
                                    renderBorder: false,
                                    isSelected: [
                                      selectedExpense[categoryIndex]
                                    ],
                                    onPressed: (_) =>
                                        onControlPress(categoryIndex, true),
                                  )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w, top: 10.h),
                      child: Row(
                        children: [
                          Expanded(
                              child: ToggleButtons(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Text(
                                        '${DateTime.now().day}/${DateTime.now().month}'),
                                    Text('Hôm nay'),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Text(
                                        '${DateTime.now().subtract(const Duration(days: 1)).day}/${DateTime.now().subtract(const Duration(days: 1)).month}'),
                                    Text('Hôm qua'),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: (selectedDate != null &&
                                        selectedDate!.isBefore(DateTime(
                                                DateTime.now().year,
                                                DateTime.now().month,
                                                DateTime.now().day)
                                            .subtract(Duration(days: 1)))
                                    ? Column(
                                        children: [
                                          Text(
                                              '${selectedDate!.day}/${selectedDate!.month}'),
                                          Text('Đã chọn'),
                                        ],
                                      )
                                    : Column(
                                        children: [
                                          Text(
                                              '${DateTime.now().subtract(const Duration(days: 2)).day}/${DateTime.now().subtract(const Duration(days: 2)).month}'),
                                          Text('Hai ngày trước'),
                                        ],
                                      )),
                              ),
                            ],
                            onPressed: (int index) {
                              setState(() {
                                isSelectedDate = [false, false, false];
                                isSelectedDate[index] = true;
                                selectedDate = DateTime(
                                        DateTime.now().year,
                                        DateTime.now().month,
                                        DateTime.now().day)
                                    .subtract(Duration(days: index));
                              });
                            },
                            isSelected: isSelectedDate,
                          )),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: IconButton(
                                onPressed: () async {
                                  DateTime? pickDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate:
                                          DateTime(DateTime.now().year - 1),
                                      lastDate: DateTime(
                                          DateTime.now().year,
                                          DateTime.now().month,
                                          DateTime.now().day),
                                      builder: (context, child) => Theme(
                                            data: ThemeData.light().copyWith(
                                              colorScheme: ColorScheme.light(
                                                  primary: Color.fromARGB(
                                                      255, 35, 111, 87)),
                                            ),
                                            child: child as Widget,
                                          ));
                                  setState(() {
                                    selectedDate = pickDate;
                                    DateTime now = DateTime(
                                        DateTime.now().year,
                                        DateTime.now().month,
                                        DateTime.now().day);
                                    if (selectedDate != null) {
                                      if (selectedDate!.isAtSameMomentAs(now)) {
                                        isSelectedDate = [true, false, false];
                                      } else if (selectedDate!.isAtSameMomentAs(
                                          now.subtract(Duration(days: 1)))) {
                                        isSelectedDate = [false, true, false];
                                      } else {
                                        isSelectedDate = [false, false, true];
                                      }
                                    }
                                    selectedDate = selectedDate;
                                  });
                                },
                                icon: Icon(Icons.calendar_today)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w, top: 10.h),
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
                        padding:
                            EdgeInsets.only(left: 16.w, right: 16.w, top: 5.h),
                        child: TextField(
                          controller: _descriptionController,
                          maxLength: 500,
                          maxLines: 4,
                          minLines: 1,
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w, top: 25.h),
                      child: TitleText1(
                          text: 'Ảnh',
                          fontFamily: 'Inter',
                          fontSize: 15,
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
                // autovalidateMode: AutovalidateMode.always,
              ),
            ),
            SingleChildScrollView(
              child: Form(
                key: _formKey,
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
                            padding: EdgeInsets.only(
                                left: 16.w, right: 16.w, top: 20.h),
                            child: TextFormField(
                              controller: _amountController,
                              textAlign: TextAlign.end,
                              keyboardType: TextInputType.number,
                              autofocus: true,
                              style: TextStyle(fontSize: 30),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Số tiền không được bỏ trống';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        TitleText1(
                            text: '₫',
                            fontFamily: 'Inter',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
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
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          r: 102,
                          g: 102,
                          b: 102),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w, top: 10.h),
                      child: PopupMenuButton<String>(
                        onSelected: (String value) {
                          setState(() {
                            _selectedAccount = value;
                          });
                        },
                        child: _selectedAccount == null
                            ? Text(
                                'Chọn tài khoản',
                              )
                            : CategoryHWidget(
                                category: Category(
                                    index: ApplicationState.getInstance
                                        .getAccount(_selectedAccount!)!
                                        .index,
                                    id: ApplicationState.getInstance
                                        .getAccount(_selectedAccount!)!
                                        .id,
                                    icon: ApplicationState.getInstance
                                        .getAccount(_selectedAccount!)!
                                        .icon,
                                    color: ApplicationState.getInstance
                                        .getAccount(_selectedAccount!)!
                                        .color,
                                    description: ApplicationState.getInstance
                                        .getAccount(_selectedAccount!)!
                                        .description),
                              ),
                        itemBuilder: (BuildContext context) {
                          return ApplicationState.getInstance.accounts.map((e) {
                            return PopupMenuItem<String>(
                              child: Text('${e.icon} ${e.description}'),
                              value: e.id,
                            );
                          }).toList();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w, top: 25.h),
                      child: TitleText1(
                          text: 'Danh mục',
                          fontFamily: 'Inter',
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          r: 102,
                          g: 102,
                          b: 102),
                    ),
                    SizedBox(
                      height: 210.h,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.w, top: 10.h),
                        child: GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 4,
                          crossAxisSpacing: 4.0.h,
                          mainAxisSpacing: 4.0.w,
                          children: List.generate(
                              ApplicationState
                                          .getInstance.incomeCategories.length >
                                      8
                                  ? 8
                                  : ApplicationState
                                      .getInstance.incomeCategories.length,
                              (categoryIndex) => ToggleButtons(
                                    children: [
                                      CategoryVWidget(
                                          category: ApplicationState.getInstance
                                              .incomeCategories[categoryIndex])
                                    ],
                                    fillColor: Color(int.parse(ApplicationState
                                        .getInstance
                                        .incomeCategories[categoryIndex]
                                        .color)),
                                    renderBorder: false,
                                    isSelected: [selectedIncome[categoryIndex]],
                                    onPressed: (_) =>
                                        onControlPress(categoryIndex, false),
                                  )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w, top: 10.h),
                      child: Row(
                        children: [
                          Expanded(
                              child: ToggleButtons(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Text(
                                        '${DateTime.now().day}/${DateTime.now().month}'),
                                    Text('Hôm nay'),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Text(
                                        '${DateTime.now().subtract(const Duration(days: 1)).day}/${DateTime.now().subtract(const Duration(days: 1)).month}'),
                                    Text('Hôm qua'),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: (selectedDate != null &&
                                        selectedDate!.isBefore(DateTime(
                                                DateTime.now().year,
                                                DateTime.now().month,
                                                DateTime.now().day)
                                            .subtract(Duration(days: 1)))
                                    ? Column(
                                        children: [
                                          Text(
                                              '${selectedDate!.day}/${selectedDate!.month}'),
                                          Text('Đã chọn'),
                                        ],
                                      )
                                    : Column(
                                        children: [
                                          Text(
                                              '${DateTime.now().subtract(const Duration(days: 2)).day}/${DateTime.now().subtract(const Duration(days: 2)).month}'),
                                          Text('Hai ngày trước'),
                                        ],
                                      )),
                              )
                            ],
                            onPressed: (int index) {
                              setState(() {
                                isSelectedDate = [false, false, false];
                                isSelectedDate[index] = true;
                                selectedDate = DateTime(
                                        DateTime.now().year,
                                        DateTime.now().month,
                                        DateTime.now().day)
                                    .subtract(Duration(days: index));
                              });
                            },
                            isSelected: isSelectedDate,
                          )),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: IconButton(
                                onPressed: () async {
                                  DateTime? pickDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate:
                                          DateTime(DateTime.now().year - 1),
                                      lastDate: DateTime(
                                          DateTime.now().year,
                                          DateTime.now().month,
                                          DateTime.now().day),
                                      builder: (context, child) => Theme(
                                            data: ThemeData.light().copyWith(
                                              colorScheme: ColorScheme.light(
                                                  primary: Color.fromARGB(
                                                      255, 35, 111, 87)),
                                            ),
                                            child: child as Widget,
                                          ));
                                  setState(() {
                                    selectedDate = pickDate;
                                    DateTime now = DateTime(
                                        DateTime.now().year,
                                        DateTime.now().month,
                                        DateTime.now().day);
                                    if (selectedDate != null) {
                                      if (selectedDate!.isAtSameMomentAs(now)) {
                                        isSelectedDate = [true, false, false];
                                      } else if (selectedDate!.isAtSameMomentAs(
                                          now.subtract(Duration(days: 1)))) {
                                        isSelectedDate = [false, true, false];
                                      } else {
                                        isSelectedDate = [false, false, true];
                                      }
                                    }
                                    selectedDate = selectedDate;
                                  });
                                },
                                icon: Icon(Icons.calendar_today)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w, top: 10.h),
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
                        padding:
                            EdgeInsets.only(left: 16.w, right: 16.w, top: 5.h),
                        child: TextField(
                          controller: _descriptionController,
                          maxLength: 500,
                          maxLines: 4,
                          minLines: 1,
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w, top: 25.h),
                      child: TitleText1(
                          text: 'Ảnh',
                          fontFamily: 'Inter',
                          fontSize: 15,
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
                // autovalidateMode: AutovalidateMode.always,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
