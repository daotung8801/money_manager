import 'package:flutter/material.dart';
import '../screens/Reminder.dart';
import 'TitleText1.dart';

class SmallHeader extends StatelessWidget with PreferredSizeWidget {
  SmallHeader({Key? key, required this.title, required this.icon})
      : super(key: key);
  String title;
  Icon icon;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Padding(
        padding: EdgeInsets.only(top: 10),
        child: TitleText1(
            text: this.title,
            fontFamily: 'Inter',
            fontSize: 25,
            fontWeight: FontWeight.bold,
            r: 255,
            g: 255,
            b: 255),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 35, 111, 87),
              Color.fromARGB(255, 35, 111, 87)
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),
      leading: Builder(
        builder: (context) => Container(
          child: IconButton(
            padding: EdgeInsets.only(left: 32, top: 10),
            iconSize: 30,
            alignment: Alignment.center,
            icon: this.icon,
            onPressed: () => {
              // Trường hợp là icon back
              if (this.icon.toString() == 'Icon(IconData(U+0E793))') {
                  Navigator.pop(context),
              }
              // Trường hợp là icon menu
              else if (this.icon.toString() == 'Icon(IconData(U+0E3DC))') {
                Scaffold.of(context).openDrawer(),
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(72);
}
