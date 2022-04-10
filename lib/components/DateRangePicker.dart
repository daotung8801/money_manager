import 'package:flutter/material.dart';
import 'TitleText1.dart';

class DateRangePicker extends StatefulWidget {
  @override
  DateRangePickerState createState() => DateRangePickerState();
}

class DateRangePickerState extends State<DateRangePicker> {
  DateTimeRange dateRange = DateTimeRange(start: DateTime.now(), end: DateTime.now().add(Duration(hours: 24 * 3)));
  bool isFirstTime1 = true;
  bool isFirstTime2 = true;

  Future pickDateRange(BuildContext context) async {
   final initialDateRange = DateTimeRange(
       start: DateTime.now(), 
       end: DateTime.now().add(Duration(hours: 24 * 3)),
   );

   final newDateRange = await showDateRangePicker(
     context: context,
     firstDate: DateTime(DateTime.now().year - 20),
     lastDate: DateTime(DateTime.now().year + 1),
     initialDateRange: initialDateRange,
     builder: (context, child) => Theme(
       data: ThemeData.light().copyWith(
         colorScheme: ColorScheme.light(primary: Color.fromARGB(255, 35, 111, 87)),
       ),
       child: child as Widget,
     ),
   );

   if (newDateRange == null) return;

   setState(() {
     this.dateRange = newDateRange;
   });
  }

  String getFrom() {
    if (isFirstTime1 == true) {
      isFirstTime1 = false;
      return 'Chọn khoảng thời gian';
    }
    return ('${dateRange.start.day}/${dateRange.start.month}/${dateRange.start.year}' + ' - ');
  }

  String getUntil() {
    if (isFirstTime2 == true) {
      isFirstTime2 = false;
      return '';
    }
    return '${dateRange.end.day}/${dateRange.end.month}/${dateRange.end.year}';
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      onPressed: () {
        pickDateRange(context);
      },
      child: TitleText1(text: (getFrom() + getUntil()), fontFamily: 'Inter', fontSize: 15, fontWeight: FontWeight.bold, r: 0, g: 0, b: 0),
      color: Color.fromARGB(255, 250, 250, 250),
      elevation: 0,
    );
  }
}
