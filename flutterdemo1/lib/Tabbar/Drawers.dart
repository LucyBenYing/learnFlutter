import 'package:flutter/material.dart';
// Drawer 抽屉

class MyDrawerViewApp extends StatefulWidget {
  MyDrawerViewApp({Key key}) : super(key:key);
  @override
  _MyDrawerViewAppState createState() => _MyDrawerViewAppState();
}

class _MyDrawerViewAppState extends State<MyDrawerViewApp> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title: Text('Drawer 示例'),
      ),
      drawer: _drawer,
    );
  }

  get _drawer => Drawer(
    child:ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text('Lucy'),
          accountEmail: Text('liu.gmail.com'),
          currentAccountPicture: CircleAvatar(
            child: Text('X'),
          ),
        ),
        ListTile(
          leading: Icon(Icons.local_post_office),
          title: Text('邮件'),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('设置'),
        ),
      ],
    ),
    );

}