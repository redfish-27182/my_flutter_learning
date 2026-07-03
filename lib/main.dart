import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var stack = Stack(
      alignment: FractionalOffset(0.5,0.8),
      // 調整子組件在交叉軸方向的對齊方式
      children: <Widget>[
        // 背景图片
        CircleAvatar(
          backgroundImage: NetworkImage(
              'https://img1.baidu.com/it/u=1871559050,1680910223&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500'),
          radius: 100,
        ),
        Positioned(
          top: 10,
          left: 60,
          child: Text(
            '我是陳鼎云',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Text(
            '囹圄超可愛',
            style: TextStyle(color: Colors.black),
          ),
        )
      ],
    );

    return MaterialApp(
      title: 'Stack 布局測試',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('垂直方向布局'),
        ),
        body: Center(
          child: stack,
        ),
      ),
    );
  }
}