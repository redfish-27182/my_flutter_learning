import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '超貼心廚房管家',
      home: firstPage(),
    );
  }
}

// 主頁面
class firstPage extends StatelessWidget {
 @override
    Widget build(BuildContext context) {
      Widget buildMyButton(String text, Widget targetPage) {
        return Container(
          width: 250.0,
          height: 60.0,
          margin: const EdgeInsets.symmetric(vertical: 8.0), // 順便幫按鈕上下留點空隙，不會黏在一起
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(4.0), // 你的俐落小圓角
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            onPressed: () {
              // 💡 萬用高鐵：不管是哪一頁，只要你傳進來，大總管就載使用者過去！
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => targetPage),
              );
            },
            child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 18)),
          ),
        );
      }

      return Scaffold(
        appBar: AppBar(title: const Text('超貼心廚房管家')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 💡 一秒生產四個「名字不同、跳轉頁面不同」但「外觀完全一致」的按鈕！
              buildMyButton('食材入庫', storage()),
              buildMyButton('每日菜單', today_menu()),
              buildMyButton('查看庫存', storage2()),
            ],
          ),
        ),
      );
    }
}

class storage2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('查看庫存')
      ),
      body: Center(
        child: Text('測試而已')
      ),
    );
  }
}

class storage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('食材入庫')
      ),
      body: Center(
        child: Text('測試而已')
      ),
    );
  }
}

class today_menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('今日菜單')
      ),
      body: Center(
        child: Text('測試而已')
      ),
    );
  }
}