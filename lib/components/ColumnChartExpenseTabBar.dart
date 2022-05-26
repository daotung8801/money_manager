import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ColumnChartModel.dart';

class ColumnChartExpenseTabBar extends StatelessWidget {
  ColumnChartExpenseTabBar({Key? key}) : super(key: key);

  final List<ColumnChartModel> dayData = [
    ColumnChartModel(time: '30/1', money: 800, color: charts.ColorUtil.fromDartColor(const Color.fromARGB(255, 35, 111, 87))),
    ColumnChartModel(time: '28/2', money: 500, color: charts.ColorUtil.fromDartColor(const Color.fromARGB(255, 35, 111, 87))),
    ColumnChartModel(time: '27/3', money: 700, color: charts.ColorUtil.fromDartColor(const Color.fromARGB(255, 35, 111, 87))),
    ColumnChartModel(time: '26/4', money: 600, color: charts.ColorUtil.fromDartColor(const Color.fromARGB(255, 35, 111, 87))),
    ColumnChartModel(time: '25/5', money: 550, color: charts.ColorUtil.fromDartColor(const Color.fromARGB(255, 35, 111, 87))),
    ColumnChartModel(time: '30/6', money: 400, color: charts.ColorUtil.fromDartColor(const Color.fromARGB(255, 35, 111, 87))),
    ColumnChartModel(time: '25/7', money: 350, color: charts.ColorUtil.fromDartColor(const Color.fromARGB(255, 35, 111, 87))),
    ColumnChartModel(time: '1/8', money: 750, color: charts.ColorUtil.fromDartColor(const Color.fromARGB(255, 35, 111, 87))),
    // ColumnChartModel(month: 'Th9', money: 700, color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 111, 87))),
    // ColumnChartModel(month: 'Th10', money: 720, color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 111, 87))),
    // ColumnChartModel(month: 'Th11', money: 350, color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 111, 87))),
    // ColumnChartModel(month: 'Th12', money: 800, color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 111, 87))),
  ];

  final List<ColumnChartModel> monthData = [
    ColumnChartModel(time: 'Th1', money: 800, color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 111, 87))),
    ColumnChartModel(time: 'Th2', money: 500, color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 111, 87))),
    ColumnChartModel(time: 'Th3', money: 700, color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 111, 87))),
    ColumnChartModel(time: 'Th4', money: 600, color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 111, 87))),
    ColumnChartModel(time: 'Th5', money: 550, color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 111, 87))),
    ColumnChartModel(time: 'Th6', money: 400, color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 111, 87))),
    ColumnChartModel(time: 'Th7', money: 350, color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 111, 87))),
    ColumnChartModel(time: 'Th8', money: 750, color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 111, 87))),
    // ColumnChartModel(month: 'Th9', money: 700, color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 111, 87))),
    // ColumnChartModel(month: 'Th10', money: 720, color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 111, 87))),
    // ColumnChartModel(month: 'Th11', money: 350, color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 111, 87))),
    // ColumnChartModel(month: 'Th12', money: 800, color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 111, 87))),
  ];

  final List<ColumnChartModel> yearData = [
    ColumnChartModel(time: '2015', money: 800, color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 111, 87))),
    ColumnChartModel(time: '2016', money: 500, color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 111, 87))),
    ColumnChartModel(time: '2017', money: 700, color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 111, 87))),
    ColumnChartModel(time: '2018', money: 600, color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 111, 87))),
    ColumnChartModel(time: '2019', money: 550, color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 111, 87))),
    ColumnChartModel(time: '2020', money: 400, color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 111, 87))),
    ColumnChartModel(time: '2021', money: 350, color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 111, 87))),
    ColumnChartModel(time: '2022', money: 750, color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 111, 87))),
    // ColumnChartModel(month: 'Th9', money: 700, color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 111, 87))),
    // ColumnChartModel(month: 'Th10', money: 720, color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 111, 87))),
    // ColumnChartModel(month: 'Th11', money: 350, color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 111, 87))),
    // ColumnChartModel(month: 'Th12', money: 800, color: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 35, 111, 87))),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ColumnChartModel, String>> daySeries = [
      charts.Series(
        id: "money",
        data: dayData,
        domainFn: (ColumnChartModel daySeries, _) => daySeries.time,
        measureFn: (ColumnChartModel daySeries, _) => daySeries.money,
        colorFn: (ColumnChartModel daySeries, _) => daySeries.color,
      ),
    ];

    List<charts.Series<ColumnChartModel, String>> monthSeries = [
      charts.Series(
        id: "money",
        data: monthData,
        domainFn: (ColumnChartModel monthSeries, _) => monthSeries.time,
        measureFn: (ColumnChartModel monthSeries, _) => monthSeries.money,
        colorFn: (ColumnChartModel monthSeries, _) => monthSeries.color,
      ),
    ];

    List<charts.Series<ColumnChartModel, String>> yearSeries = [
      charts.Series(
        id: "money",
        data: yearData,
        domainFn: (ColumnChartModel yearSeries, _) => yearSeries.time,
        measureFn: (ColumnChartModel yearSeries, _) => yearSeries.money,
        colorFn: (ColumnChartModel yearSeries, _) => yearSeries.color,
      ),
    ];

    // TODO: implement build
    return DefaultTabController(
      length: 5, // length of tabs
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
        Container(
          child: TabBar(
            labelColor: Color.fromARGB(255, 35, 111, 87),
            labelStyle: TextStyle(fontSize: 15.sp, fontFamily: 'Inter', fontWeight: FontWeight.bold),
            unselectedLabelColor: Colors.black,
            indicatorWeight: 2.2.sp,
            indicatorColor: Color.fromARGB(255, 35, 111, 87),
            padding: EdgeInsets.only(top: 15.h, left: 0.w, right: 10.w),
            indicatorPadding: EdgeInsets.only(left: 25.0.w, bottom: 5.0.h, right: 1.w),
            labelPadding: EdgeInsets.only(top: 1.h, left: 23.w),
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
          decoration: BoxDecoration(
          ),
          child: TabBarView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 15.w, top: 10.h, bottom: 100.h),
                  child: charts.BarChart(
                    daySeries,
                    animate: true,
                    defaultRenderer: new charts.BarRendererConfig(
                      cornerStrategy: const charts.ConstCornerStrategy(5),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.w, top: 10.h, bottom: 100.h),
                  child: charts.BarChart(
                    monthSeries,
                    animate: true,
                    defaultRenderer: new charts.BarRendererConfig(
                      cornerStrategy: const charts.ConstCornerStrategy(5),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.w, top: 10.h, bottom: 100.h),
                  child: charts.BarChart(
                    monthSeries,
                    animate: true,
                    defaultRenderer: new charts.BarRendererConfig(
                      cornerStrategy: const charts.ConstCornerStrategy(5),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.w, top: 10.h, bottom: 100.h),
                  child: charts.BarChart(
                    yearSeries,
                    animate: true,
                    defaultRenderer: charts.BarRendererConfig(
                      cornerStrategy: const charts.ConstCornerStrategy(5),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.w, top: 10.h, bottom: 100.h),
                  child: charts.BarChart(
                    monthSeries,
                    animate: true,
                    defaultRenderer: charts.BarRendererConfig(
                      cornerStrategy: const charts.ConstCornerStrategy(5),
                    ),
                  ),
                ),
              ]
          ),
        ),
      ]),
    );
  }
}