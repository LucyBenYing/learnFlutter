import 'package:flutter/material.dart'; 
import 'package:flutter/widgets.dart'; 

import 'package:flutterdemo1/longlist/ListviewBuilder.dart';  
import 'package:flutterdemo1/longlist/DifferentItems.dart';
import 'package:flutterdemo1/longlist/GridListView.dart';
import 'package:flutterdemo1/longlist/SwipToDeleteView.dart';
import 'package:flutterdemo1/longlist/TapActions.dart';
import 'package:flutterdemo1/longlist/NavigateWithParms.dart';
import 'package:flutterdemo1/longlist/NavBackWithParms.dart';

class  TestApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return  new MaterialApp( 
      home: new ListHomePageApp(),
    );
  }
}

class ListHomePageApp extends StatelessWidget {
  final title = 'GridListView List';
  @override
  Widget build(BuildContext context) { 
   return new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: ListHomePage(),    
    );
  }
}

class GuideItem {
  final String showName;
  final Widget gotoWidget;
  GuideItem({this.showName,this.gotoWidget});
}

class ListHomePage extends StatelessWidget { 
  final items = [
    new GuideItem (
      showName: 'Long List',
      gotoWidget: new ListViewApp()
    ),
  new GuideItem (
      showName: 'different items list',
      gotoWidget: new DifferentItemsListApp()
    ),
      new GuideItem (
      showName: 'TapActionViewApp',
      gotoWidget: new TapActionViewApp(),
    ),
      new GuideItem (
      showName: 'GridListView',
      gotoWidget: new GridListViewApp()
    ),
      new GuideItem (
      showName: 'SwipToDeleteView',
      gotoWidget: new SwipToDeleteViewApp()
    ),
    new GuideItem (
      showName: 'NavigateWithParmsApp',
      gotoWidget: new NavigateWithParmsApp()
    ),
     new GuideItem (
      showName: 'NavBackWithParms',
      gotoWidget: new NavBackWithParmsApp()
    ),
    
  ];

  @override
  Widget build(BuildContext context) { 
     return new ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];  
        return new ListTile(
          title: new Text('${item.showName}'),
          onTap: () {
            Navigator.push(context, 
            new MaterialPageRoute(builder: (context) => item.gotoWidget));
          },
        );
      },
     );
  }
}