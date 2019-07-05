import 'package:flutter/material.dart';

 class FaveriteWidget extends StatefulWidget {
  @override
  _FaveriteWidgetState createState() => _FaveriteWidgetState();
}

class _FaveriteWidgetState extends State<FaveriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite(){
    setState(() {
      if (_isFavorited){
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return  new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(0),
          child: new IconButton(
            icon: (_isFavorited
              ? new Icon(Icons.star)
              : new Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        new SizedBox(
          width: 18.0,
          child: new Container(
            child: new Text('$_favoriteCount'),
          ),
        )
      ],
    );
  }
}

class FavoriteApp extends StatelessWidget {
  final title = 'FavoriteApp';
  @override
  Widget build(BuildContext context) { 
   return new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new Container(
          child:  new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Container(
               color: Colors.yellow[200],
              padding: const EdgeInsets.all(20.0),
              child: new FaveriteWidget(),
            ),
            new Container(
              height: 20.0,
            ),
            new TapboxA(),
            new Container(
              height: 20.0,
            ),
            new ParentWidget(),
            new Container(
              height: 20.0,
            ),
            new MixControlStates(),
          ],
     
        ),    
    ),
   );
  }
}

//widget 自己管理状态
 class  TapboxA extends StatefulWidget {
   TapboxA({Key key}) : super(key: key);
  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;
  void _handleTap(){
  setState(() {
    _active = !_active;
  });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child:  new Container(
        child:  new Center(
          child:  new Text(
            _active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0,color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 100.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}
 

//  父widget管理状态
class ParentWidget  extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;
  void _handletapboxChanged(bool newValue){
    setState(() {
      _active =  newValue;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  new TapboxB(
        active: _active,
        onChanged: _handletapboxChanged,
      ),
    );
  }
}

class TapboxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  TapboxB({Key key, this.active:false, @required this.onChanged}) : super(key: key);

  void _handleTap(){
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child:  new Text(
            active ? 'Active2' : 'Inactive2',
            style: new TextStyle(
              fontSize: 32.0,
              color: Colors.white,
            ),
          ),
        ),
        width: 200,
        height: 200,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700]: Colors.grey[600],
        ),
      ),
    );  
  }

}


  class MixControlStates  extends StatefulWidget {
  @override
  _MixControlState createState() => _MixControlState();
}

class _MixControlState extends State<MixControlStates> {
  bool _active = false;
  void _handletapChanged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  new TapboxC(
        active: _active,
        onChanged: _handletapChanged,
      ),
    );
  }
}

class TapboxC extends StatefulWidget {
  final bool active;
  final ValueChanged<bool> onChanged;
  
  TapboxC({Key key, this.active: false, @required this.onChanged})
   : super(key:key);

  @override
  _TapboxCState createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _hightLight = false;
  void _handleTapDown (TapDownDetails details) {
    setState(() {
      _hightLight = true;
    });
  }
  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _hightLight = false;
    });
  }

  void _handleTapChancel(){
    setState(() {
      _hightLight = false;
    });
  }
  void _handleTap(){
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return  new GestureDetector (
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapChancel,
      onTap: _handleTap,
      child: new Container(
        child:  new Center(
          child:  new Text(
            widget.active ? 'Active3' : 'Inactive3',
            style: new TextStyle(
              fontSize: 32.0,
              color: Colors.white,
            ),
          ),
        ),
        width: 200.0,
        height: 100.0,
        decoration:  new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _hightLight 
            ? new Border.all(
              color: Colors.teal[700],
              width: 10.0,
            )
            :  null,
        ),
      ),
    );
  }
}