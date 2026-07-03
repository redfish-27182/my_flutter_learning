import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row Widget Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('垂直方向布局'),
        ),
        body: Center(child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.red,
              height: 100.0,
              width: 500.0,
            ),
            Text('我是陳鼎云'),
            Text('我愛淋雨'),
          ],
        )
      ),
    );
  }
}