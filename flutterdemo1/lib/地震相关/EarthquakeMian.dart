import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo1/EarthquakeItemData.dart';
import 'EarthquakeHomePage.dart';
import 'EarthquakeDetailPage.dart';
import 'EarthquakeItemData.dart';

class  EarthquakeMain extends StatelessWidget {
  final bool usesRoutes;
  EarthquakeMain({this.usesRoutes});
  @override
  Widget build(BuildContext context) { 
    if (!usesRoutes) {
      return EarthquakeApp();
    } else {
      return MaterialApp(
      title: '聚合',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String,WidgetBuilder>{
        "/":(BuildContext context) => new EarthquakeApp(),
        "/detail":(BuildContext context) => new EarthquakeDetailPage(
          detailItem: new EarthquakeItemData(
            2,
            7.0,
            1561572645.0, 
            28.46,
            104.73, 
            100, 
            '四川红线'
            ),
          ), 
      }
    );
    }
    
     
  }
}