import 'package:flutter/material.dart';

class NavigateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    return new MaterialApp(
      title: 'navigation Basics',
      home: new FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('First Screen'),
    
      ),
      body: new Center(
        child:  new RaisedButton(
          child:  new Text('Launch new screen'),
          onPressed: (){
            //跳转
            Navigator.push( 
            context, 
            new MaterialPageRoute(builder: (context) => new SecondScreen()),
            );
          }
        ),
      )
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Second screen'),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child:  new Text('Go back!'),
        ),
      ),
    );
  }
}