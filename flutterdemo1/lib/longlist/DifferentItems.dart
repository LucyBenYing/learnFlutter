import 'package:flutter/material.dart'; 

class  TestApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return  new MaterialApp( 
      home: new DifferentItemsListApp(),
    );
  }
}

class DifferentItemsListApp extends StatelessWidget {
  final title = 'different items List';
  @override
  Widget build(BuildContext context) { 
   return new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: DifferentItemsListView(),    
    );
  }
}

abstract class ListItem{}
class HeadingItem implements ListItem {
  final String heading;
  HeadingItem(this.heading);
}

class MessageItem implements ListItem {
  final String sender;
  final String body;
  MessageItem(this.sender,this.body);
}



class DifferentItemsListView extends StatelessWidget {
  final items = new List<ListItem>.generate(
    1200,
    (i) => i % 6 == 0 
    ? new HeadingItem('heading $i')
    : new MessageItem('Sender $i', 'Message body ${i % 6}'),
  );

@override
  Widget build(BuildContext context) { 
    return    getListBuilder(context);
  }

  ListView getListBuilder (BuildContext context){
    return new ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        if (item is HeadingItem) {
          return new ListTile(
            title: new Text(
            item.heading,
            style: Theme.of(context).textTheme.headline,
          )
          );
        } else if (item is  MessageItem){
          return new ListTile(
            title: new Text(item.sender),
            subtitle: new Text(item.body),
          );
        } else {
          return new ListTile();
        }
      }
    );
  }
}
