import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(title: const Text('Welcome to Flutter'),),
        // 💡 修正：外層直接用 ListView，讓整頁可以上下滾動
        body:GridView.count(
          padding: const EdgeInsets.all(20)
          // 這裡的 padding 是指整個 GridView 的內邊距,
          crossAxisCount: 2,
          // 這裡的 crossAxisCount 是指每行顯示幾個元素
          children:  <Widget>[
            const Text('Hello World'),
            const Text('Hello World'),  
            const Text('Hello World'),
            const Text('Hello World'),
            const Text('Hello World'),
          ]
      ),
    );
  }
}

