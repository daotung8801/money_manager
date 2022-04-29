import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../components/ButtonPrimary.dart';
import '../components/InputText1.dart';
import '../components/InputTextField.dart';
import '../components/NavigationDrawerWidget.dart';
import '../components/ScheduleIndex.dart';
import '../components/SmallHeader.dart';
import '../components/TitleText1.dart';
import 'package:money_manager/globals.dart' as globals;

class Reminder extends StatefulWidget {
  @override
  ReminderState createState() => ReminderState();
}

class ReminderState extends State<Reminder> {
  List<Color> colors = [
    Color.fromARGB(255, 35, 111, 87),
  ];
  static String _selectedRemind = '1 lần';
  List<String> remindList = [
    '1 lần',
    'Hàng ngày',
    'Mỗi tuần 1 lần',
    'Mỗi tháng 1 lần',
    'Mỗi năm 1 lần',
  ];

  static int dayPicked = 1;
  static int monthPicked = 1;
  final problemController = TextEditingController();
  List<IndexSchedule> listAccount = <IndexSchedule>[];
  String reminderName = '';
  String note = '';
  DateTime selectedDate = DateTime.now();
  TimeOfDay startTime =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);

  Widget DateBar() {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: 32),
      child: DatePicker(
        DateTime.now(),
        height: 84,
        width: 70,
        onDateChange: (val) {
          dayPicked = val.day;
          monthPicked = val.month;
          print('date changed');
          setState(() {});
        },
        initialSelectedDate: DateTime.now(),
        selectionColor: Color.fromARGB(255, 35, 111, 87),
        selectedTextColor: Colors.white,
        dateTextStyle: TextStyle(
          fontSize: 20,
          fontFamily: 'Nunito Sans',
          fontWeight: FontWeight.w600,
          color: Color.fromARGB(255, 37, 49, 65),
        ),
      ),
    );
  }

  void saveSchedule() {
    listAccount.add(new IndexSchedule(
        reminderName: reminderName,
        note: note,
        selectedDate: selectedDate,
        startTime: startTime));
    problemController.text = '';
    globals.listAccount = listAccount;
  }

  Future pickDate(BuildContext context) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 2),
      builder: (context, child) => Theme(
        data: ThemeData.light().copyWith(
          colorScheme:
              ColorScheme.light(primary: Color.fromARGB(255, 35, 111, 87)),
        ),
        child: child as Widget,
      ),
    );
    if (newDate == null) return;
    setState(() {
      selectedDate = newDate;
      Navigator.of(context).pop();
      _onButtonShowModalSheet();
    });
  }

  Future pickTime(BuildContext context) async {
    // final initialTime =
    //     TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
    final newTime = await showTimePicker(
      context: context,
      initialTime: startTime,
      builder: (context, child) => Theme(
        data: ThemeData.light().copyWith(
          colorScheme:
              ColorScheme.light(primary: Color.fromARGB(255, 35, 111, 87)),
        ),
        child: child as Widget,
      ),
    );
    if (newTime == null) return;
    setState(() {
      startTime = newTime;
      Navigator.of(context).pop();
      _onButtonShowModalSheet();
    });
  }

  String getTimeStringFormat() {
    return '${startTime.hour}:${startTime.minute}';
  }

  void _onButtonShowModalSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: this.context,
        isScrollControlled: true,
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height - 35,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: SmallHeader(
                  title: 'Tạo lời nhắc', icon: Icon(Icons.arrow_back_sharp)),
              body: Container(
                  padding: EdgeInsets.only(left: 32, right: 32, bottom: 30),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(232, 236, 244, 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TitleText1(
                                text: 'Tên',
                                fontFamily: 'Nunito Sans',
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                r: 37,
                                g: 49,
                                b: 65),
                            Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        onChanged: (text) {
                                          reminderName = text;
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'Tên lời nhắc',
                                          hintStyle: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Nunito Sans',
                                            color: Color.fromARGB(
                                                255, 189, 189, 189),
                                          ),
                                          border: OutlineInputBorder(),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 189, 189, 189),
                                                width: 1.0),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 189, 189, 189),
                                                width: 1.0),
                                          ),
                                          fillColor: Color.fromARGB(
                                              255, 232, 232, 232),
                                          filled: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: InputTextField(
                          hintText: _selectedRemind,
                          labelText: 'Tần suất',
                          maxline: 1,
                          widget: DropdownButton(
                            onChanged: (value) {
                              setState(() {
                                _selectedRemind = value.toString();
                                Navigator.of(context).pop();
                                _onButtonShowModalSheet();
                              });
                            },
                            icon: Icon(Icons.keyboard_arrow_down,
                                color: Colors.grey),
                            iconSize: 32,
                            elevation: 4,
                            underline: Container(height: 0),
                            items: remindList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value.toString(),
                                child: Text(value.toString()),
                                onTap: () {
                                  setState(() {
                                    _selectedRemind = value.toString();
                                  });
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: InputTextField(
                          hintText: DateFormat.yMd().format(selectedDate),
                          labelText: 'Chọn ngày',
                          maxline: 1,
                          widget: IconButton(
                            icon: Icon(Icons.calendar_today),
                            color: Color.fromARGB(255, 35, 111, 87),
                            onPressed: () {
                              pickDate(context);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: InputTextField(
                          hintText: getTimeStringFormat(),
                          labelText: 'Chọn thời gian',
                          maxline: 1,
                          widget: IconButton(
                            icon: Icon(Icons.access_time_rounded),
                            color: Color.fromARGB(255, 35, 111, 87),
                            onPressed: () {
                              pickTime(context);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TitleText1(
                                text: 'Ghi chú',
                                fontFamily: 'Nunito Sans',
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                r: 37,
                                g: 49,
                                b: 65),
                            Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        onChanged: (text) {
                                          note = text;
                                        },
                                        maxLines: 2,
                                        decoration: InputDecoration(
                                          hintText: 'Ghi chú',
                                          hintStyle: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Nunito Sans',
                                            color:
                                            Color.fromARGB(255, 189, 189, 189),
                                          ),
                                          border: OutlineInputBorder(),
                                          enabledBorder: const OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 189, 189, 189),
                                                width: 1.0),
                                          ),
                                          focusedBorder: const OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 189, 189, 189),
                                                width: 1.0),
                                          ),
                                          fillColor:
                                          Color.fromARGB(255, 232, 232, 232),
                                          filled: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                                child: SizedBox(
                              child: InkWell(
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 35, 111, 87),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text(
                                      "Hủy",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  }),
                              height: 50,
                            )),
                            Padding(padding: EdgeInsets.only(left: 40)),
                            Expanded(
                                child: SizedBox(
                              child: InkWell(
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 35, 111, 87),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text(
                                      "Đặt",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      saveSchedule();
                                    });
                                    Navigator.of(context).pop();
                                  }),
                              height: 50,
                            )),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        resizeToAvoidBottomInset: false,
        appBar: SmallHeader(title: 'Nhắc nhở', icon: Icon(Icons.menu)),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 50),
          child: FloatingActionButton(
            tooltip: 'Add action',
            child: Icon(Icons.add),
            onPressed: () {
              this._onButtonShowModalSheet();
            },
            backgroundColor: Color.fromARGB(255, 35, 111, 87),
          ),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: DateBar(),
            ),
            ListSchedule(
              listSchedule: listAccount,
            )
          ],
        ),
      );
}
