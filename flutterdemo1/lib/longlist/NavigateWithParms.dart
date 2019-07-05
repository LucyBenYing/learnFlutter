import 'package:flutter/material.dart'; 
import 'package:flutter/widgets.dart'; 

class  TestApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return  new MaterialApp( 
      home: new NavigateWithParmsApp(),
    );
  }
}

class NavigateWithParmsApp extends StatelessWidget {
  final title = 'NavigateWithParmsApp List';
  @override
  Widget build(BuildContext context) { 
   return new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: NavigateWithParmsView1(),    
    );
  }
}

class  NavigateWithParmsView1 extends StatelessWidget {
  final todos = new List<ToDoItem>.generate(
    20, 
    (i) => new ToDoItem(
      'Todo $i', 
      'A description of what needs to be done for Todo $i'),
      );
  
  @override
  Widget build(BuildContext context) { 
     return _getListView(context) ;
  }

  Widget _getListView(BuildContext context){
    return new ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return new ListTile(
          onTap: (){
            Navigator.push(context, 
            new MaterialPageRoute(
              builder: (context) => 
                new NavWithParmDetailScreen(
                  todo: todos[index]
                ),
              )
            );
          },
          title:  new Text(todos[index].title),
        );
      },
    );
  }
}

class ToDoItem {
  final String title;
  final String description;
  ToDoItem(this.title,this.description);
}


class NavWithParmDetailScreen extends StatelessWidget {
  final ToDoItem todo;
  NavWithParmDetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return _getDetailScreen(context);
  }

  Widget _getDetailScreen(BuildContext content){
    return new Scaffold(
      appBar:  new AppBar(
        title: new Text("${todo.title}"),
      ),
      body: new Padding(
        padding:  new EdgeInsets.all(20.0),
        child: new Text("${todo.description}"),
      ),
    );
  }
}
