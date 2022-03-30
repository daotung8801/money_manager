import 'package:flutter/material.dart';

class CreateReminder extends StatelessWidget {
  CreateReminder({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tạo lời nhắc',
          style: TextStyle(fontFamily: 'Inter', fontSize: 25),
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 72,
        elevation: 0.0,
        leading: IconButton(
          padding: EdgeInsets.only(left: 32),
          iconSize: 30,
          alignment: Alignment.center,
          icon: Icon(Icons.menu),
          onPressed: () => {},
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(1000, 35, 111, 87),
                Color.fromARGB(1000, 35, 111, 87)
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 60),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tên',
                labelText: 'Tên lời nhắc',
                labelStyle: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Inter',
                  color: Colors.black,
                ),
                hintStyle: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Inter',
                    color: Color.fromARGB(1000, 189, 189, 189),
                ),
                border: OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(1000, 189, 189, 189), width: 1.0),
                ),
                fillColor: Color.fromARGB(1000, 232, 232, 232),
                filled: true,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tần suất',
                labelText: 'Tần suất',
                labelStyle: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Inter',
                  color: Colors.black,
                ),
                hintStyle: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Inter',
                  color: Color.fromARGB(1000, 189, 189, 189),
                ),
                border: OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(1000, 189, 189, 189), width: 1.0),
                ),
                fillColor: Color.fromARGB(1000, 232, 232, 232),
                filled: true,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Ngày',
                labelText: 'Ngày',
                labelStyle: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Inter',
                  color: Colors.black,
                ),
                hintStyle: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Inter',
                  color: Color.fromARGB(1000, 189, 189, 189),
                ),
                border: OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(1000, 189, 189, 189), width: 1.0),
                ),
                fillColor: Color.fromARGB(1000, 232, 232, 232),
                filled: true,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Giờ',
                labelText: 'Giờ',
                labelStyle: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Inter',
                  color: Colors.black,
                ),
                hintStyle: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Inter',
                  color: Color.fromARGB(1000, 189, 189, 189),
                ),
                border: OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(1000, 189, 189, 189), width: 1.0),
                ),
                fillColor: Color.fromARGB(1000, 232, 232, 232),
                filled: true,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Ghi chú',
                labelText: 'Ghi chú',
                labelStyle: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Inter',
                  color: Colors.black,
                ),
                hintStyle: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Inter',
                  color: Color.fromARGB(1000, 189, 189, 189),
                ),
                border: OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(1000, 189, 189, 189), width: 1.0),
                ),
                fillColor: Color.fromARGB(1000, 232, 232, 232),
                filled: true,
              ),
              maxLines: 3,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: SizedBox (
              width: 93,
              height: 51,
              child:RaisedButton(
                onPressed: () {
                  print('Raise button');
                },
                child: Text(
                  'Tạo',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18, color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                color: Color.fromARGB(1000, 35, 111, 87),
              ),
            ),
          ),
        ],
      ),
    );
  }
}