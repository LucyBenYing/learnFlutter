import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:transparent_image/transparent_image.dart';

// new MaterialApp {
//   title: title,
//   theme:
// }

class CookbookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appName = 'Custom themes';
    return new MaterialApp(
      title: appName,
      theme: new ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
      ),
      home: new CookbookHomePage(
        title: appName,
      ),
    );
  }
}
// http://tu.duowan.com/gallery/138939.html#p1
class CookbookHomePage extends StatelessWidget {
  final String title; 
  final String imageUrl = 'https://image.baidu.com/search/down?tn=download&word=download&ie=utf8&fr=detail&url=https%3A%2F%2Ftimgsa.baidu.com%2Ftimg%3Fimage%26quality%3D80%26size%3Db9999_10000%26sec%3D1562046651416%26di%3D5c9afda05a9932dbd82c5570be3fd8f2%26imgtype%3D0%26src%3Dhttp%253A%252F%252Fpic.58pic.com%252F58pic%252F13%252F32%252F20%252F53h58PICiKS_1024.jpg&thumburl=https%3A%2F%2Fss0.bdstatic.com%2F70cFuHSh_Q1YnxGkpoWK1HF6hhy%2Fit%2Fu%3D3116498908%2C2415406930%26fm%3D26%26gp%3D0.jpg';
 final String imageUrl2 = 'https://image.baidu.com/search/down?tn=download&word=download&ie=utf8&fr=detail&url=https%3A%2F%2Ftimgsa.baidu.com%2Ftimg%3Fimage%26quality%3D80%26size%3Db10000_10000%26sec%3D1562037495%26di%3D22f4253f662a490142e463e4c959e9fe%26src%3Dhttp%3A%2F%2Fimg1.juimg.com%2F170212%2F330772-1F21210104474.jpg&thumburl=https%3A%2F%2Fss3.bdstatic.com%2F70cFv8Sh_Q1YnxGkpoWK1HF6hhy%2Fit%2Fu%3D2867260428%2C992491930%26fm%3D27%26gp%3D0.jpg';
 final String imageUrl3 = 'https://image.baidu.com/search/down?tn=download&word=download&ie=utf8&fr=detail&url=https%3A%2F%2Ftimgsa.baidu.com%2Ftimg%3Fimage%26quality%3D80%26size%3Db10000_10000%26sec%3D1562038150%26di%3D8e9045148b4845cdf3ecf9abeb3285b4%26src%3Dhttp%3A%2F%2Flife.southmoney.com%2Ftuwen%2FUploadFiles_6871%2F201806%2F20180629134958770.jpg&thumburl=https%3A%2F%2Fss1.bdstatic.com%2F70cFvXSh_Q1YnxGkpoWK1HF6hhy%2Fit%2Fu%3D1707982074%2C204288132%26fm%3D27%26gp%3D0.jpg';
 CookbookHomePage({Key key, @required this.title}) : super(key: key);
@override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:  new AppBar(
        title: new Text(title),
        backgroundColor: Colors.yellow,
      ),
      body: new Center(
        child: new Container(
          // height: 200.0,
          color: Theme.of(context).accentColor,
          child: new Column(
            children: <Widget>[
              new Container(
                padding: new EdgeInsets.all(20.0),
                child: Center(
                 child: new Text(
                     'Text with a background color',
                     style: Theme.of(context).textTheme.title,
               ),
                ),
              ),
            
               new Image.network( 
               imageUrl,
               ),
               new Container(
                 height: 8.0,
               ),
               new Container ( 
                 padding: new EdgeInsets.symmetric(horizontal: 30),
                   child: new FadeInImage.memoryNetwork(
                     placeholder: kTransparentImage,
                     image: imageUrl2,
                   ),
               ),
              //  缓存图片有问题
              //  new CachedNetworkImage(
              //   placeholder: new CircularProgressIndicator(),
              //   imageUrl: imageUrl3,
              //  ),
            ],
          ),
        ),
      ),
      floatingActionButton:  new Theme(
        data: Theme.of(context).copyWith(accentColor: Colors.yellow),
        child: new FloatingActionButton(
          onPressed: null,
          child:  new Icon(Icons.add),
        ),
      ),
    );
  }
}

