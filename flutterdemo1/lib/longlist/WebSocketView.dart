import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebsocketViewApp extends StatelessWidget {
  final title = 'WebsocketViewApp';
  @override
  Widget build(BuildContext context) { 
   return new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: WebsocketView(),    
    );
  }
}

class WebsocketView extends StatelessWidget {
final String url = 'ws://echo.websocket.org';
final WebSocketChannel channel = new IOWebSocketChannel.connect('ws://echo.websocket.org');
  @override
  Widget build(BuildContext context) { 
     return WSHomePage(
       title: 'Websocket demo',
       channel: channel,
     );
  }
}

class WSHomePage extends StatefulWidget {
  final String title;
  final WebSocketChannel channel;
  WSHomePage({
    Key key,
     @required this.title, 
     @required this.channel
  }) 
  : super(key: key);

@override
  State<StatefulWidget> createState() => _WSHomePageState();
}


class _WSHomePageState extends State<WSHomePage> {
  TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) { 
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(20.0),
        child:  new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Form(
              child: new TextFormField(
                controller: _controller,
                decoration: new InputDecoration(labelText: 'send a message'),
              ),
            ),
            new StreamBuilder(
              stream: widget.channel.stream,
              builder: (context , snapshot) {
                return new Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: new Text(snapshot.hasData ? '${snapshot.data}': ''),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'send message',
        child:  new Icon(Icons.send),
      ),
    );

    
  }

  void _sendMessage(){
    if (_controller.text.isNotEmpty){
      widget.channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() { 
    widget.channel.sink.close();
    super.dispose();
  }

}

