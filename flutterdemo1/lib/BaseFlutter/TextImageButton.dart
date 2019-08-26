import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
// 经典控件一 文本 图片 按钮


 
class SimpleTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // _testFuture1();
    // _testFuture2();
    // _test3();
    // _test4();
    // _test5();
    // startIsolate();
    _test6();
    return Center(
     child: new Padding(
       padding: EdgeInsets.all(20) ,
       child:   new Text(
       '文本是试图系统中的常见控件，用来显示一段特定样式的字符串，就比如Android里的Textiew，或者iOS中的UILabel',
       textAlign: TextAlign.start,
       textDirection: TextDirection.ltr,
       maxLines: 2,
       overflow: TextOverflow.ellipsis,
       style: TextStyle(
         fontWeight: FontWeight.bold,
         fontSize: 20,
         color: Colors.red
       )),
    )
  );
  }

  // Future
  /**
   * Event Loop 
   * 事件队列  Event Queue
   * 微任务队列 
   *  */ 
  /**
   * 正常情况下，一个Future异步任务的执行是相对简单的：
   * 在我们声明一个future时，dart会将异步任务的函数执行放入事件队列，
   * 然后立即返回，后续的代码继续同步执行。
   * 而当同步执行的代码执行完毕后，
   * 事件队列会按照加入事件队列的顺序（即声明顺序），依次取出事件，
   * 最后同步执行Future的函数体及后续的then。
   * 
   * 这意味着，then与future函数体共用一个事件循环。
   * 如果future有多个then，他们也会按照链式调用的先后顺序同步执行，同样也会共用一个事件循环。
   * 
   * 如果future执行体已经执行完毕了，但你又拿着这个future的引用，往里面加了一个then方法体，这时dart会如何处理呢？
   * 面对这种情况，dart会将后续加入的then方法体放入微任务队列，尽快执行。
   * 
   * then会在future函数体执行完毕后立刻执行，无论是共用一个事件循环还是进入下一个微任务。
   * 
   */
  void _testFuture1(){
    Future(() => print('Runing in future 1')); //下一个事件循环输出字符串
    Future(() => print('Running in future 2'))
    .then((_) => print('and then 1'))
    .then((_) => print('and then 2'));
    Future(()=> null)
    .then((_) => print('then 3'));
    //上一个事件循环后，连续输出三段字符串
  }

  void _testFuture2(){
    Future(() => print('f1'));
    Future fx = Future(() => null);
    Future(() => print('f2')).then((_ ) {
      print('f3');
      scheduleMicrotask(() => print('f4'));
    }).then( (_) => print('f5'));

    Future(() => print('f6'))
    .then( (_) => Future(() => print('f7')))
    .then((_) => print('f8'));

    Future (() => print('f9'));

    fx.then((_) => print('f10'));

    scheduleMicrotask(() => print('f11'));

    print('f12');

  }

/**
 * 异步函数
 * 对于一个异步函数来说，其返回时内部执行动作并未结束，因此需要返回一个Future对象，供调用者使用。
 * 调用者根据Future对象来决定：
 *  是在这个Future对象上注册一个then，等future的执行体结束了以后再进行异步处理；
 *  还是一直同步等待Future执行体结束。
 * 
 * 如果调用者决定同步等待，则需要在调用处使用await关键字，并且在调用处的函数体使用async关键字。
 * 
 * Dart中的await并不是阻塞等待，而是异步等待。
 * dart会将调用体的函数也视作异步函数，将等待语句的上下文放入Event Queue中，
 * 一旦有了结果，event loop就会把它从eventQueue中取出，等待代码继续执行。
 * 
 */

void _test3() async {
  print(await fetchContent());
}
 
Future<String> fetchContent() =>
  Future<String>.delayed(Duration(seconds:3),() => 'hello')
  .then((x) => "$x 2019");

/**
 * 打印结果：f1 f4 f2 f3
 * 由于await是采用事件队列的机制实现等待行为的，所以比它现在事件队列中的f4并不会被它阻塞。
 */

void _test4() {
  Future(() => print('f1'))
  .then((_) async => await Future(() => print('f2')))
  .then((_) => print('f3'));
  Future(() => print('f4'));
}
/**
 * 打印结果：
 * flutter: func before
flutter: Func after 
flutter: hello 2019

await 与 async 只对调用上下文的函数有效，并不向上传递。
因此，对于这个案例而言，_test3是在异步等待。
如果，我们想在_test5函数中也同步等待，需要在调用异步函数时也加上await，在_test5函数也加上async。
 */
void _test5() async{
  print('func before');
  await _test3();
  print('Func after');
  }
}

 /**
   * Isolate
   * 尽管Dart是基于单线程模型的，但为了进一步利用多喝CPU，将CPU密集型运算进行隔离，Dart也提供了多线程机制，即Isolate。
   * 在Isolate中，资源隔离做得非常好，每个Isolate都有自己的event Loop与Queue。
   * Isolate之间不共享任何资源，只能依靠消息机制通信，因此也就没有资源抢占问题。
   * 
   * 对于执行结果的告知，Isolate通过发送管道（SendPort）实现消息通信机制。
   * 我们可以在启动并发Isolate时将主Isolate的发送管道作为参数传给它，这样并发Isolate就可以咋任务执行完毕后利用这个发送管道给我们发消息了。
   */

  Isolate isolate;
  startIsolate() async {
    ReceivePort receivePort = ReceivePort();//创建管道
    //创建并发Isolate，并传入发送管道
    isolate = await Isolate.spawn(getMsg,receivePort.sendPort);
    // 监听管道消息
    receivePort.listen((data) {
        print('Data: $data');
        receivePort.close(); //关闭管道
        isolate?.kill(priority: Isolate.immediate); //杀死并发Isolate
        isolate = null;
    });
  }

  // 并发Isolate 往管道发送一个字符串
  getMsg(sendPort) => sendPort.send('hello');

  /**
   * 这这里需要注意的是，在Isolate中，发送管道是单向的：
   *  我们启动了一个Isolate执行某项任务，Isolate执行完毕后，发送消息告知我们。
   *  如果Isolate执行任务时，需要依赖主Isolate给它发送参数，执行完毕后再发送执行结果给主Isolate，
   *  这样双向通信的场景我们如何实现呢？
   *  答案也很简单，让并发Isolate也回传一个发送管道即可。
   */
// 并发计算阶乘
  Future <dynamic> asyncFcatoriali(n) async {
    //创建管道
    final response = ReceivePort();
    // 创建并发Isolate 并传入管道
    await Isolate.spawn(isolateFunc, response.sendPort);
    // 等待Isolate回传管道
    final sendPort = await response.first as SendPort;
    //  创建了另一个管道 answer
    final answer = ReceivePort();
    // 往Isolate回传的管道中发送参数，同时传入answer管道
    sendPort.send([n, answer.sendPort]);
    // 等待 Isolate通过answer管道回传执行结果
    return answer.first;
  }
// Isolate函数体 参数是主Isolate传入的管道
  void isolateFunc(initialReplyTo) async {
    // 创建管道
    final port = ReceivePort();
    // 往主Isolate回传管道
    initialReplyTo.send(port.sendPort);
    // 等待主Isolate发送消息 （参数和回传结果的管道）
    final message = await port.first as List;
    // 参数
    final data = message[0] as int;
    // 回传结果的管道
    final send = message[1] as SendPort;
    // 调用同步计算阶乘的函数回传结果
    send.send(syncFactorial(data));
  }
// 同步计算阶乘
int syncFactorial(n) => n < 2 ? n : n * syncFactorial(n - 1);

void _test6() async {
  // 等待并发计算阶乘结果
print(await asyncFcatoriali(4));
}

/**
 * 没错，确实太繁杂了。
 * 在Flutter中，像这样执行并发计算任务我们可以采用更简单的方式。
 * Flutter提供了支持并发计算的compute函数，其内部对Isolate的创建和双向通信进行了封装抽象，屏蔽了很多底层细节，
 * 我们在调用时只需要传入函数入口和函数参数，就能够实现并发计算和消息通知。
 */
void _test7() async {
  // print(await compute(syncFactorial,4));
}

/**
 * 总结
 * 
 * Dart是单线程的，但通过事件循环可以实现异步。
 * 而Future是异步任务的封装，借助于await与async，我们可以通过事件循环实现非阻塞的同步等待；
 * Isolate是Dart中的多线程，可以实现并发，有自己的事件循环与Queue，独占资源。
 * Isolate之间可以通过消息机制进行单向通信，这些传递的消息通过对方的时间循环驱动对方进行异步处理。
 * 
 * 在UI编程过程中，异步和多线程是两个相伴相生的名词，也是很容易混淆的概念。
 * 对于异步方法调用而言，代码不需要等待结果的返回，而是通过其他手段
 * （比如 通知，回调，事件循环或多线程）在后续的某个时刻主动（或被动）地接收执行结果。
 * 
 * 因此，从辩证关系上看，异步与多线程并不是一个同等关系：
 * 异步是目的，多线程只是我们实现异步的一个手段之一。
 * 
 * 而在flutter中，借助UI框架提供的事件循环，我们可以不用阻塞的同时等待多个异步任务，因此并不需要开多线程。 我们一定要记住这一点。
 */