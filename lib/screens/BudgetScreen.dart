import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_manager/main.dart';
import 'package:provider/provider.dart';
import '../components/BudgetTaskBar.dart';
import '../components/CustomPageRoute.dart';
import '../components/NavigationDrawerWidget.dart';
import '../components/TitleText1.dart';
import 'ExchangeMoney.dart';

class BudgetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Builder(
          builder: (context) {
            return ChangeNotifierProvider.value(
              value: ApplicationState.getInstance,
              builder: (context, _) => Consumer<ApplicationState>(
                  builder: (context, appState, _) => Scaffold(
                        resizeToAvoidBottomInset: false,
                        drawer: NavigationDrawerWidget(),
                        // drawer: NavigationDrawerWidget(),
                        appBar: AppBar(
                          automaticallyImplyLeading: false,
                          centerTitle: true,
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Row(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Builder(
                                      builder: (context) => Container(
                                        child: IconButton(
                                          padding: EdgeInsets.only(
                                              left: 10.w, bottom: 10.h),
                                          iconSize: 30.sp,
                                          icon: Icon(Icons.menu),
                                          tooltip: 'Menu',
                                          onPressed: () => {
                                            Scaffold.of(context).openDrawer()
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 80.w, bottom: 10.h),
                                      child: TitleText1(
                                          text: 'Ngân sách',
                                          fontFamily: 'Inter',
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          r: 255,
                                          g: 255,
                                          b: 255),
                                    ),
                                    IconButton(
                                      padding: EdgeInsets.only(
                                          left: 60.w, bottom: 10.h),
                                      iconSize: 35.sp,
                                      icon: Image.asset("assets/ngansach.png"),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(CustomPageRoute(
                                                direction: AxisDirection.left,
                                                child: ExchangeMoney(
                                                  typeIndex:
                                                      DefaultTabController.of(
                                                              context)!
                                                          .index,
                                                  timeIndex: ApplicationState
                                                      .getInstance.timeTab,
                                                )));
                                      },
                                    ),
                                  ]),
                              Padding(
                                padding: EdgeInsets.only(left: 16.w, top: 20.h),
                                child: TitleText1(
                                    text: 'Hôm nay',
                                    fontFamily: 'Inter',
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    r: 198,
                                    g: 198,
                                    b: 198),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 18.w, top: 25.h),
                                child: StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection(
                                          'userData/${appState.user!.uid}/transactions')
                                      .where('date',
                                          isEqualTo: DateTime(
                                              DateTime.now().year,
                                              DateTime.now().month,
                                              DateTime.now().day))
                                      .snapshots(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.hasError) {
                                      return Text('Something went wrong');
                                    }

                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Text("Loading");
                                    }
                                    int balanceChanges = 0;
                                    for (DocumentSnapshot doc
                                        in snapshot.data!.docs) {
                                      if (doc['isExpense'] == true) {
                                        balanceChanges -= doc['value'] as int;
                                      } else {
                                        balanceChanges += doc['value'] as int;
                                      }
                                    }
                                    return TitleText1(
                                        text: (balanceChanges < 1000000
                                            ? '$balanceChanges ₫'
                                            : '${(balanceChanges ~/ 100000) / 10} Tr ₫'),
                                        fontFamily: 'Inter',
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        r: 255,
                                        g: 255,
                                        b: 255);
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 18.w, top: 10.h),
                                child: TitleText1(
                                    text: (appState.remainingAmount != null
                                        ? (appState.remainingAmount! < 1000000
                                            ? 'Số dư khả dụng: ${appState.remainingAmount} ₫'
                                            : 'Số dư khả dụng: ${(appState.remainingAmount! ~/ 100000) / 10} Tr ₫')
                                        : 'SOS'),
                                    fontFamily: 'Inter',
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    r: 255,
                                    g: 255,
                                    b: 255),
                              ),
                            ],
                          ),
                          backgroundColor: Colors.transparent,
                          toolbarHeight: 220.h,
                          elevation: 0.0,
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
                            indicatorPadding: EdgeInsets.only(
                                left: 50.0.w, right: 50.0.w, bottom: 2.0.h),
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
                        body: TabBarView(
                          children: <Widget>[
                            Center(
                              child: BudgetTaskBar(
                                isExpense: true,
                              ),
                            ),
                            Center(
                              child: BudgetTaskBar(isExpense: false),
                            ),
                          ],
                        ),
                      )),
            );
          },
        ));
  }
}
