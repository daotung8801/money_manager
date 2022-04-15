import 'dart:convert';
import 'package:flutter/material.dart';
import '../components/CategoryGridView.dart';
import '../components/NavigationDrawerWidget.dart';
import '../components/TitleText1.dart';
import '../components/Category.dart';
import 'package:http/http.dart' as http;

List<Category> parseCategories(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<dynamic, dynamic>>();
  return parsed.map<Category>((json) => Category.fromMap(json)).toList();
}

Future<List<Category>> fetchCategories() async {
  final response =
  await http.get(Uri.parse('http://192.168.138.1:8000/Json/categories.json'));
  if (response.statusCode == 200) {
    print(response.statusCode);
    return parseCategories(response.body);
  } else {
    print(response.statusCode);
    throw Exception('Unable to fetch products from the REST API');
  }
}

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(top: 10),
            child: TitleText1(text: 'Danh mục', fontFamily: 'Inter', fontSize: 25, fontWeight: FontWeight.bold, r: 255, g: 255, b: 255),
          ),
          backgroundColor: Colors.transparent,
          toolbarHeight: 100,
          elevation: 0.0,
          leading: Builder(
            builder: (context) => Container(
              child: IconButton(
                padding: EdgeInsets.only(left: 32, top: 10),
                iconSize: 30,
                icon: Icon(Icons.menu),
                tooltip: 'Menu',
                onPressed: () => {Scaffold.of(context).openDrawer()},
              ),
            ),
          ),
            flexibleSpace: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
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
              indicatorPadding: EdgeInsets.only(left: 50.0, right: 50.0, bottom: 2.0),
              padding: EdgeInsets.only(bottom: 20.0),
              tabs: [
                Tab(
                  child: TitleText1(text: 'Chi phí', fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.bold, r: 255, g: 255, b: 255),
                ),
                Tab(
                  child: TitleText1(text: 'Thu nhập', fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.bold, r: 255, g: 255, b: 255),
                ),
              ],
            ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 30),
          child: TabBarView (
            children: [
              CategoryGridView(
                categories: fetchCategories(),
              ),
              CategoryGridView(
                categories: fetchCategories(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}