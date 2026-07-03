import 'package:flutter/material.dart';

class Product {
  final String title; // 商品標題
  final String description; // 商品描述
  Product({required this.title, required this.description});
}

void main() {
  runApp(MaterialApp(
    title: '商品列表',
    home: Productlist(
      products: List.generate(
        20,
        // 💡 修正：加上 title: 和 description: 標籤，完美對齊你的資料結構！
        (i) => Product(
          title: '商品 $i', 
          description: '這是商品 $i 的描述',
        ),
      ), 
    ),
  ));
}

class Productlist extends StatelessWidget {
  final List<Product> products; // 商品列表
  
  // 💡 提示：未來這裡可以用更現代的 const Productlist({super.key, ...}) 寫法，藍色虛線會更少喔！
  Productlist({Key? key, required this.products}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    // 💡 修正：把原本打錯的 return: 改回正確的 return
    return Scaffold(
      appBar: AppBar(title: const Text('商品列表')),
      // 💡 修正：把原本的 ListView 改成 ListView.builder，這樣可以更有效率地生成列表
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].title),
            subtitle: Text(products[index].description),
            
            onTap:(){}
          );
        },
      ),
    );
  }    
}