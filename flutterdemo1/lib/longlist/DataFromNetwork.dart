import 'dart:convert'; 
import 'package:flutter/material.dart'; 
import 'package:dio/dio.dart';

Future<Post> fetchPost(String url) async { 
    try {
      Response response = await Dio().get(url);
      print('返回数据 $response');
      if(response.data != null ) {
        Map<String,dynamic> json = jsonDecode( response.toString());
        print('格式化后的数据$json');
        return new Post.fromJson(json);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

class DataFromNetworkApp extends StatelessWidget {
  final title = 'GridListView List';
  @override
  Widget build(BuildContext context) { 
   return new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: DataFromNetworkView(),    
    );
  }
}

class DataFromNetworkView extends StatelessWidget {
  final url = 'https://jsonplaceholder.typicode.com/posts/1'; 
@override
  Widget build(BuildContext context) { 
    return Center(
      child:  new FutureBuilder<Post> (
        future: fetchPost(url),
        builder: (context, snapshot){
          if (snapshot.hasData) {
            return new Text(snapshot.data.title);
          } else if (snapshot.hasError){
            return new Text('${snapshot.error}');
          } else {
            return new CircularProgressIndicator();
          }
        }
      ),
    );
  }
}

 
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId,this.id,this.body,this.title});

  factory Post.fromJson(Map<String, dynamic> json){
    return new Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}



 