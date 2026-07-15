import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'超貼心廚房智能管家',
      theme: ThemeData.light(),
      home:  BottomAppBarDemo()
    );
  }
}

class BottomAppBarDemo extends StatefulWidget{
  _BottomAppBarDemoState createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo>{
  int currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 100.0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.blue[100],

        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '超貼心 ',
                style: const TextStyle(
                  fontSize: 36.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: '廚房智能管家',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.grey[700], 
                  textBaseline: TextBaseline.ideographic
                ),
              ),
            ],
          ),
        ),
        //centerTitle: true,
        
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
          },
          //提示意思，長按才顯示
          tooltip: 'Ai語音對話',
          child: Icon(
            Icons.mic,
            opticalSize:50,
            color:Colors.grey[700],
          )
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        notchMargin: 4.0,
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        height: 70.0,

        child: SizedBox(
          height: 70.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,

            children: <Widget>[
              Expanded(
                child: EachIconButton(
                  index: 0,
                  currentIndex: currentIndex,
                  icon: Icons.home,
                  label: '主頁',
                  onPressed: _onItemTapped,
                ),
              ),
              Expanded(
                child: EachIconButton(
                  index: 1,
                  currentIndex: currentIndex,
                  icon: Icons.storage,
                  label: '庫存',
                  onPressed: _onItemTapped,
                ),
              ),
              Expanded(
                child: EachIconButton(
                  index: 2,
                  currentIndex: currentIndex,
                  icon: Icons.menu_book,
                  label: '菜單',
                  onPressed: _onItemTapped,
                ),
              ),
              Expanded(
                child: EachIconButton(
                  index: 3,
                  currentIndex: currentIndex,
                  icon: Icons.settings,
                  label: '設定',
                  onPressed: _onItemTapped,
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}

class EachIconButton extends StatelessWidget{
  const EachIconButton({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final int index;
  final int currentIndex;
  final IconData icon;
  final String label;
  final ValueChanged<int> onPressed;

  @override
  Widget build(BuildContext context){
    final bool isSelected = index == currentIndex;
    Color selectedColor = Colors.blue[700]!;
    Color normalColor = Colors.grey[700]!;

    return TextButton(
      isSemanticButton: false,
      onPressed: () => onPressed(index),
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        foregroundColor: isSelected ? selectedColor : normalColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon, 
            size: isSelected ? 24.0 : 20.0, 
            color: isSelected ? selectedColor : normalColor
          ),
          const SizedBox(height: 4.0),
          Text(
            label,
            style: TextStyle(
              fontSize: isSelected ? 14.0 : 12.0,
              color: isSelected ? selectedColor : normalColor,
            ),
          ),
        ],
      ),
    );
  }
}
