import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
          backgroundColor: Colors.amber,
        ),
        // 💡 修正：外層直接用 ListView，讓整頁可以上下滾動
        body: ListView(
          children: [
            // 你可以放點文字標題
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('熱門推薦（左右滑動）', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),

            // 💡 關鍵救星：用 SizedBox 把橫向清單包起來，並限制高度為 200
            SizedBox(
              height: 200.0, 
              child: MyList(), // 這時候放入 MyList 就絕對不會噴錯了！
            ),

            // 下方還可以繼續放其他的垂直內容
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('其他內容區塊...', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

class MyList extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal, // 橫向滾動
      children: <Widget>[
        Container(
          width: 200.0,
          color: Colors.lightBlue,
          child: const Center(child: Text('卡片 A', style: TextStyle(color: Colors.white))),
        ),
        Container(
          width: 200.0,
          color: Colors.amber,
          child: const Center(child: Text('卡片 B')),
        ),
        Container(
          width: 200.0,
          color: Colors.pinkAccent,
          child: const Center(child: Text('卡片 C', style: TextStyle(color: Colors.white))),
        ),
      ],
    ); 
  }
}