import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/TitleText1.dart';
import '../screens/Reminder.dart';
import 'DoctorInfo.dart';

class IndexSchedule extends Comparable {
  String reminderName, note;
  DateTime selectedDate = DateTime.now();
  TimeOfDay startTime =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);

  IndexSchedule(
      {required this.reminderName,
      required this.note,
      required this.selectedDate,
      required this.startTime}) {}

  String getTimeStringFormat() {
    DayPeriod _prd = startTime.period;
    return '${startTime.hour}:${startTime.minute} ${_prd.toString().split('.')[1].toUpperCase()}';
  }

  String getTimeRound() {
    DayPeriod _prd = startTime.period;
    return '${startTime.hour}:00 ${_prd.toString().split('.')[1].toUpperCase()}     ------------------------------------------';
  }

  @override
  int compareTo(other) {
    if (startTime.hour < other.startTime.hour) {
      return -1;
    }

    // age > other.age
    if (startTime.minute < other.startTime.minute) {
      return -1;
    }

    // age == other.age
    return 1;
  }
}

class ListSchedule extends StatelessWidget {
  List<IndexSchedule> listSchedule = <IndexSchedule>[];

  ListSchedule({required this.listSchedule});

  static List<Color> colors = [
    Color.fromARGB(255, 35, 111, 87),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(height: 800, child: this._buildWidget());
  }

  ListView _buildWidget() {
    List<IndexSchedule> tmp = listSchedule
        .where((element) =>
            element.selectedDate.day == ReminderState.dayPicked &&
            element.selectedDate.month == ReminderState.monthPicked)
        .toList();
    return ListView.builder(
        itemCount: tmp.length,
        itemBuilder: (context, index) {
          tmp.sort();
          return Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: TitleText1(
                      text: tmp[index].getTimeRound(),
                      fontFamily: 'Nunito Sans',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      r: 0,
                      g: 0,
                      b: 0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, left: 32, right: 35),
                  child: DoctorInfo(
                      reminderName: tmp[index].reminderName,
                      note: tmp[index].note,
                      imageSize: 70,
                      time: tmp[index].getTimeStringFormat(),
                      bigBox: ListSchedule.colors
                          .elementAt(index % ListSchedule.colors.length)),
                ),
              ],
            ),
          );
        });
  }
}
