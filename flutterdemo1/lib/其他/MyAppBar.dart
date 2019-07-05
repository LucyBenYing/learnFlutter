import 'package:flutter/material.dart';
class MyAppBar extends StatelessWidget {
    MyAppBar({this.title});
    final  Widget title;

    @override 
    Widget build(BuildContext context) {
      return new Container(
        height: 56.0, //高度为56个像素，像素单位独立于设备，为逻辑像素
        padding: const EdgeInsets.symmetric(horizontal:8.0),//其左侧和右侧均有8像素的天聪
        decoration: new BoxDecoration(color: Colors.blue[500]),
        child:  new Row(
          children: <Widget>[
            new IconButton(
              icon:  new Icon(Icons.menu),
              tooltip: 'Navigation menu',
              onPressed: null,//null会禁用button
            ),
// expanded意味着它会填充尚未被其他子项占用的剩余可用空间。
// Expanded可以拥有多个children，然后使用flex参数来确定他们占用剩余空间的比例。
            new Expanded(
              child: title,
            ),

          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'search',
            onPressed: null,
          ),
          ],
        ),
      );
    }
}

class MyScaffold extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    //material 是UI呈现的一张纸
    return new Material(
      child: new Column(
          children: <Widget>[
            new MyAppBar(
              title: new Text(
                'Example title',
                style: Theme.of(context).primaryTextTheme.title,  
                textAlign: TextAlign.center,
              ),
            ),
            new Expanded(
              child: new Center(
                child:  new Text('Hello world!'),
              ),
            )
          ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) { 
    // 为了继承主题数据 widget需要位于Material内才能正常显示，因此我们使用MaterialApp来运行该应用。
    return MaterialApp(
        title: 'My app',
        home: new MyScaffold(),
    );
  }
}