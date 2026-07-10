import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '頁面跳轉返回程序',
      home: firstPage(),
    );
  }
}

// 主頁面
class firstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('找小姐姐要電話'),
        backgroundColor: Colors.pinkAccent, // 💡 配合主題換個粉紅色系
      ),
      body: Center(
        child: RouteButton(), // 💡 呼叫底下的自訂按鈕元件
      ),
    );
  }
}

// ==========================================
// 👆 自訂的跳轉按鈕元件
// ==========================================
class RouteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // 💡 點擊時，執行底下的異步跳轉函數，並把目前的身分證 (context) 傳過去
        _navigateToLittleSister(context);
      },
      //style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
      child: const Text('去找小姐姐'),
    );
  }

  // 💡 關鍵異步函數：async 與 await 是一對的！
  // 因為我們不知道小姐姐會考慮多久，所以要用 `await` 卡住，等她回傳結果
  _navigateToLittleSister(BuildContext context) async {
    
    // 💡 坐高鐵去第二頁，並且「等待（await）」Navigator.pop 回傳的值
    // 當小姐姐那一頁 pop 時，回傳的字串會自動塞進 `result` 變數裡
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LittleSister()),
    );

    // 💡 檢查機制：萬一使用者直接按手機內建的返回鍵，result 可能會是 null
    if (result == null) return;

    // 💡 修正：改用現代標準的 ScaffoldMessenger
    // 在螢幕最下方彈出一個黑底提示泡泡，把小姐姐回傳的結果 ($result) 印出來！
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('小姐姐的回覆：$result'),
        duration: const Duration(seconds: 3), // 提示顯示 3 秒
      ),
    );
  }
}

// ==========================================
// 👩 第二頁：小姐姐本尊畫面 (原本漏掉的積木)
// ==========================================
class LittleSister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('遇到小姐姐了'),
      ),
      body: Center(
        // 用 Column 把文字和兩個按鈕垂直排好
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 按鈕一：願意給電話
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              
              child: const Text('程益懸小姐姐'),
              onPressed: () {
                // 💡 關鍵：pop 的第二個參數，就是你要傳回給第一頁的「神秘禮物（資料）」！
                Navigator.pop(context, '我有男友了');
              },
            ),

            const SizedBox(height: 15),

            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                // 💡 關鍵：pop 的第二個參數，就是你要傳回給第一頁的「神秘禮物（資料）」！
                Navigator.pop(context, '操你媽死矮子滾選一點');
              },
              child: const Text('渠利安小姐姐'),
            ),
            
            const SizedBox(height: 15),
            
            // 按鈕二：拒絕
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                // 💡 拒絕時，傳回另外一個字串
                Navigator.pop(context, '......');
              },
              child: const Text('楊囹圄小姐姐'),
            ),
          ],
        ),
      ),
    );
  }
}
