import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart'; 

class  TestApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return  new MaterialApp( 
      home: new GridListViewApp(),
    );
  }
}

class GridListViewApp extends StatelessWidget {
  final title = 'GridListView List';
  @override
  Widget build(BuildContext context) { 
   return new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: GridListView(),    
    );
  }
}


class GridListView extends StatelessWidget {
@override
  Widget build(BuildContext context) { 
     return new GridView.count(
       crossAxisCount: 5,
       children: new List.generate(100, (index) {
         return new Center(
           child: new Text(
             'Item $index',
             style: Theme.of(context).textTheme.headline,
           ),
         );
       }),
      ); 
  }
}
