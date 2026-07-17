import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 5.0), // 上方留白

          EachContainer(
            color: Colors.grey[200]!, 
            height: 40.0, 
            child: Align(
              alignment: Alignment.centerLeft, // 👈 強制文字靠左置中
              child: Padding(
              padding: EdgeInsets.only(left: 4.0), // 👈 給左邊一點點留白，字才不會貼死在邊框上
              child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  label: const Text('查看庫存'), 
                )
              ),
            ),
          ),
          EachContainer(
            color: Colors.orange[100]!, 
            height: 150.0, 
            child: Center(
              child: Ad_image(),
            ),
          )
        ],
        )
    );
  }
}

class Ad_image extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter, // 💡 讓所有未定位的子元件預設在上方置中
      children: [
        // 【底層圖層】：你的本地圖片
        Image.asset(
          'assets/images/ad_image_3.png', // 你的本地圖片路徑
          width: double.infinity,             // 讓圖片撐滿寬度
          height: double.infinity,
          fit: BoxFit.cover,                  // 讓圖片完美裁切填滿格子，不變形
        ),

        Positioned(
          top: 36.0,   // 👈 距離圖片頂端 16 像素
          left: 200.0,  // 👈 距離圖片左端 16 像素（想置中也可以不寫 Positioned，靠 Stack 預設對齊）
          child: Text(
            '新鮮蔬菜\n 外送到家',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white, // 淺色字在圖片上比較顯眼
              // 💡 質感小撇步：加一點文字陰影（Shadows），就算底圖是一片白，字也不會看不見！
              shadows: [
                Shadow(
                  offset: const Offset(1.0, 1.0),
                  blurRadius: 3.0,
                  color: Colors.black.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class EachContainer extends StatelessWidget {
  final Color color;
  final double height;
  final Widget? child;

  EachContainer({required this.child, required this.color, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.only(top: 6.0, bottom: 0.0), 
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      height: height,
      clipBehavior: Clip.antiAlias,

      decoration: BoxDecoration(
        color: color, // 背景顏色
        borderRadius: BorderRadius.circular(6.0), 
      ),

      child: Center(
        child: child,
      ),
    );
  }
}