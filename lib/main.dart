import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GridView 圖片展示', 

      home: Scaffold(
        appBar: AppBar(title: const Text('GridView 圖片展示'),),
        // 💡 修正：外層直接用 ListView，讓整頁可以上下滾動
        body:GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 每行顯示兩個格子
            mainAxisSpacing: 4.0, // 主軸間距
            crossAxisSpacing: 2.0, // 交叉軸間距               
            childAspectRatio: 0.7, // 格子的寬高比
          ),
        children: <Widget>[
          new Image.network('https://picsum.photos/250?image=9', fit: BoxFit.cover), 
          // fit: BoxFit.cover 讓圖片填滿格子
          new Image.network('https://picsum.photos/250?image=10', fit: BoxFit.cover),
          new Image.network('https://picsum.photos/250?image=11', fit: BoxFit.cover),
          new Image.network('https://picsum.photos/250?image=12', fit: BoxFit.cover),
          new Image.network('https://picsum.photos/250?image=13', fit: BoxFit.cover),
          new Image.network('https://picsum.photos/250?image=14', fit: BoxFit.cover),
          new Image.network('https://picsum.photos/250?image=15', fit: BoxFit.cover),

        ],
        )
      ),
    );
  }
}
