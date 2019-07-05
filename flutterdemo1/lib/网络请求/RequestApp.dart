import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'User.dart';
import 'JsonToUser.dart';

//请求
class RequestApp extends StatelessWidget {
  @override 
  Widget build(BuildContext content) {
    return new MaterialApp(
      home: new MyRequestHomePage(),
    );
  }
}

class MyRequestHomePage extends StatefulWidget {
  MyRequestHomePage({Key key}):super(key: key);

  @override 
  _MyRequestHomePageState createState() => new _MyRequestHomePageState();

}

class _MyRequestHomePageState extends State<MyRequestHomePage> {
  var _ipAddress = 'UnKnown';

  _getIPAddress() async {
    var url = 'https://httpbin.org/ip';
    var httpClient = new HttpClient();

    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        // var json = await response.transform(utf8.decoder).join();
        // var data = jsonDecode(json);
        //手动序列化
        final userJson = '{"name":"John Smith", "email":"John@example.com"}';
        // Map<String,dynamic> user = jsonDecode(userJson);
        // print('Howdy,${user['name']}');
        // print('we seent the Verufuaction link to ${user['email']}.');
        // result = '$user';

        // 模型序列化
        Map userMap = jsonDecode(userJson);
        var user2 = new User.fromJson(userMap);
        print('Hello ${user2.name}');
        print('We sent the verificatrion link to ${user2.email}');
        result = '$user2'; 

        // 代码生成 第三方json_serializable
        var user3 = new JsonToUser.formJson(userMap);
        String jsonFromUser = jsonEncode(user3);
        print('JsonFromUser is $jsonFromUser');

      } else {
        result = 'Error getting Ip Address:\n Http status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Faile getting IP address';
    }

    if (!mounted) return;

    setState(() {
      _ipAddress = result;
    });
  }

  @override 
  Widget build(BuildContext context){
    var spacer = new SizedBox(height: 32.0,);
    return new Scaffold(
      body:  new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Your current IP address is:'),
            new Text('$_ipAddress.'),
            spacer,
            new RaisedButton(
              onPressed: _getIPAddress,
              child:  new Text('Get Ip address'),
            ),
          ],
        ),
      ),
    );
  }
}





