import 'package:flutter/material.dart';

 class MyStatefulWidgetApp extends StatefulWidget {
     MyStatefulWidgetApp({Key key}) : super (key:key);
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidgetApp> {
  int _selectedIndex = 0;
  static const List<Widget> _widgets = <Widget> [
    Text('Index 0 :首页'),
    Text('Index 1 :通讯录'),
    Text('Index 2 :我的'),
   ];
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('BottomNavifationBar示例'),
      ),

    body: Center(
      child: _widgets.elementAt(_selectedIndex),
    ),  
    bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('首页') ,
        ),
         BottomNavigationBarItem(
        icon: Icon(Icons.contacts),
        title: Text('通讯录') ,
        ),
         BottomNavigationBarItem(
        icon: Icon(Icons.build),
        title: Text('设置') ,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber,
      onTap: _onItemTapped,
    ),    
    );
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

}