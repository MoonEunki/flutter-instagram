// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MaterialApp(home: MyApp()));

var a = TextStyle(fontSize: 20, color: Colors.black);

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int tab = 0;
  var instaData;

  getData() async {
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    var result2 = jsonDecode(result.body);
    setState(() {
      instaData = result2;
    });
    print(instaData);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Instagram', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          elevation: 1,
          actions: [Icon(Icons.add_box_outlined, color: Colors.black, size: 36)],
        ),
        body: [
          Home(instaData: instaData),
          Text('샵z', style: a),
        ][tab],
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
          onTap: (i) {
            setState(() {
              tab = i;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'shop',
            ),
          ],
        ));
  }
}

class Home extends StatelessWidget {
  const Home({Key? key, this.instaData}) : super(key: key);

  final instaData;

  @override
  Widget build(BuildContext context) {
    if (instaData != null && instaData.isNotEmpty) {
      return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, i) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(instaData[i]['image'].toString()),
              Text(instaData[i]['liked'].toString()),
              Text(instaData[i]['user'].toString()),
              Text(instaData[i]['content'].toString()),
            ],
          );
        },
      );
    } else {
      return Text('로딩중입니다');
    }
  }
}
