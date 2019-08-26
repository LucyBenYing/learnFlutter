import 'package:flutter/material.dart'; 
import 'package:flutter/widgets.dart'; 

import 'package:flutterdemo1/longlist/ListviewBuilder.dart';  
import 'package:flutterdemo1/longlist/DifferentItems.dart';
import 'package:flutterdemo1/longlist/GridListView.dart';
import 'package:flutterdemo1/longlist/SwipToDeleteView.dart';
import 'package:flutterdemo1/longlist/TapActions.dart';
import 'package:flutterdemo1/longlist/NavigateWithParms.dart';
import 'package:flutterdemo1/longlist/NavBackWithParms.dart';
import 'package:flutterdemo1/longlist/DataFromNetwork.dart';
import 'package:flutterdemo1/longlist/WebSocketView.dart';
import 'package:flutterdemo1/longlist/FaveriteStateful.dart';
import 'package:flutterdemo1/longlist/UseRouteToPages.dart';
import 'package:flutterdemo1/longlist/RereshAndLoadMore.dart';

import 'package:flutterdemo1/Tabbar/bottomNaviBar.dart'; 
import 'package:flutterdemo1/Tabbar/defalutTabControl.dart'; 
import 'package:flutterdemo1/Tabbar/MyTabContorller.dart'; 
import 'package:flutterdemo1/Tabbar/Drawers.dart'; 

import 'package:flutterdemo1/ShoppingList/ShoppingList.dart';
import 'package:flutterdemo1/aboutEarthquake/MapView.dart'; 

import 'package:flutterdemo1/others/LifeCycle.dart'; 

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
  // 
  final items = [
    // ViewLifeCycle
      new GuideItem (
      showName: 'ViewLifeCycle view ',
      gotoWidget: new ViewLifeCycle()
    ), 
    // MapViewPage
    new GuideItem (
      showName: 'MapViewPage view ',
      gotoWidget: new MapViewPage()
    ), 
    // RereshAndLoadMore
       new GuideItem (
      showName: 'RefreshAndLoadMore view ',
      gotoWidget: new RefreshAndLoadMore()
    ), 
        // ShoppingList
      new GuideItem (
      showName: 'ShoppingListPage view ',
      gotoWidget: new ShoppingListPage()
    ), 

    // Drawers
      new GuideItem (
      showName: 'MyDrawerViewApp view ',
      gotoWidget: new MyDrawerViewApp()
    ), 
    // MyTabControllerWidget
    new GuideItem (
      showName: 'MyTabControllerWidget view ',
      gotoWidget: new MyTabControllerWidget()
    ), 
    new GuideItem (
      showName: 'MyTabcontroller view ',
      gotoWidget: new MyTabcontroller()
    ), 
    new GuideItem (
      showName: 'Tabbar view ',
      gotoWidget: new MyStatefulWidgetApp()
    ), 
    new GuideItem (
      showName: 'UseRouteToPages List',
      gotoWidget: new UseRouteToPages()
    ),
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
     new GuideItem (
      showName: 'DataFromNetwork',
      gotoWidget: new DataFromNetworkApp()
    ),
    // WebSocketView
     new GuideItem (
      showName: 'WebSocketView',
      gotoWidget: new WebsocketView()
    ),
        new GuideItem (
      showName: 'FavoriteApp',
      gotoWidget: new FavoriteApp()
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