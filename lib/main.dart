import 'package:flutter/material.dart';

// ==========================================
// 🧱 第一塊積木：商品的「資料模具」(Model)
// ==========================================
// 告訴電腦，世界上每一件「商品」在記憶體裡都必須長這樣：有標題、有描述。
class Product {
  final String title;       // 商品標題（例如：商品 5）
  final String description; // 商品描述（例如：這是商品 5 的描述）

  // 構造函數：規定要在程式裡建立 Product 物件時，必須明確填入 title 和 description
  Product({required this.title, required this.description});
}

// ==========================================
// 🚀 程式的起跑點 (Main 函數)
// ==========================================
void main() {
  runApp(MaterialApp(
    title: '陳鼎云的商品列表',
    home: Productlist(
      // 💡 輸送帶魔法：叫電腦重複 20 次動作，自動生產出 20 個 Product 商品物件，
      // 並通通打包進一個名為 `products` 的清單（List）裡，然後丟給 Productlist 畫面。
      products: List.generate(
        20,
        (i) => Product(
          title: '商品 $i', 
          description: '這是商品 $i 的描述',
        ),
      ), 
    ),
  ));
}

// ==========================================
// 📱 第二塊積木：商品列表畫面 (第一頁)
// ==========================================
class Productlist extends StatelessWidget {
  // 接收從 main 函數傳過來的那一箱「20個商品清單」
  final List<Product> products; 
  
  Productlist({Key? key, required this.products}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('陳鼎云的商品列表')),
      
      // 💡 蓋房子的工廠 (ListView.builder)：它非常聰明，螢幕多大它就先畫幾個，省記憶體！
      body: ListView.builder(
        itemCount: products.length, // 告訴工廠：總共要蓋 20 個房間 (ListTile)
        itemBuilder: (context, index) {
          // index 是目前蓋到第幾個房間的編號 (從 0 開始到 19)
          return ListTile(
            title: Text(products[index].title),       // 拿出第 index 個商品的標題塞進去
            subtitle: Text(products[index].description), // 拿出第 index 個商品的描述塞進去
            
            // 💡 點擊事件：當使用者用手指點了這條商品時...
            onTap: () {
              // 遞出目前的「身分證 context」，叫大總管 Navigator 幫我們推（Push）到下一頁
              Navigator.push(
                context,
                MaterialPageRoute(
                  // 關鍵精髓：跳轉到詳情頁（ProductDetail）的同時，
                  // 順手把「被點擊的這一個商品資料 (products[index])」整包傳過去！
                  builder: (context) => ProductDetail(product: products[index]),
                ),
              );
            }
          );
        },
      ),
    );
  }    
}

// ==========================================
// 🔍 第三塊積木：商品詳情畫面 (第二頁)
// ==========================================
class ProductDetail extends StatelessWidget {
  // 這裡準備好一個位子，用來接收上一頁傳過來的「單一個商品資料」
  final Product product; 
  
  const ProductDetail({super.key, required this.product});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 💡 點進來後，上方 AppBar 就會自動顯示該商品的標題 (例如：商品 5)
      appBar: AppBar(title: Text(product.title)),
      
      body: Center(
        // 💡 畫面中間用一個大大的、淺綠色的文字，把該商品的詳細描述顯示出來！
        child: Text(
          product.description,
          style: const TextStyle(
            fontSize: 48,
            color: Colors.lightGreen,
          ),
        ),
      ),
    );
  }
}