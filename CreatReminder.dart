import 'package:flutter/material.dart';

class CreateReminder extends StatelessWidget {
  CreateReminder({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Tạo lời nhắc'),
          backgroundColor: Colors.transparent,
          toolbarHeight: 72,
          elevation: 0.0,
          leading: IconButton(
            alignment: Alignment.center,
            icon: Icon(Icons.menu),
            onPressed: () => {},
          ),

          flexibleSpace: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(1000, 35, 111, 87),Color.fromARGB(1000, 35, 111, 87)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  )
              )
          )
      ),
    );
  }
}