import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_manager/components/CustomPageRoute.dart';
import 'package:money_manager/components/TitleText1.dart';
import 'package:money_manager/main.dart';
import 'package:money_manager/screens/Authentication.dart';
import 'package:money_manager/screens/User.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import '../screens/HomeScreen.dart';
import 'PopUpRatingApp.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 16.w);

  void _showRatingDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true, // set to false if you want to force a rating
        builder: (context) {
          return PopUpRatingApp();
        });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ApplicationState.getInstance,
      builder: (context, _) =>
          Consumer<ApplicationState>(builder: (context, appState, _) {
        return Drawer(
          child: Material(
            color: const Color.fromRGBO(35, 111, 87, 1),
            child: ListView(
              children: <Widget>[
                buildHeader(
                    urlImage: (appState.user != null
                        ? (appState.user!.photoURL != null
                            ? appState.user!.photoURL!
                            : 'https://play-lh.googleusercontent.com/d4Fk-bMcrn5Skoj35rHfBECn9MIdU6FagaI6upLBMltIqW5YkHVWSXCiTO5IlRLtoQ=s180-rw')
                        : 'https://play-lh.googleusercontent.com/d4Fk-bMcrn5Skoj35rHfBECn9MIdU6FagaI6upLBMltIqW5YkHVWSXCiTO5IlRLtoQ=s180-rw'),
                    name: (appState.user != null
                        ? (appState.user!.displayName != null
                            ? appState.user!.displayName!
                            : '')
                        : 'SOS'),
                    balance: (appState.user != null
                        ? 'Số dư: ${appState.remainingAmount} đ'
                        : 'SOS'),
                    onClicked: () => Navigator.of(context).push(CustomPageRoute(
                        direction: AxisDirection.right, child: UserPage(
                            name: (appState.user != null
                                ? (appState.user!.displayName != null
                                    ? appState.user!.displayName!
                                    : '')
                                : 'SOS'),
                            urlImage: (appState.user != null
                                ? (appState.user!.photoURL != null
                                    ? appState.user!.photoURL!
                                    : 'https://play-lh.googleusercontent.com/d4Fk-bMcrn5Skoj35rHfBECn9MIdU6FagaI6upLBMltIqW5YkHVWSXCiTO5IlRLtoQ=s180-rw')
                                : 'https://play-lh.googleusercontent.com/d4Fk-bMcrn5Skoj35rHfBECn9MIdU6FagaI6upLBMltIqW5YkHVWSXCiTO5IlRLtoQ=s180-rw'))))),
                const Divider(
                  color: Colors.white70,
                ),
                buildMenuItem(
                  text: 'Ngân sách',
                  icon: Icons.account_balance_wallet,
                  onClicked: () =>
                      selectedItem(context, appState, Screen.budget),
                ),
                buildMenuItem(
                  text: 'Tài khoản',
                  icon: Icons.account_balance,
                  onClicked: () =>
                      selectedItem(context, appState, Screen.account),
                ),
                buildMenuItem(
                  text: 'Biểu đồ',
                  icon: Icons.bar_chart,
                  onClicked: () =>
                      selectedItem(context, appState, Screen.chart),
                ),
                buildMenuItem(
                  text: 'Danh mục',
                  icon: Icons.view_list,
                  onClicked: () =>
                      selectedItem(context, appState, Screen.category),
                ),
                buildMenuItem(
                  text: 'Thanh toán thông thường',
                  icon: Icons.paid,
                  onClicked: () =>
                      selectedItem(context, appState, Screen.payment),
                ),
                buildMenuItem(
                  text: 'Nhắc nhở',
                  icon: Icons.notifications,
                  onClicked: () =>
                      selectedItem(context, appState, Screen.reminder),
                ),
                buildMenuItem(
                  text: 'Tiền tệ',
                  icon: Icons.euro,
                  onClicked: () =>
                      selectedItem(context, appState, Screen.currency),
                ),
                buildMenuItem(
                  text: 'Cài đặt',
                  icon: Icons.settings,
                  onClicked: () =>
                      selectedItem(context, appState, Screen.setting),
                ),
                buildMenuItem(
                  text: 'Tắt quảng cáo',
                  icon: Icons.app_blocking,
                  onClicked: () => selectedItem(context, appState, Screen.ads),
                ),
                buildMenuItem(
                  text: 'Chia sẻ với bạn bè',
                  icon: Icons.share,
                  onClicked: () =>
                      selectedItem(context, appState, Screen.share),
                ),
                buildMenuItem(
                  text: 'Đánh giá ứng dụng',
                  icon: Icons.star,
                  onClicked: () =>
                      selectedItem(context, appState, Screen.rating),
                ),
                buildMenuItem(
                  text: 'Liên hệ với nhóm hỗ trợ',
                  icon: Icons.contact_mail,
                  onClicked: () =>
                      selectedItem(context, appState, Screen.contact),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget buildHeader(
          {required String urlImage,
          required String name,
          required String balance,
          required VoidCallback onClicked}) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(const EdgeInsets.symmetric(vertical: 16)),
          child: Row(children: [
            CircleAvatar(
              radius: 30.r,
              backgroundImage: NetworkImage(urlImage),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText1(
                    text: name,
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    r: 255,
                    g: 255,
                    b: 255),
                const SizedBox(
                  height: 4,
                ),
                TitleText1(
                    text: balance,
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    r: 255,
                    g: 255,
                    b: 255),
              ],
            ),
          ]),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(text,
          style: TextStyle(
              color: color,
              fontFamily: 'Inter',
              fontWeight: FontWeight.normal,
              fontSize: 16.sp)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(
      BuildContext context, ApplicationState applicationState, Screen screen) {
    Navigator.pop(context);
    switch (screen) {
      case Screen.budget:
      case Screen.account:
      case Screen.chart:
      case Screen.category:
      case Screen.payment:
      case Screen.reminder:
      case Screen.currency:
      case Screen.setting:
      case Screen.ads:
      case Screen.contact:
        applicationState.mainScreen = screen;
        break;
      case Screen.share:
        Share.share(
            'https://play.google.com/store/apps/details?id=ru.innim.my_finance');
        break;
      case Screen.rating:
        _showRatingDialog(context);
        break;
    }
  }
}
