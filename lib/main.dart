import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: Center(
          child: Container(
            alignment: Alignment.center, // 💡 設定 Container 內部的對齊方式
            width: 500.0,
            height: 400.0,
            color: Color.fromARGB(255,0, 0, 0), // 💡 設定 Container 的背景顏色
            child: Text( // 💡 順便幫你拿掉了現代寫法不需要的 new
              'Hello World',
              style: TextStyle(fontSize: 25.0, color: Colors.pink),
            ), // 👈 這是 Text 的結束括號
          ), // 👈 這裡原本少了一個結束 Container 的括號！
        ),
      ),
    );
  }
} 

//alignment: Alignment.center, // 💡 設定 Container 內部的對齊方式
//alignment: Alignment.bottomCenter, // 💡 設定 Container 內部的對齊方式
//alignment: Alignment.bottomRight, // 💡 設定 Container 內部的對齊方式