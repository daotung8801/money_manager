import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_manager/components/Transaction.dart';
import 'package:money_manager/components/TransactionContentWidget.dart';
import 'package:money_manager/main.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:provider/provider.dart';
import 'TitleText1.dart';

class ExpenseTabBar extends StatelessWidget {
  const ExpenseTabBar(
      {Key? key, required this.isExpense, required this.tab, this.categoryID})
      : super(key: key);
  final TAB tab;
  final bool isExpense;
  final String? categoryID;

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
                padding: EdgeInsets.only(top: 10),
                indicatorPadding:
                    EdgeInsets.only(left: 25.0.w, bottom: 5.0.h, right: 0.0.w),
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
            Expanded(
              // height: 400.h, //height of TabBarView
              // decoration: BoxDecoration(),
              child: TabBarView(children: <Widget>[
                TransactionsWidget(
                  dateTimeRange: DateTimeRange(
                      start: DateTime(DateTime.now().year, DateTime.now().month,
                          DateTime.now().day),
                      end: DateTime(DateTime.now().year, DateTime.now().month,
                          DateTime.now().day)),
                  tab: TAB.DATE,
                  isExpense: isExpense,
                  categoryID: categoryID,
                ),
                TransactionsWidget(
                  dateTimeRange: DateTimeRange(
                      start: DateTime(DateTime.now().year, DateTime.now().month,
                              DateTime.now().day)
                          .subtract(Duration(days: DateTime.now().weekday)),
                      end: DateTime(DateTime.now().year, DateTime.now().month,
                              DateTime.now().day)
                          .add(Duration(days: 6 - DateTime.now().weekday))),
                  tab: TAB.WEEK,
                  isExpense: isExpense,
                  categoryID: categoryID,
                ),
                TransactionsWidget(
                  dateTimeRange: DateTimeRange(
                      start: DateTime(
                          DateTime.now().year, DateTime.now().month, 1),
                      end: DateTime(
                          DateTime.now().year, DateTime.now().month + 1, 0)),
                  tab: TAB.MONTH,
                  isExpense: isExpense,
                  categoryID: categoryID,
                ),
                TransactionsWidget(
                  dateTimeRange: DateTimeRange(
                      start: DateTime(DateTime.now().year, 1, 1),
                      end: DateTime(DateTime.now().year, 12, 31)),
                  tab: TAB.YEAR,
                  isExpense: isExpense,
                  categoryID: categoryID,
                ),
                TransactionsWidget(
                  tab: TAB.RANGE,
                  isExpense: isExpense,
                  categoryID: categoryID,
                ),
              ]),
            ),
          ]),
    );
  }
}

enum TAB { DATE, WEEK, MONTH, YEAR, RANGE }

class TransactionsWidget extends StatefulWidget {
  final bool isExpense;
  DateTimeRange? dateTimeRange;
  final TAB tab;
  final String? categoryID;

  TransactionsWidget(
      {this.dateTimeRange,
      required this.tab,
      required this.isExpense,
      this.categoryID});

  @override
  _TransactionsState createState() {
    dateTimeRange ??= DateTimeRange(
        start: DateTime(DateTime.now().year, DateTime.now().month, 1),
        end: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
    return _TransactionsState(
        dateTimeRange: this.dateTimeRange!,
        tab: this.tab,
        isExpense: this.isExpense,
        categoryID: this.categoryID);
  }
}

class _TransactionsState extends State<TransactionsWidget> {
  final bool isExpense;
  DateTimeRange dateTimeRange;
  final tab;
  int _amount = 0;
  String? categoryID;

  _TransactionsState(
      {required this.dateTimeRange,
      required this.tab,
      required this.isExpense,
      this.categoryID});

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
        return Column(
          children: <Widget>[
            dateTimeRangeWidget(tab),
            StreamBuilder<QuerySnapshot>(
              stream: categoryID == null
                  ? FirebaseFirestore.instance
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
                      .snapshots()
                  : FirebaseFirestore.instance
                      .collection('userData/${appState.user!.uid}/transactions')
                      .where('isExpense', isEqualTo: isExpense)
                      .where('categoryID', isEqualTo: categoryID)
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
                    text: (amount < 1000000
                        ? 'Tổng cộng: $amount ₫'
                        : 'Tổng cộng: ${(amount ~/ 100000) / 10} Tr ₫'),
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
              stream: categoryID == null
                  ? FirebaseFirestore.instance
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
                      .snapshots()
                  : FirebaseFirestore.instance
                      .collection('userData/${appState.user!.uid}/transactions')
                      .where('isExpense', isEqualTo: isExpense)
                      .where('categoryID', isEqualTo: categoryID)
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
                  return Padding(padding: EdgeInsets.symmetric(horizontal: 30));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                DateTime date = dateTimeRange.end.add(const Duration(days: 1));
                return ListView(
                  children: snapshot.data!.docs.reversed
                      .map((DocumentSnapshot document) {
                    if (date.isAfter(document['date'].toDate())) {
                      date = document['date'].toDate();
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 26.0.w),
                              child: Container(
                                child: Text(
                                    '${date.day} tháng ${date.month}, ${date.year}',
                                    style: TextStyle(color: Colors.black)),
                                alignment: Alignment.centerLeft,
                              ),
                            ),
                            TransactionContentWidget(
                                transaction: TransactionDetails(
                              id: document.id,
                              categoryID: document['categoryID'],
                              accountID: document['accountID'],
                              isExpense: true,
                              currencyunit: document['currencyunit'],
                              value: document['value'],
                              date: document['date'],
                              description: document['description'],
                            ))
                          ],
                        ),
                      );
                    } else {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Column(
                          children: [
                            TransactionContentWidget(
                                transaction: TransactionDetails(
                              id: document.id,
                              categoryID: document['categoryID'],
                              accountID: document['accountID'],
                              isExpense: true,
                              currencyunit: document['currencyunit'],
                              value: document['value'],
                              date: document['date'],
                              description: document['description'],
                            ))
                          ],
                        ),
                      );
                    }
                  }).toList(),
                );
              },
            ))
          ],
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
      case TAB.WEEK:
        return TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                DateTime selectedDate = dateTimeRange.start;
                return AlertDialog(
                  title: Text("Select Week"),
                  content: Container(
                    // Need to use container to add size constraint.
                    width: 300,
                    height: 300,
                    child: dp.WeekPicker(
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 365)),
                      lastDate: DateTime.now(),
                      // save the selected date to _selectedDate DateTime variable.
                      // It's used to set the previous selected date when
                      // re-showing the dialog.
                      selectedDate: selectedDate,
                      onChanged: (dp.DatePeriod dateTime) {
                        // close the dialog when year is selected.
                        _setDateTimeRange(DateTimeRange(
                            start: dateTime.start, end: dateTime.end));
                        Navigator.pop(context);

                        // Do something with the dateTime selected.
                        // Remember that you need to use dateTime.year to get the year
                      },
                    ),
                  ),
                );
              },
            );
          },
          child: start.year == end.year
              ? Text(
                  'Từ ${start.day}/${start.month} đến ${end.day}/${end.month}/${end.year}',
                  style: TextStyle(color: Colors.black))
              : Text(
                  'Từ ${start.day}/${start.month}/${start.year} đến ${end.day}/${end.month}/${end.year}',
                  style: TextStyle(color: Colors.black)),
        );
      case TAB.MONTH:
        Future<Function?> onPressed() async {
          final selected = await showMonthYearPicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now(),
          );
          if (selected != null) {
            _setDateTimeRange(DateTimeRange(
                start: DateTime(selected.year, selected.month, 1),
                end: DateTime(selected.year, selected.month + 1, 0)));
            print(dateTimeRange.end);
          }
        }
        return TextButton(
            onPressed: onPressed,
            child: Text('Tháng ${start.month}, ${start.year}'));
      case TAB.YEAR:
        return TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  DateTime selectedDate = dateTimeRange.start;
                  return AlertDialog(
                    title: Text("Select Year"),
                    content: Container(
                      // Need to use container to add size constraint.
                      width: 300,
                      height: 300,
                      child: YearPicker(
                        firstDate: DateTime(DateTime.now().year - 10),
                        lastDate: DateTime(DateTime.now().year),
                        initialDate: DateTime.now(),
                        // save the selected date to _selectedDate DateTime variable.
                        // It's used to set the previous selected date when
                        // re-showing the dialog.
                        selectedDate: selectedDate,
                        onChanged: (DateTime dateTime) {
                          // close the dialog when year is selected.
                          _setDateTimeRange(DateTimeRange(
                              start: DateTime(dateTime.year, 1, 1),
                              end: DateTime(dateTime.year, 12, 31)));
                          Navigator.pop(context);

                          // Do something with the dateTime selected.
                          // Remember that you need to use dateTime.year to get the year
                        },
                      ),
                    ),
                  );
                },
              );
            },
            child: Text('${start.year}'));

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
