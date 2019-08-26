import 'package:flutter/material.dart';

class RefreshAndLoadMore extends StatefulWidget {
  @override
  _RefreshAndLoadMoreState createState() => _RefreshAndLoadMoreState();
}

class _RefreshAndLoadMoreState extends State<RefreshAndLoadMore> {
  List <ItemEntity> entityList = [];
  ScrollController _scrollController = new ScrollController();
  bool isLoadData = false;

  @override
  void dispose() { 
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() { 
    super.initState();
    _scrollController.addListener((){ 
        if (_scrollController.position.pixels == 
          _scrollController.position.maxScrollExtent){
            print("------加载更多------");
            _getMoreData();
          }
    });
    for(int i = 0; i < 10; i ++){
      entityList.add(ItemEntity("Item $i", Icons.accessibility));
    }
  } 
  Future<Null> _getMoreData() async{
    await Future.delayed(Duration(seconds: 2),(){
      if(!isLoadData){
        isLoadData = true;
      }
      setState(() {
        isLoadData = false;
        final newList = List.generate(5, (index) => 
          new ItemEntity(
            '上拉加载更多 item${index + entityList.length}', 
            Icons.accessibility
          )
        ); 
        entityList.addAll(newList);
      });
    });
  }

  Future<Null> _handleRefresh() async {
    print("--------开始刷新");
    await Future.delayed(Duration(seconds: 2),(){
    setState(() {
      entityList.clear();
      entityList = List.generate(
        10,  
        (index ) => 
          new ItemEntity("下拉刷新后的--Item $index", Icons.accessibility));
          return Null;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
      appBar: new AppBar(
        title: new Text('List View'),
      ),
      body:  RefreshIndicator(
        displacement: 50,
        color: Colors.redAccent,
        backgroundColor: Colors.blue,
        child: ListView.builder(
          itemCount: entityList.length + 1,
          itemBuilder: (BuildContext context,int index){
            if (index == entityList.length) {
                return LoadMoreView();
            } else {
              return ItemsView(entityList[index]);
            } 
          },
          controller: _scrollController,
        ),
        onRefresh: _handleRefresh,
      ),
    );
  }
}

class ItemEntity {
  String title;
  IconData iconData;
  ItemEntity(this.title,this.iconData);
}

class ItemsView extends StatelessWidget {
  final ItemEntity itemEntity;
  ItemsView(this.itemEntity);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Text(
            itemEntity.title,
            style: TextStyle(color: Colors.black87),
          ),
          Positioned(
            child: Icon(
              itemEntity.iconData,
              size: 30,
              color: Colors.blue,
            
            ),
            left: 5,
          ),
        ],
      ),
    );
  }
}

class LoadMoreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(19.0),
      child: Center(
        child:  Row (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new CircularProgressIndicator(),
            Padding(padding: EdgeInsets.all(10)),
            Text('加载中。。。')
          ],),
      ),
      color: Colors.white70,
    );
  }
}