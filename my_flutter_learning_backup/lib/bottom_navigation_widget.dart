import 'package:flutter/material.dart';
import 'each_view.dart';

class BottomAppBarDemo extends StatefulWidget {
  @override
  _BottomAppBarDemoState createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo> {
  List<Widget> _eachView = [];
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _eachView = []; 
    _eachView
      ..add(EachView("陳鼎云")) // 💡 陣列編號 0
      ..add(EachView("楊伶予")); // 💡 陣列編號 1
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _eachView[_index],

      // 🟢 1. 懸浮大顆加號按鈕，點擊會彈出新頁面
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return EachView('新頁面');
              }, 
            ),
          );
        },
        tooltip: '陳鼎云',
        child: const Icon(
          Icons.add,
          color: Colors.lightBlue,
        ),
      ),
      
      // 💡 修正一：把不合法的 miniCenterDocked 改回經典標準的 centerDocked
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
      // 🟢 2. 高質感內凹底部導航欄
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: const CircularNotchedRectangle(),
        
        // 💡 額外贈送：強制將內建間距歸零，新版 Flutter 凹槽才切得漂亮、IconButton 才不會歪掉
        padding: EdgeInsets.zero, 
        
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // 🛑 左邊按鈕：Home
            IconButton( 
              icon: const Icon(Icons.home),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _index = 0; // 點擊切換到編號 0 (陳鼎云)
                });
              },
            ),
            // 🛑 右邊按鈕：Pages
            IconButton( 
              icon: const Icon(Icons.pages),
              color: Colors.white,
              onPressed: () {
                // 💡 修正二：修正複製蟲！把 0 改成 1，這樣點擊才能順利切換到「楊伶予」畫面喔！
                setState(() {
                  _index = 1; 
                });
              },     
            ),
          ],
        ),
      ),
    );
  }
}