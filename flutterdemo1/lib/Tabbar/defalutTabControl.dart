import 'package:flutter/material.dart';

class MyTabcontroller extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
     return DefaultTabController(
       length:  3,
       child: Scaffold(
         appBar: AppBar(
           title: Text('DefalutTabContoller 示例'),
           bottom: TabBar(
             tabs: <Widget>[
               Tab(
                 text: '热点',
               ),
                Tab(
                 text: '体育',
               ),
                Tab(
                 text: '科技',
               ),
             ],),
         ),
         body: TabBarView(
           children: <Widget>[
             Center(child: Text('热点')),
             Center(child: Text('体育')),
             Center(child: Text('科技')),
           ],
         ),
       ), 
     );
  }
}