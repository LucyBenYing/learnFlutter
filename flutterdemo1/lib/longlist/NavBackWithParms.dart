import 'package:flutter/material.dart'; 
import 'package:flutter/widgets.dart'; 

class  TestApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return  new MaterialApp( 
      home: new NavBackWithParmsApp(),
    );
  }
}

class NavBackWithParmsApp extends StatelessWidget {
  final title = 'NavBackWithParmsApp';
  @override
  Widget build(BuildContext context) { 
   return new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: NavBackWithParmsScreen1(),    
    );
  }
}

class NavBackWithParmsScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    return new Center(
      child: new SelectionButton2(),
    );
  }
}

 _navigateAndDisplaySelections(BuildContext context) async {
   //拿到返回结果
    final result = await Navigator.push(
      context, 
      new MaterialPageRoute(
        builder:  (context) => 
          new NavBackWithParmsApp2()
      )
    );
    // 展示给用户
    Scaffold
      .of(context)
      .showSnackBar(new SnackBar(content: new Text("$result")));

  }

class SelectionButton2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: (){
        _navigateAndDisplaySelections(context);
      },
      child:  new Text('Pick an option, any option!'),
    );
  }
}

class NavBackWithParmsApp2 extends StatelessWidget {
  final title = 'selecton back to last page';
  @override
  Widget build(BuildContext context) { 
   return new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: NavBackWithParmsScreen2(),    
    );
  }
}
class NavBackWithParmsScreen2 extends StatelessWidget {
@override
  Widget build(BuildContext context) { 
    return new Center(
      child:  new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.all(20),
            child: new RaisedButton(
              onPressed: (){
                Navigator.pop(context, 'Yep!');
              },
              child: new Text('Yep!'),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(20.0),
            child: new RaisedButton(
              onPressed: (){
                Navigator.pop(context, 'Nope!');
              },
              child:  new Text('Nope!'),
            ),
          ),
        ],
      ),
    );
  }
}