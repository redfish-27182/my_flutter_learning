import 'package:flutter/material.dart';

class BottomAppBarDemo extends StatefulWidget{
  _BottomAppBarDemoState createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        //提示意思，長按才顯示
        tooltip: '陳鼎云',
        child: Icon(
          Icons.add,
          color:Colors.lightBlue,
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton( 
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: (){
                
              },
            ),
            IconButton( 
              icon: Icon(Icons.pages),
              color: Colors.white,
              onPressed: (){

              },        
            )
          ]
        )
      )
    );
  }
}