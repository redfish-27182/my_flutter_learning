import 'package:flutter/material.dart';

// 🚀 自訂客製化轉場動畫路由（漸層淡入 + 速度曲線效果）
class CustomRoute extends PageRouteBuilder {
  final Widget widget;

  // 💡 構造函數：當別的頁面呼叫我時，要把「目的地新頁面 (widget)」傳進來
  // super這是官方規定的寫法，專為PageRouteBuilder設計
  CustomRoute(this.widget) : super(
    // ⏳ 轉場動畫的總持續時間（這裡設定 1 秒鐘，由 0.0 跑到 1.0）
    transitionDuration: const Duration(seconds: 2),
    
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
      // 🎬 由內而外拆解這顆超酷的動畫果凍：
      return FadeTransition(
        // 🌟 最終效果：控制目的地頁面的「透明度」
        opacity: Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            // 🚂 1. 綁定主要計時器：把基礎的 0.0 ~ 1.0 線性動畫當作火車頭
            parent: animation1, 
            
            // 📈 2. 注入靈魂曲線：Curves.fastOutSlowIn 會讓動畫「一開始衝很快、最後慢慢停下」
            // 這樣在畫面上看起來就不會死板板的，會有一種優雅的高級感！
            curve: Curves.fastOutSlowIn, 
          ),
        ),
        // 💡 記得告訴 FadeTransition，要把剛才算好的「淡入+曲線特效」套用在目的地頁面（child）身上！
        child: child, 
      );
    },
  );
}