import 'package:flutter/material.dart';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: const Center(
          child: Text(
            '我愛你媽媽，我想當你爸爸，哈哈哈哈哈哈哈哈哈哈哈，我愛你媽媽，我想當你爸爸，哈哈哈哈哈哈哈哈哈哈哈，我愛你媽媽，我想當你爸爸，哈哈哈哈哈哈哈哈哈哈哈，我愛你媽媽，我想當你爸爸，哈哈哈哈哈哈哈哈哈哈哈 ',
            textAlign: TextAlign.left,
            overflow: TextOverflow.fade,
            style: TextStyle(
              fontSize: 25.0,
              color: Color.fromARGB(255, 255, 125, 125),
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid,
            ),
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}

//style: TextStyle(fontSize: 25.0, color: Colors.pink), 設定文字樣式，這裡設定字體大小為25.0，顏色為粉紅色


//maxLines: 1, 設定最大行數為1行，超出部分會根據overflow的設定來處理
//overflow: TextOverflow.fade, 超出部分淡出，顯示為...，如果不設定overflow，則會顯示所有行數
//overflow: TextOverflow.ellipsis, 超出部分顯示為...，如果不設定overflow，則會顯示所有行數
//textAlign: TextAlign.center, 中間對其， TextAlign.left, 靠左對其， TextAlign.right, 靠右對其， TextAlign.justify, 兩端對齊