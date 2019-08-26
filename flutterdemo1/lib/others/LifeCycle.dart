import "package:flutter/material.dart";

class ViewLifeCycle extends StatefulWidget {
  @override
  _ViewLifeCycleState createState() => _ViewLifeCycleState();
}

class _ViewLifeCycleState extends State<ViewLifeCycle> with WidgetsBindingObserver{
String text = "helllo you";
  _ViewLifeCycleState(){
    print('_ViewLifeCycleState 构造方法');
  }

  @override
  @mustCallSuper
  void initState() { 
    super.initState();
    print('_ViewLifeCycleState initState');
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback( (_){
      print('单次Frame绘制回调,只回调一次');
    });
    WidgetsBinding.instance.addPersistentFrameCallback( (_){
      print('实时frame绘制回调,每帧都回调');
    });
  }

  @override
  void didChangeDependencies() { 
    super.didChangeDependencies();
    print('_ViewLifeCycleState didChangeDependencies'); 
  }

@override
  void didUpdateWidget(ViewLifeCycle oldWidget) { 
    super.didUpdateWidget(oldWidget);
    print('_ViewLifeCycleState didUpdateWidget'); 
  }

@override
  void deactivate() { 
    super.deactivate();
    print('_ViewLifeCycleState deactivate');  
  }

  @override
  @mustCallSuper
  void dispose() { 
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
        print('_ViewLifeCycleState dispose'); 
  }

  @override
  Widget build(BuildContext context) {
    print('_ViewLifeCycleState build');
    return Scaffold(
      appBar: new AppBar(
        title: new Text('生命周期示例'),
      ),
      body: MyStatelessView(text: text),
    );
  }

  // app 生命周期
@override
  void didChangeAppLifecycleState(AppLifecycleState state) { 
    super.didChangeAppLifecycleState(state);
    print('$state');
    if (state == AppLifecycleState.resumed){
      print('可见的，并能响应用户的输入');
    } else if (state == AppLifecycleState.inactive){
       print('处在不活动状态，无法处理用户响应');
    } else if (state == AppLifecycleState.paused){
      print('不可见并不能响应用户的输入，但是在后台继续活动中');
    }
  }
}

class MyStatelessView extends StatelessWidget {
  final String text;
  MyStatelessView({Key key, this.text}):super(key: key);
  @override
  Widget build(BuildContext context) {
    print('MyStatelessView build');
    return  new Center(
      child: new Text(text),
    );
  }
}