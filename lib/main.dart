import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var card = Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text('陳鼎云', style: TextStyle(fontSize: 20.0)),
            subtitle: Text('國立臺灣大學'),
            leading: Icon(Icons.account_box, color: Colors.lightBlue),
          ),

          ListTile(
            title: Text('陳姮予', style: TextStyle(fontSize: 20.0)),
            subtitle: Text('國立陽明交通大學'),
            leading: Icon(Icons.account_box, color: Colors.lightBlue),
          ),

          ListTile(
            title: Text('陳俊成', style: TextStyle(fontSize: 20.0)),
            subtitle: Text('國立清華大學'),
            leading: Icon(Icons.account_box, color: Colors.lightBlue),
          ),
      ],

    );

    return MaterialApp(
      title: 'Stack 布局測試',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('垂直方向布局'), 
        ),
        body: Center(
          child: card,
        ),
      ),
    );
  }
}