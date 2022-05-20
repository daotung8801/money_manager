import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_manager/screens/AddTransactionScreen1.dart';
import '../components/CustomPageRoute.dart';
import '../components/ExpenseTabBar.dart';
import '../components/PopUpNotification1.dart';
import '../components/SearchItem.dart';
import '../components/TitleText1.dart';
import 'AddTransactionScreen1.dart';

class ExchangeMoney extends StatelessWidget {
  ExchangeMoney({Key? key, required this.typeIndex, required this.timeIndex})
      : super(key: key);
  final int typeIndex;
  final int timeIndex;

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return PopUpNotification1();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: this.typeIndex,
        child: Builder(builder: (BuildContext context) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              centerTitle: true,
              title: Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: TitleText1(
                    text: 'Giao dịch',
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
                tooltip: 'Menu',
                onPressed: () => Navigator.pop(context),
              ),
              actions: <Widget>[
                IconButton(
                  padding: EdgeInsets.only(right: 5.w, top: 10.h),
                  iconSize: 30,
                  icon: Icon(Icons.search),
                  tooltip: 'Tìm kiếm',
                  onPressed: () => {
                    showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(),
                    )
                  },
                ),
                IconButton(
                  padding: EdgeInsets.only(right: 20.w, top: 10.h),
                  iconSize: 30.sp,
                  icon: Icon(Icons.download),
                  tooltip: 'Tải xuống',
                  onPressed: () => {
                    _showDialog(context),
                  },
                ),
              ],
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
                indicatorWeight: 3,
                indicatorPadding:
                    EdgeInsets.only(left: 50.0.w, right: 50.0.w, bottom: 2.0.h),
                padding: EdgeInsets.only(bottom: 20.0),
                tabs: [
                  Tab(
                    child: Text(
                      'Chi phí',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .apply(color: Colors.white),
                    ),
                  ),
                  Tab(
                      child: Text(
                    'Thu nhập',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .apply(color: Colors.white),
                  )),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                backgroundColor: Color.fromARGB(255, 35, 111, 87),
                onPressed: () {
                  Navigator.of(context).push(CustomPageRoute(
                      direction: AxisDirection.up,
                      child: AddTransactionScreen1(
                        index: DefaultTabController.of(context)!.index,
                      )));
                }),
            body: TabBarView(
              children: [
                Center(
                  child: ExpenseTabBar(
                    isExpense: true,
                    tab: TAB.values.elementAt(this.timeIndex),
                  ),
                ),
                Center(
                  child: ExpenseTabBar(
                    isExpense: false,
                    tab: TAB.values.elementAt(this.timeIndex),
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
