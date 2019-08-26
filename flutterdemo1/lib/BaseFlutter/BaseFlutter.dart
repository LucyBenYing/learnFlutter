import 'package:flutter/material.dart';
import 'package:flutterdemo1/longlist/ListsHomePage.dart';
import 'package:flutterdemo1/BaseFlutter/TextImageButton.dart';
// import 'package:flutterdemo1/aboutEarthquake/EarthquakeMian.dart';
// import 'package:flutterdemo1/ShoppingList/ShoppingList.dart';
import 'package:flutterdemo1/others/Shopping.dart';
// 
class  BaseFlutterApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return  new MaterialApp( 
      home: new BottomNavigationWidget(),
    );
  }
}

class BottomNavigationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() { 
    return _BottomNavigationWidgetState();
  }
}

class  _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _currentIndex = 0; 
  List<Widget> pages = List<Widget>();

  @override
  void initState(){
    super.initState();
    pages
      ..add(TestApp())
      ..add(SimpleTextWidget())
      ..add(ShoppingListHome());
  }


  BottomNavigationBar _bottomBar (BuildContext context) {
    return  new BottomNavigationBar(
      currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon:  new  Icon(
                Icons.home, 
              ),
            title: new Text('首页'),
            
            ),
              BottomNavigationBarItem(
              icon:   new Icon(Icons.menu),
            title: new Text('菜单'),
            ),
              BottomNavigationBarItem(
              icon:  new Icon(Icons.mail),
            title: new Text('我的'),
            ),
          ],
          onTap: ( int index){
          print('self.$index');
          _tapAction(index, context);
          }
    );
  }
  void _tapAction(int index , BuildContext context) {
      setState(() {
        _currentIndex = index;
      });
  }
    
  @override
  Widget build(BuildContext context) {
    return  new Scaffold( 
      body: pages[_currentIndex],
      bottomNavigationBar: _bottomBar(context),
    );
  }

}