import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_manager/components/CategoryHWidget.dart';
import 'package:money_manager/components/ExpenseTabBar.dart';
import 'package:money_manager/components/Transaction.dart';
import 'package:provider/provider.dart';
import '../components/PlusButton.dart';
import '../main.dart';
import 'ButtonPrimary.dart';
import 'DatePicker1.dart';
import 'DateRangePicker.dart';
import 'TitleText1.dart';
import 'TransactionContentWidget.dart';

class BudgetTaskBar extends StatelessWidget {
  const BudgetTaskBar({Key? key, required this.isExpense}) : super(key: key);

  final bool isExpense;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 5, // length of tabs
      initialIndex: ApplicationState.getInstance.timeTab,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: TabBar(
                labelColor: Color.fromARGB(255, 35, 111, 87),
                labelStyle: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold),
                unselectedLabelColor: Colors.black,
                indicatorWeight: 2.2.sp,
                indicatorColor: Color.fromARGB(255, 35, 111, 87),
                padding: EdgeInsets.only(top: 10.h, left: 0.w, right: 10.w),
                indicatorPadding:
                    EdgeInsets.only(left: 25.0.w, bottom: 5.0.h, right: 1.w),
                labelPadding: EdgeInsets.only(left: 23.0.w),
                isScrollable: true,
                tabs: [
                  Tab(text: 'Ngày'),
                  Tab(text: 'Tuần'),
                  Tab(text: 'Tháng'),
                  Tab(text: 'Năm'),
                  Tab(text: 'Khoảng thời gian'),
                ],
              ),
            ),
            Container(
              height: 400.h, //height of TabBarView
              decoration: BoxDecoration(),
              child: TabBarView(
                children: <Widget>[
                  TransactionsByCategoryWidget(
                      dateTimeRange: DateTimeRange(
                          start: DateTime(DateTime.now().year,
                              DateTime.now().month, DateTime.now().day),
                          end: DateTime(DateTime.now().year,
                              DateTime.now().month, DateTime.now().day)),
                      tab: TAB.DATE,
                      isExpense: isExpense),
                  // Center(
                  //   child: Column(
                  //     children: <Widget>[
                  //       DatePicker1(),
                  //       TitleText1(text: 'Tổng cộng: 2,000,000 đ', fontFamily: 'Inter', fontSize: 15, fontWeight: FontWeight.bold, r: 0, g: 0, b: 0),
                  //       // Padding(
                  //       //   padding: EdgeInsets.only(left: 260.w, top: 280.h),
                  //       //   child: PlusButton(),
                  //       // ),
                  //     ],
                  //   ),
                  // ),
                  Center(
                      child: TitleText1(
                          text: 'Tab 2',
                          fontFamily: 'Inter',
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          r: 0,
                          g: 0,
                          b: 0)),
                  Center(
                      child: TitleText1(
                          text: 'Tab 3',
                          fontFamily: 'Inter',
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          r: 0,
                          g: 0,
                          b: 0)),
                  Center(
                      child: TitleText1(
                          text: 'Tab 4',
                          fontFamily: 'Inter',
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          r: 0,
                          g: 0,
                          b: 0)),
                  // Center(
                  //   child: Column(
                  //     children: <Widget>[
                  //       DateRangePicker(),
                  //       TitleText1(text: 'Tổng cộng: 2,000,000 đ', fontFamily: 'Inter', fontSize: 15, fontWeight: FontWeight.bold, r: 0, g: 0, b: 0),
                  //       // Padding(
                  //       //   padding: EdgeInsets.only(left: 260.w, top: 280.h, bottom: 1.h),
                  //       //     child: PlusButton(),
                  //       // ),
                  //     ],
                  //   ),
                  // ),
                  TransactionsByCategoryWidget(
                      tab: TAB.RANGE, isExpense: isExpense),
                ],
              ),
            ),
          ]),
    );
  }
}

class TransactionsByCategoryWidget extends StatefulWidget {
  final bool isExpense;
  DateTimeRange? dateTimeRange;
  final TAB tab;

  TransactionsByCategoryWidget(
      {this.dateTimeRange, required this.tab, required this.isExpense});

  @override
  _TransactionsByCategoryState createState() {
    ApplicationState.getInstance.timeTab = tab.index;
    if (dateTimeRange == null) {
      dateTimeRange = DateTimeRange(
          start: DateTime(DateTime.now().year, DateTime.now().month, 1),
          end: DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day));
    }
    return _TransactionsByCategoryState(
        dateTimeRange: this.dateTimeRange!,
        tab: this.tab,
        isExpense: this.isExpense);
  }
}

class _TransactionsByCategoryState extends State<TransactionsByCategoryWidget> {
  final bool isExpense;
  DateTimeRange dateTimeRange;
  final tab;
  int _amount = 0;

  _TransactionsByCategoryState(
      {required this.dateTimeRange,
      required this.tab,
      required this.isExpense});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (dateTimeRange == null) {
      selectRange();
    }
  }

  void _setDateTimeRange(DateTimeRange dateTimeRange) {
    setState(() {
      this.dateTimeRange = dateTimeRange;
    });
  }

  void _setAmount(int amount) {
    setState(() {
      _amount = amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider.value(
      value: ApplicationState.getInstance,
      builder: (context, _) =>
          Consumer<ApplicationState>(builder: (context, appState, _) {
        return Center(
          child: Column(
            children: <Widget>[
              dateTimeRangeWidget(tab),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('userData/${appState.user!.uid}/transactions')
                    .where('isExpense', isEqualTo: isExpense)
                    .where('date',
                        isGreaterThanOrEqualTo: DateTime(
                            dateTimeRange.start.year,
                            dateTimeRange.start.month,
                            dateTimeRange.start.day))
                    .where('date',
                        isLessThanOrEqualTo: DateTime(dateTimeRange.end.year,
                            dateTimeRange.end.month, dateTimeRange.end.day))
                    // .orderBy('date', descending: true)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }
                  int amount = 0;
                  for (DocumentSnapshot doc in snapshot.data!.docs) {
                    amount += doc['value'] as int;
                  }
                  _amount = amount;
                  return TitleText1(
                      text: 'Tổng cộng: ${_amount} đ',
                      fontFamily: 'Inter',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      r: 0,
                      g: 0,
                      b: 0);
                },
              ),
              Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('userData/${appState.user!.uid}/transactions')
                    .where('isExpense', isEqualTo: isExpense)
                    .where('date',
                        isGreaterThanOrEqualTo: DateTime(
                            dateTimeRange.start.year,
                            dateTimeRange.start.month,
                            dateTimeRange.start.day))
                    .where('date',
                        isLessThanOrEqualTo: DateTime(dateTimeRange.end.year,
                            dateTimeRange.end.month, dateTimeRange.end.day))
                    // .orderBy('date', descending: true)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  print(dateTimeRange);
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }
                  int sum = 0;
                  Map<String, int> categories = Map();
                  for (DocumentSnapshot document in snapshot.data!.docs) {
                    categories.update(document['categoryID'],
                        (value) => value + document['value'] as int,
                        ifAbsent: () => document['value'] as int);
                    sum += document['value'] as int;
                  }
                  Map<String, int> sortedCategories = SplayTreeMap.from(
                      categories,
                      (key1, key2) =>
                          categories[key2]!.compareTo(categories[key1]!));
                  return ListView.builder(
                    itemCount: sortedCategories.length,
                    itemBuilder: (BuildContext context, int index) {
                      String key = sortedCategories.keys.elementAt(index);
                      return AmountForCategoryWidget(
                          categoryID: key,
                          amount: sortedCategories[key]!,
                          percentage:
                              (sortedCategories[key]! * 100.0 / sum).round());
                    },
                  );
                },
              ))
            ],
          ),
        );
      }),
    );
  }

  Widget dateTimeRangeWidget(TAB tab) {
    DateTime start = DateTime(dateTimeRange.start.year,
        dateTimeRange.start.month, dateTimeRange.start.day);
    DateTime end = DateTime(
        dateTimeRange.end.year, dateTimeRange.end.month, dateTimeRange.end.day);
    DateTime now =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    switch (tab) {
      case TAB.DATE:
        Future<Function?> onPress() async {
          final newDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(DateTime.now().year - 1),
            lastDate: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day),
            builder: (context, child) => Theme(
              data: ThemeData.light().copyWith(
                colorScheme: ColorScheme.light(
                    primary: Color.fromARGB(255, 35, 111, 87)),
              ),
              child: child as Widget,
            ),
          );
          if (newDate != null) {
            _setDateTimeRange(DateTimeRange(start: newDate, end: newDate));
          }
        }
        if (start.year == now.year) {
          if (start.isAtSameMomentAs(now)) {
            return TextButton(
                onPressed: onPress,
                child: Text('Hôm nay, ${start.day} tháng ${start.month}',
                    style: TextStyle(color: Colors.black)));
          } else if (start
              .isAtSameMomentAs(now.subtract(const Duration(days: 1)))) {
            return TextButton(
                onPressed: onPress,
                child: Text('Hôm qua, ${start.day} tháng ${start.month}',
                    style: TextStyle(color: Colors.black)));
          } else {
            return TextButton(
                onPressed: onPress,
                child: Text('${start.day} tháng ${start.month}',
                    style: TextStyle(color: Colors.black)));
          }
        } else {
          return TextButton(
              onPressed: onPress,
              child: Text('${start.day} tháng ${start.month}, ${start.year}',
                  style: TextStyle(color: Colors.black)));
        }
        break;
      // case TAB.WEEK:
      //   Future<Function?> onPress() async {
      //     final newDate = await showDateRangePicker(
      //       context: context,
      //       initialDateRange: ,
      //       firstDate: DateTime(DateTime.now().year - 1),
      //       lastDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
      //       builder: (context, child) => Theme(
      //         data: ThemeData.light().copyWith(
      //           colorScheme: ColorScheme.light(primary: Color.fromARGB(255, 35, 111, 87)),
      //         ),
      //         child: child as Widget,
      //       ),
      //     );
      //     if (newDate!= null){
      //       _setDateTimeRange(DateTimeRange(start: newDate, end: newDate));
      //     }
      //   }
      //   if (start.year == now.year){
      //     if (start.isAtSameMomentAs(now)){
      //       return TextButton(onPressed: onPress, child: Text('Hôm nay, ${start.day} tháng ${start.month}'));
      //     } else if (start.isAtSameMomentAs(now.subtract(const Duration(days: 1)))){
      //       return TextButton(onPressed: onPress, child: Text('Hôm qua, ${start.day} tháng ${start.month}'));
      //     } else {
      //       return TextButton(onPressed: onPress, child: Text('${start.day} tháng ${start.month}'));
      //     }
      //   } else {
      //     return TextButton(onPressed: onPress, child: Text('${start.day} tháng ${start.month}, ${start.year}'));
      //   }
      case TAB.RANGE:
        if (start.year == end.year) {
          return TextButton(
              onPressed: selectRange,
              child: Text(
                  'Từ ${start.day}/${start.month} đến ${end.day}/${end.month}/${end.year}',
                  style: TextStyle(color: Colors.black)));
        } else {
          return TextButton(
              onPressed: selectRange,
              child: Text(
                  'Từ ${start.day}/${start.month}/${start.year} đến ${end.day}/${end.month}/${end.year}',
                  style: TextStyle(color: Colors.black)));
        }
      default:
        return Text('ADU');
    }
  }

  Future<Function?> selectRange() async {
    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 20),
      lastDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
      initialDateRange: DateTimeRange(
          start: DateTime(DateTime.now().year, DateTime.now().month, 1),
          end: DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day)),
      builder: (context, child) => Theme(
        data: ThemeData.light().copyWith(
          colorScheme:
              ColorScheme.light(primary: Color.fromARGB(255, 35, 111, 87)),
        ),
        child: child as Widget,
      ),
    );
    if (newDateRange != null) {
      _setDateTimeRange(
          DateTimeRange(start: newDateRange.start, end: newDateRange.end));
    }
  }
}

class AmountForCategoryWidget extends StatelessWidget {
  const AmountForCategoryWidget(
      {Key? key,
      required this.categoryID,
      required this.amount,
      this.onPress,
      required this.percentage})
      : super(key: key);

  final String categoryID;
  final int amount;
  final int percentage;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onPress,
      child: Row(
        children: [
          (ApplicationState.getInstance.getCategory(categoryID) != null
              ? CategoryHWidget(
                  category:
                      ApplicationState.getInstance.getCategory(categoryID)!,
                  hasImage: false,
                )
              : Text('Lỗi: Không tìm thấy danh mục')),
          Text('$percentage%'),
          Text('$amount đ'),
        ],
      ),
    );
  }
}
