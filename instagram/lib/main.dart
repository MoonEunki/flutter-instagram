// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

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
  var userImage;
  var userContent;

  setUserContent(content) {
    setState(() {
      userContent = content;
    });
  }

  getData() async {
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    var result2 = jsonDecode(result.body);
    print(result2);
    setState(() {
      instaData = result2;
    });
  }

  addData(a) {
    setState(() {
      instaData.add(a);
    });
  }

  addMyData() {
    var myData = {'id': 0, 'image': userImage, 'likes': 5, 'date': 'July 25', 'content': userContent, 'liked': false, 'user': 'MEK'};

    setState(() {
      print(myData);
      instaData.insert(0, myData);
    });
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
          actions: [
            GestureDetector(
              onTap: () async {
                var picker = ImagePicker();
                var image = await picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  setState(() {
                    userImage = File(image.path);
                  });
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Upload(
                            userImage: userImage,
                            setUserContent: setUserContent,
                            addMyData: addMyData,
                          )),
                );
              },
              child: Icon(Icons.add_box_outlined, color: Colors.black, size: 36),
            ),
          ],
        ),
        body: [
          Home(instaData: instaData, addData: addData),
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

class Home extends StatefulWidget {
  const Home({Key? key, this.instaData, this.addData}) : super(key: key);

  final instaData;
  final addData;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var scroll = ScrollController();

  getMore() async {
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/more1.json'));
    var result2 = jsonDecode(result.body);
    widget.addData(result2);
  }

  @override
  void initState() {
    super.initState();
    scroll.addListener(() {
      if (scroll.position.pixels == scroll.position.maxScrollExtent) {
        getMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.instaData != null && widget.instaData.isNotEmpty) {
      return ListView.builder(
        itemCount: widget.instaData.length,
        controller: scroll,
        itemBuilder: (context, i) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.instaData[i]['image'].runtimeType == String ? Image.network(widget.instaData[i]['image']) : Image.file(widget.instaData[i]['image']),
              Text('좋아요: ${widget.instaData[i]['likes']}'),
              Text(widget.instaData[i]['user']),
              Text(widget.instaData[i]['content']),
            ],
          );
        },
      );
    } else {
      return Text('로딩중입니다');
    }
  }
}

class Upload extends StatelessWidget {
  const Upload({Key? key, this.userImage, this.setUserContent, this.addMyData}) : super(key: key);

  final userImage;
  final setUserContent;
  final addMyData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('업로드', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            GestureDetector(
              onTap: () {
                addMyData();
                Navigator.pop(context);
              },
              child: Icon(Icons.check, color: Colors.black, size: 36),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.file(userImage),
            TextField(
              onChanged: (text) {
                setUserContent(text);
              },
              decoration: InputDecoration(
                hintText: '내용을 입력하세요',
              ),
            ),
          ],
        ));
  }
}
