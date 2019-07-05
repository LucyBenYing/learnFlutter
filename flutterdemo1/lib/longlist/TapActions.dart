import 'package:flutter/material.dart'; 
import 'package:flutter/widgets.dart'; 
import 'package:flutter/material.dart' as prefix0;

class  TestApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return  new MaterialApp( 
      home: new TapActionViewApp(),
    );
  }
}

class TapActionViewApp extends StatelessWidget {
  final title = 'TapActionView List';
  @override
  Widget build(BuildContext context) { 
   return new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: TapActionView(),    
    );
  }
}

class TapActionView extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new GestureDetector(
          onTap: (){
            final snackBar = new prefix0.SnackBar(content:  new Text('tap'));
            Scaffold.of(context).showSnackBar(snackBar);
          },
          child: new Container(
            padding: new EdgeInsets.all(20.0),
            height: 80.0,
            decoration: new BoxDecoration(
              color: Theme.of(context).buttonColor,
              borderRadius: new BorderRadius.circular(8.0), 
            ),
            child: new Text('My burttron 点我啊'),
          ),
        ),
        new InkWell(
          onTap: (){
            final snackBar = new prefix0.SnackBar(content:  new Text('inke well'));
            Scaffold.of(context).showSnackBar( snackBar);
          },
          child: new Container(
            padding: new EdgeInsets.all(20.0),
            child: new Text('Flast button'),
          ),
        ), 
      ], 
    );
  }
}
