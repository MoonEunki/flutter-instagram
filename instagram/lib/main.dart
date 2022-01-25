// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));

var a = TextStyle(fontSize: 20, color: Colors.black);

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int tab = 0;

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
          ListView(
            children: [
              Container(child: insta_item()),
              Container(child: insta_item()),
              Container(child: insta_item()),
            ],
          ),
          Text('샵', style: a),
        ][tab],
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          // fixedColor: Colors.black,
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

class insta_item extends StatelessWidget {
  const insta_item({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(image: AssetImage('assets/images/bus.png')),
        Text('좋아요'),
        Text('글쓴이'),
        Text('글내용'),
      ],
    );
  }
}

      // BottomAppBar(
      //   child: Container(
      //     height: 50,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         Icon(Icons.home_outlined),
      //         Icon(Icons.shopping_bag_outlined),
      //       ],
      //     ),
      //   ),
      // ),