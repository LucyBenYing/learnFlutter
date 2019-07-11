import 'package:flutter/material.dart';

 class MyTabControllerWidget extends StatefulWidget {
  @override
  _MyTabControllerWidgetState createState() => _MyTabControllerWidgetState();
}

class _MyTabControllerWidgetState extends State<MyTabControllerWidget>
  with SingleTickerProviderStateMixin{
    TabController _tabController;

    @override
  void initState() { 
    super.initState();
    _tabController = TabController(vsync: this,length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义Tabcontroller') ,
        bottom: TabBar(
          tabs: <Widget>[
            Tab(text: '热点'),
            Tab(text: '体育'),
            Tab(text: '科技'),
          ],
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(child: Text('热点')),
          Center(child: Text('体育')),
          Center(child: Text('科技')),
        ],
      ),
    );
  }

  @override
  void dispose() { 
    _tabController.dispose();
    super.dispose();
  }
}