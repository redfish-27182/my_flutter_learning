import 'package:flutter/material.dart';

// 程式的起點，執行並啟動 MyApp 這個元件
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      // Scaffold 是手機頁面的主鷹架
      home: Scaffold(
        // Center 讓裡面的東西在螢幕正中間居中
        body: Center(
          // Container 就像一個萬能的畫布格子
          child: Container(
            // 1. 設定這個格子內部元件（Text）的對齊方式為「左上角」
            alignment: Alignment.topLeft, 
            
            // 2. 固定格子的寬度與高度
            width: 500.0,
            height: 400.0,
            
            // 3. 內邊距 (Padding)：文字與格子邊框「內部」的距離
            //    fromLTRB 分別代表：左邊留20、上面留20、右邊留0、下面留0
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0), 
            
            // 4. 外邊距 (Margin)：這個格子與「外面其他元件（或螢幕邊緣）」的距離
            //    all(10.0) 代表上下左右全部空出 10 的美觀距離
            margin: const EdgeInsets.all(10.0),
            
            // 5. 裝飾 (Decoration)：用來設計這個盒子的背景、圓角與邊框
            decoration: BoxDecoration( // 💡 順便幫你拿掉了舊語法的 new
              // 漸層色背景：從左上角到右下角，由淺藍色漸變到亮綠色
              gradient: const LinearGradient(
                colors: [Colors.lightBlue, Colors.greenAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              // 設定盒子的黑框，寬度為 5.0
              border: Border.all(
                color: Colors.black,
                width: 5.0,
              ),
            ), 
            
            // 格子裡面裝的實際內容（子元件）
            child: const Text(
              'Hello World',
              style: TextStyle(
                fontSize: 50.0, // 超大的 50 級字體
                color: Colors.pink, // 粉紅色的文字
              ),
            ),
          ), 
        ),
      ),
    );
  }
}