import 'package:flutter/material.dart';

class SampleApp extends StatelessWidget {
  @override 
  Widget build (BuildContext context){
    return MaterialApp(
      title: 'SampleApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyApp(),
    );
  }
}
class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
      Widget titleSection = new Container(
       padding: const EdgeInsets.all(32.0),
       child: new Row(
         children: <Widget>[
           new Expanded(
             child:  new Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 new Container(
                   padding: const EdgeInsets.only(bottom: 8.0),
                   child: new Text(
                     'Oeschinen Lake Cmapgorund',
                     style: new TextStyle (
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),
                 new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                 ),
               ],
             ),
           ),
           new Icon(
             Icons.star,
             color: Colors.red[500],
           ),
           new Text('41'),
         ],
       ),
     ); 

 

     Column buildButtonColumn(IconData icon, String label) {
     Color color = Theme.of(context).primaryColor;
     return new Column(
       mainAxisSize: MainAxisSize.min,
       mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[
         new Icon(
           icon,
           color: color
         ),
         new Container(
           margin: const EdgeInsets.only(top: 8.0),
           child: new Text(
             label,
             style: new TextStyle(
               fontSize: 12.0,
               fontWeight: FontWeight.w400,
               color: color,
             ),
           ),
         ),
       ],
     );
    }

    Widget buttonSection = new Container(
      child:  new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
        Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        Lake Oeschinen lies at the foot of the Blüemlisalp in the Berne
       Lake Oeschinen lies at the foot of the Blüemlisalp in the Berne1
       Lake Oeschinen lies at the foot of the Blüemlisalp in the Berne2
       Lake Oeschinen lies at the foot of the Blüemlisalp in the Berne3
       Lake Oeschinen lies at the foot of the Blüemlisalp in the Berne4
        ''',          
        softWrap: true,
      ),  
    );

    
   return Scaffold(
     appBar: AppBar(
       centerTitle: true,
       title: Text('Details'),
     ),
     body:  new ListView(
        children: [
          new Image.asset(
            'images/lake.jpeg',
            width: 600.0,
            height:240.0,
            fit: BoxFit.cover,
          ), 
          
          titleSection,
          buttonSection,
          textSection,
        ],
    ),
  );
  }
}

// class RunApp extends StatelessWidget {
//   new Center {
//     child: new Text(
//       'Hello World !@',
//       textDirection: TextDecoration.ltr,
//     ),
//   };
// }