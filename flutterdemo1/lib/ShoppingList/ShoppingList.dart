import "package:flutter/material.dart";

// // 定义商品 Item 类
// class Item {
//   double price;
//   String name;
//   // 改造前
//   // 构造函数 
//   // Item(name,price){
//   //   this.name = name;
//   //   this.price = price;
//   // }

// // Dart里，可以利用语法糖以及初始化列表，来简化这样的赋值过程，从而直接省去构造函数的函数体
//   Item(this.name, this.price);
// }
// // 定义购物车
// class ShoppingCart {
//   String name;
//   DateTime date;
//   String code;
//   List<Item> bookings;
//   price(){
//     double  sum = 0.0;
//     for (var i in bookings){
//       sum += i.price;
//     }
//     return sum;
//   }
// // 改造前
//   // ShoppingCart(name,code){
//   //   this.name = name;
//   //   this.code = code;
//   //   this.date = DateTime.now();
//   // }
// // 改造后 删掉了构造函数函数体
// ShoppingCart(this.name,this.code) : date = DateTime.now();

//   getInfo(){
//     return '购物车信息:' + 
//             '\n----------------' +
//               '\n 用户名：' + name +
//               '\n 优惠码：' + code +
//               '\n 总价：' + price().toString() +
//               '\n 日期：' + date.toString() +
//               '\n';
//   }
// }


class ShoppingListPage extends StatelessWidget{ 
  test(){
    ShoppingCart sc = ShoppingCart.withCode(name:'张三', code: '123456');
    sc.bookings = [
      Item(name:'apple', price:10.0),
      Item(name:'鸭梨',price:20.0)
      ];
    print(sc.getInfo());

    ShoppingCart cs2 = ShoppingCart(name: "helo");
    cs2.bookings = [
      Item(name: 'milk',price: 5.0),
      Item(name: 'pop conn',price: 10.0),
    ];
    print(cs2.getInfo());

    // 可以使用联级运算符'..'，在同一个对象上连续调用多个函数以及访问成员变量。
    // 使用联级操作符可以避免创建临时变量，让代码看起来更流畅
    ShoppingCart.withCode(name: 'Lucy',code: '22222')
    ..bookings = [
      Item(name: 'apple',price: 19.0,count: 3.5),
     Item(name: 'bnana',price: 21.1 ,count: 2.8)]
    ..printInfo();

  }
  @override
  Widget build(BuildContext context) { 
    test();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Shopping List'),
      ),
      body: new Center(
        child: new Text('hhhhhh'),
      ),
    );
  }
}

// 类改造
// 继续改造 抽象基类
class Meta {
  double price; //商品单价
  String name; //商品名称
  double count ; //商品数据 可以是个 也可以是斤 可以为小数
  // 商品总价 
  double get totalPrice {
    print('$price $count' );
    return price * ( count ?? 1.0);
  }

  // Meta(this.name,this.price);

    //我们希望能够提供给调用者更明确的初始化方法调用方式，让调用者以”参数名：参数键值对“的方式指定调用参数
    // 让调用者明确传递的初始化参数的意义。
    // 在Dart中，。这样的需求，我们在声明函数时，可以通过给参数增加{}实现。
    // Meta({this.name,this.price}) 

    Meta({this.name,this.price,this.count});
}

class Item extends Meta {
  // Item(name,price) : super(name,price);

  Item({name, price,count = 1.0}) : super(name:name, price:price,count:count);

// 而 在Dart中，这样的求和运算我们只需要重载Item类的“+”运算符，并通过多列表对象进行归纳合并操作即可实现
// 你可以想象成，把购物车中的所有商品都合并成一个商品套餐对象；
// 另外，由于函数体只有一行，所以我们可以使用Dart的箭头函数来进一步简化实现函数
  Item operator+(Item item) => 
  Item(
    name:name + item.name,
    count:count + item.count,
    price:price * count + item.price *item.count
  );
}
// with  Mixin 混入 实现多继承
class ShoppingCart extends Meta  with PrintHelper{
  DateTime date;
  String code;
  List<Item> bookings;
  //在这个方法里，我采用了其他语言常见的求和算法，依次遍历bookings列表中的item对象，累计相加求和。
  // double get price {
  //   double num = 0.0;
  //   for (var i  in bookings) {
  //     num += i.price;
  //   }
  //   return num;
  //  }
  //把迭代求和 改写为归纳合并
  double get price => bookings.reduce((value,element) => value + element).price;

  // ShoppingCart(name,this.code) : date = DateTime.now(),super(name: name,price:0);
  
  //其次 对于一个购物车对象来说，一定会有一个用户名，单不一定有优惠码的用户。
  // 因此，对于购物车对象的初始化，我们还需要提供一个不含优惠码的初始化方法，
  // 并且需要确定多个初始化方法与父类的初始化方法之间的正确调用顺序。
  ShoppingCart({name}) : this.withCode(name: name,code:null);
  ShoppingCart.withCode({name,this.code}) : date = DateTime.now(),super(name:name,price:0);
  getInfo() => '''
  购物车信息：
  ---------------
   用户名：$name
   优惠码：${code ?? "  没有"}
   商品信息：${getListInfo()}
   总价：$price
   Date：$date
   --------------
  ''';
 String getListInfo(){
   String list = '\n 商品名称 商品数量 商品单价 商品总价\n';
   for (var item in bookings){
     list += '\n ${item.name} ${item.count.toString()} ${item.price.toString()} ${item.totalPrice.toString()}\n';
   }
   return list;
 }

}

// 我们需要把打印信息的能力单独封装成一个单独的类PrintHelper。
// 但，ShoppingCart类 本身已经继续自Meta类，考虑到Dart并不支持多继承，我们怎样才能实现PrintHelper类的复用呢？
// 这就用到了我在上一篇文章中提到的”混入“（Mixin），相信你还记得只要在使用时加上with关键字即可
abstract class PrintHelper {
  printInfo() => print(getInfo());
  getInfo();
}
