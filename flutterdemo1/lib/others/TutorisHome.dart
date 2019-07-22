import 'package:flutter/material.dart';

class TutorialHomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      title: 'Flutter Tutorial',
      home: new TutorialHome(),
    );
  }
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:  new AppBar(
        leading:  new IconButton(
          icon:  new Icon(Icons.menu),
          tooltip: 'Navigation meun',
          onPressed: null,
        ),
        title: new Text(
          'Tutorial Home title',
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          new IconButton(
            icon:  new Icon(Icons.search),
            tooltip: 'search',
            onPressed: null,
          ),
          new MyButton(),
        ],
      ),
      body: new Center(
        child: new Text('Hello Tutorial Home!'),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add',
        child: new Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}


class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        print('MyButton was Tapped');
      },
      child: new Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration:  new BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: new Center(
          child:  new Text('Engage'),
        ),
      ),
    );
  }
}