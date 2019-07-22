import 'package:flutter/material.dart';

class Product {
  const Product({this.name,this.detail});
  final String name;
  final String detail;
}

typedef void CartChangedCallBack(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({Product product,this.inCart, this.onCartChanged})
    : product = product,
    super(key: new ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallBack onCartChanged;

  Color _getColor(BuildContext context) {
    return inCart  ? Colors.black45 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context){
    if(!inCart) return null;

    return new TextStyle(
        color: Colors.black45,
        decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
     return new ListTile(
       onTap: (){
        //  onCartChanged(product,!inCart);
        Navigator.push(
          context, 
          new MaterialPageRoute(builder: (context) => new ShoppingDetailPage(product: product)),
          );
       },
       leading:  new CircleAvatar(
         backgroundColor: _getColor(context),
         child:  new Text(product.name[0]),
       ),
       title: new Text(product.name,style: _getTextStyle(context)),
       subtitle: new Text(product.detail,style: _getTextStyle(context)),
     );
  }
}

class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}) : super(key: key);
final List<Product> products;

@override
 _ShoppingListState createState()  => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
Set<Product> _shoppingCart = new Set<Product>();

void _handleCartChanged(Product product, bool inCart) {
  setState(() {
    if(inCart) 
      _shoppingCart.add(product);
    else
      _shoppingCart.remove(product);
  });
  }

  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: new AppBar(
       title: new Text('Shopping list'),
     ),
     body: new ListView(
       padding: new EdgeInsets.symmetric(vertical: 8.0),
       children: widget.products.map((Product product){
        return new ShoppingListItem(
          product: product,
          inCart: _shoppingCart.contains(product),
          onCartChanged: _handleCartChanged,
        );
       }).toList(),
     ),
     floatingActionButton: new SelectionButton(),
   );
  }
}

class ShoppingListHome extends   StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    return new MaterialApp(
      title: 'Shopping App',
      home: new ShoppingList(
        products: <Product>[
          new Product(name: 'Eggs',detail: 'twwo egss'),
          new Product(name: 'Flour',detail: 'to make bread'),
          new Product(name: 'Chocolate chips',detail: 'very dilicious'),
        ],
      ),
    );
  }
}
// 页面跳转 且带参数 详情页
class ShoppingDetailPage extends StatelessWidget {
  final Product product;
  ShoppingDetailPage({Key key, @required this.product}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${product.name}"),
      ),
      body: new Padding(
        padding: new EdgeInsets.all(16.0),
        child: new Text("${product.detail}"),
      ),
    );
  }
}

// 选择页 从新页面返回数据
class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

       _navigateAndDisplaySelection(BuildContext context) async {
      final result = await Navigator.push(
        context, 
        new MaterialPageRoute(builder:(context) => new SelectionScreen()),
      );
      Scaffold
        .of(context)
        .showSnackBar(new SnackBar(content: new Text('$result')));
    }

    return new  RaisedButton(
      onPressed: (){
        _navigateAndDisplaySelection(context);
      },
      child:  new Text('Pick an option'),
    );
 
  }
}

class SelectionScreen extends StatelessWidget {

@override
  Widget build(BuildContext context) { 
    return new Scaffold(
      appBar:  new AppBar(
        title: new Text('pick an option'),
      ),
      body: new Center(
        child:  new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child:  new RaisedButton(
                onPressed: (){
                  // pop header
                  Navigator.pop(context, 'yep!');
                },
                child: new Text('Yep!'),
              ),
            ),
            new Padding(
                padding:  const EdgeInsets.all(8.0),
                child:  new RaisedButton(
                  onPressed: (){
                    Navigator.pop(context,'Nope!');
                  },
                  child: new Text('Nope.'),
                ),
            ),
          ],
        ),
      ) ,
    );
  }
}