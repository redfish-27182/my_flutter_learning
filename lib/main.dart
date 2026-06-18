import 'package:flutter/material.dart';

// 程式的起點，執行並啟動 MyApp 這個元件
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar( title: Text('Welcome to Flutter'),),
        body: ListView(
          
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.map),
              title: Text('地圖'),
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('相簿'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('電話'),
            ),
          ],
        ),
      ),
    );
  }
}