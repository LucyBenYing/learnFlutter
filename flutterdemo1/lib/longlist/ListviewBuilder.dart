import 'package:flutter/material.dart'; 

class  TestApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return  new MaterialApp( 
      home: new ListViewApp(),
    );
  }
}


class ListViewApp extends StatelessWidget {
  final title = 'Long List';
  @override
  Widget build(BuildContext context) { 
   return new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body:    new ListViews(
        items: new List<String>.generate(10000,(i) => "item $i"),
       ),
    );
  }
}

class ListViews  extends StatelessWidget {
  final List<String> items;
  ListViews({Key key, @required this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return new ListTile(
          title: new Text('${items[index]}'),
        );
      },
    );
  }
}