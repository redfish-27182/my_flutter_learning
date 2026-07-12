import 'package:flutter/material.dart';

// 🚀 自訂客製化轉場動畫路由（漸層淡入 + 速度曲線效果）
class CustomRoute extends PageRouteBuilder {
  final Widget widget;

  // 💡 構造函數：當別的頁面呼叫我時，要把「目的地新頁面 (widget)」傳進來
  // super這是官方規定的寫法，專為PageRouteBuilder設計
  CustomRoute(this.widget) : super(
    // ⏳ 轉場動畫的總持續時間（這裡設定 1 秒鐘，由 0.0 跑到 1.0）
    transitionDuration: const Duration(seconds: 1),
    
    // 🧱 1. 負責建立目的地頁面
    pageBuilder: (
      BuildContext context,
      Animation<double> animation1,      // 主要進場動畫數值 (從 0.0 跑到 1.0)
      Animation<double> animation2,      // 次要出場動畫數值
    ) {
      return widget; // 告訴 Flutter 我們最後要顯示的是傳進來的目的地頁面
    },
    
    // 🎨 2. 負責「畫出轉場特效」（重頭戲在這裡！）
    transitionsBuilder: (
      BuildContext context,
      Animation<double> animation1,      // 這裡的 animation1 會跟上面同步，維持在 0.0 ~ 1.0
      Animation<double> animation2,
      Widget child,                      // 這個 child 就是上面 pageBuilder 回傳的目的地 widget
    ) {
    /*  return ScaleTransition(
        scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)),
        child: child,
      );
    */
    //旋轉加縮放
    /*  return RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)),
        child: ScaleTransition(
          scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)),
        child: child,
        ),
      );*/
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(-1.0 , 0.0),
          end: Offset(0.0, 0.0),
        )
        .animate(
          CurvedAnimation(
            parent: animation1,
            curve: Curves.easeInCirc
          )
        ),
        child: child,
      );
    },
  );
}