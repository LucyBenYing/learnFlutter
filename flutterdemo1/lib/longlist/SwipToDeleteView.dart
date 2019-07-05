import 'package:flutter/material.dart'; 
import 'package:flutter/widgets.dart'; 
class  TestApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return  new MaterialApp( 
      home: new SwipToDeleteViewApp(),
    );
  }
}

class SwipToDeleteViewApp extends StatelessWidget {
  final title = 'SwipToDeleteView List';
  @override
  Widget build(BuildContext context) { 
   return new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: SwipToDeleteView(),    
    );
  }
}

class SwipToDeleteView extends StatelessWidget {
  final items = new List<String>.generate(
    20,
    (i) => "Item ${i + 1}"
  );

  @override
  Widget build(BuildContext context) { 
    return new ListView.builder(
      itemCount: items.length,
      itemBuilder:(context, index){
        final item = items[index];
        return new Dismissible(
          background: new Container( color: Colors.red),
          key: new Key(item),
          onDismissed: (direction) {
            items.removeAt(index);
            Scaffold.of(context).showSnackBar(
              new SnackBar(content: new Text('$item dismissed'))
            ); 
            items.remove(item);
          },
          child: new ListTile(title: new Text('${items[index]}')),
        );
        
      } ,
    );
     
  }
}