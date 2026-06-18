import 'package:flutter/material.dart';

// 程式的起點，執行並啟動 MyApp 這個元件
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: Center(
          child: Container(
            child: Image.network(
              // 讓圖片保持原有的寬高比，並且在容器內完整顯示
              //fit: BoxFit.contain,
              // 讓圖片保持原有的寬高比，並且在容器內完全填滿，可能會裁剪圖片
              //fit: BoxFit.fitWidth,
              // 讓圖片保持原有的寬高比，並且在容器內完全填滿，可能會裁剪圖片
              //fit: BoxFit.cover, 
              'https://picsum.photos/300/200',
              color: Colors.greenAccent,
              colorBlendMode: BlendMode.darken,
              repeat: ImageRepeat.repeatX,
            ),
            width: 500.0,
            height: 200.0,
            color: Colors.lightBlue,
          ),
        ),
      ),
    );
  }
}