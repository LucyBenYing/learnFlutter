import 'package:flutter/material.dart';

class UseRouteToPages extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Screen0(),
      // 在程序主入口中定义路由名称
      routes: <String , WidgetBuilder>{
        '/': (BuildContext context) => new Screen0(),
        '/screen1': (BuildContext context) => new Screen1(),
        '/screen2': (BuildContext context) => new Screen2(),
        '/screen3' : (BuildContext context) => new Screen3(),
      },
    );
  }


}

class Screen0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return new Scaffold(
       appBar: new AppBar(
         title: new Text( 'Screen0'),
       ),
       body: new Center (
         child: new Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: <Widget>[
              new RaisedButton(
               onPressed: (){
                 //1.pushNamed 简单的将我们需要进入的页面push到栈顶，以此来显示当前页面，参数是一个字符串类型
                //  传入的是页面对应的路由名称，该路由名称需要在程序主入口中进行定义
                 Navigator.of(context).pushNamed('/screen1');
               },
               child: new Text('1. pushNamed: to screen1 '),
             ),
             new RaisedButton(
               onPressed: (){
                 //2.pushReplacementNamed 
                //  指把当前页面在栈中的位置替换成跳转的页面（替换导航器的当前路由，通过推送路由【routeName】）
                // 当新的页面进入之后，之前的页面将执行dispose方法
                 Navigator.of(context).pushReplacementNamed('/screen1');
               },
               child: new Text('2.pushReplacementNamed: to screen1'),
             ),
             new RaisedButton(
               onPressed: (){
                 //3.pushReplacement 
                // 这个和2相同，只是路由的传递有差别，上方的是传递路由名称，
                // 而后者只需要new对应页面即可，而且可以传递参数
                 Navigator.pushReplacement(
                   context,
                    MaterialPageRoute(builder:  (BuildContext context) => Screen1()),
                 );
               },
               child: new Text('3.pushReplacement: to screen1'),
             ),
             new RaisedButton(
               onPressed: (){
                 //4.popAndPushNamed 
                // 指将当期页面pop，然后跳转到指定页面
                // 而后者只需要new对应页面即可，而且可以传递参数
                 Navigator.popAndPushNamed(
                   context,
                   '/screen1',
                 );
               },
               child: new Text('4.popAndPushNamed: to screen1'),
             ),
               new RaisedButton(
               onPressed: (){
                 //5.pushNamedAndRemoveUntil 
                // 指将指定的页面加入到路由中，然后将之前所有的页面全部pop
                //  (Route<dynamic> route) => false将确保删除推送路线之前的所有路线
                // 事情情况： 当用户点击了退出登录，我们需要进入某一个页面，这时候用户点击返回时不应该能进入到任何一个页面
                // 1->2->3,3到4pushNamedAndRemoveUntilfalse
                // 在4点击返回，直接退出程序
                 Navigator.of(context).pushNamedAndRemoveUntil( 
                   '/screen2',
                   (Route<dynamic> route) => false,
                 );
               },
               child: new Text('5.pushNamedAndRemoveUntil to screen2'),
             ),
              new RaisedButton(
               onPressed: (){
                 //6.pushNamedAndRemoveUntil 
                // 指将指定的页面加入到路由中，然后将之前的路径移除直到指定的页面为止（将具有给定名称的路由推到导航器上）
                //  然后删除所有路径前面的路由，直到predicate返回true为止
                // 这时候将销毁站内处理screen4的页面，点击直接去栈内screen4，这时screen4会重新build
                // 事情情况： 当用户点击了退出登录，我们需要进入某一个页面，这时候用户点击返回时不应该能进入到任何一个页面
                // 1->2->3, 3到4 使用：pushNamedAndRemoveUntil  ModalRoute.withName('/screen1'),
                // 在4点击返回，直接回到页面1
                // 1->2->1->2->3,3到4时使用  pushNamedAndRemoveUntil ModalRoute.withName('/screen1'),
                // 在页面4点击返回，将会回到第二个页面1 。
                Navigator.of(context).pushNamedAndRemoveUntil( 
                   '/screen4',
                   ModalRoute.withName('/screen1'),
                 );
               },
               child: new Text('6.pushNamedAndRemoveUntil to screen4'),
             ),
              new RaisedButton(
               onPressed: (){
                 //7.pushAndRemoveUntil 
                //   这种方法跟上述方法作用相同，不同之处在于，上述传递的是路由名称，
                // 这个名称需要你在入口处进行路由指定，而这种无需指定，直接new出来即可，而且可以传递参数
                // 1->2->3, 3到4 使用 此方法
                // 在4点击返回，直接回到页面1
                // 如果使用 pushAndRemoveUntil Route<dynamic> route) => false,这时候进入4后，4将会成为唯一的一个页面。
                 Navigator.pushAndRemoveUntil(
                   context,
                   MaterialPageRoute(builder:  (BuildContext contenxt) => new Screen4()),
                   ModalRoute.withName('/'),
                 );
               },
               child: new Text('7.pushAndRemoveUntil: to screen4'),
             ),
               new RaisedButton(
               onPressed: (){
                 //8.popUntil 
                // 指将当期页面pop，然后跳转到指定页面
                // 而后者只需要new对应页面即可，而且可以传递参数
                 Navigator.popUntil(
                   context,
                    ModalRoute.withName('/screen2'),
                 );
               },
               child: new Text('8.popUntil: to screen1'),
             ),
                 new RaisedButton(
               onPressed: (){
                 //9.maybePop 
                //  maybePop会自动进行判断，如果当前页面pop后，会显示其他页面，不会出现问题，则将执行当前页面的pop操作
                // 否则将不执行
                 Navigator.of(context).maybePop();
               },
               child: new Text('9.maybePop'),
             ),
                 new RaisedButton(
               onPressed: (){
                 //10.canPop 
                //  canPop 判断当前页面能否进行pop操作，并返回bool值
                // 否则将不执行
               final bool can = Navigator.of(context).canPop();
               if(can) {
                 Navigator.of(context).pop();
               }
               },
               child: new Text('9.canPop--pop'),
             ),
           ],
         ) ,
       ),
     );
  }
}


class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return new Scaffold(
       appBar: new AppBar(
         title: new Text( 'Screen1'),
       ),
       body: new Center(
         child:  new RaisedButton(
               onPressed: (){
                 //2.pushReplacementNamed 
                //  指把当前页面在栈中的位置替换成跳转的页面（替换导航器的当前路由，通过推送路由【routeName】）
                // 当新的页面进入之后，之前的页面将执行dispose方法
                 Navigator.of(context).pushReplacementNamed('/screen2');
               },
               child: new Text('2.pushReplacementNamed: to screen2'),
             ),
       ),
     );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return new Scaffold(
       appBar: new AppBar(
         title: new Text( 'Screen2'),
       ),
       body: new Center(
         child:  new Text('Screen2'),
       ),
     );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return new Scaffold(
       appBar: new AppBar(
         title: new Text( 'Screen3'),
       ),
       body: new Center(
         child:  new Text('Screen3'),
       ),
     );
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return new Scaffold(
       appBar: new AppBar(
         title: new Text( 'Screen4'),
       ),
       body: new Center(
         child:  new Text('Screen4'),
       ),
     );
  }
}