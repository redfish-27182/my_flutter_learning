import 'package:flutter/material.dart';

// ==========================================
// 🏠 底部導航欄的主體（外殼積木）
// ==========================================
class BottomNavigationWidget extends StatefulWidget {
  @override
  // 💡 建立一個「狀態大腦（State）」，用來管理這頁所有會動的資料
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

// ==========================================
// 🧠 底部導航欄的狀態大腦（實際負責畫畫面與記錄數據）
// ==========================================
class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  // 💡 自訂一個顏色變數，未來想換主題色時，只要改這裡，所有按鈕一起變色！
  final _BottomNavigationWidgetColor = Colors.blue;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 💡 bottomNavigationBar 是 Scaffold 專門用來放底部導航欄的骨架位子
      bottomNavigationBar: BottomNavigationBar(
        
        // 🔥 關鍵解鎖：當項目 >= 4 個時，必須強制設定為 fixed，否則沒點到的按鈕字體會消失！
        type: BottomNavigationBarType.fixed,
        
        // 🎨 設定被點選時的標籤文字顏色
        selectedItemColor: _BottomNavigationWidgetColor,
        // 🎨 設定未被點選時的標籤文字顏色（通常用灰色比較有層次感）
        unselectedItemColor: Colors.grey,

        // 📥 items 陣列：裡面用來擺放導航欄的各個按鈕項目（必須 >= 2 個項目）
        items: [
          // 🛑 項目 1：首頁
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              // 💡 小提示：因為我們在外層統一設定了 selected/unselected 顏色，
              // 這裡的 color: 屬性其實可以放心地整行刪掉，讓外層大總管自動控制喔！
              color: _BottomNavigationWidgetColor, 
            ),
            label: 'Home', // 新版寫法：直接給純字串，不能寫 Text() 喔！
          ),

          // 🛑 項目 2：電子郵件
          BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
              color: _BottomNavigationWidgetColor,
            ),
            label: 'Email',
          ),

          // 🛑 項目 3：分頁
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pages,
              color: _BottomNavigationWidgetColor,
            ),
            label: 'Pages',
          ),

          // 🛑 項目 4：無線投屏
          BottomNavigationBarItem(
            icon: Icon(
              Icons.airplay,
              color: _BottomNavigationWidgetColor,
            ),
            label: 'Airplay',
          )
        ],
      ),
    );
  }
}