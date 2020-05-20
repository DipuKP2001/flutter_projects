import 'package:flutter/material.dart';

void main() =>  runApp(MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Flutter code sample",
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget{
  @override 
  _MyStatefulWidget createState() => _MyStatefulWidget();
}
class _MyStatefulWidget extends State<MyStatefulWidget> with TickerProviderStateMixin{
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    return AnimatedBuilder(
      animation: _controller, 
      child: Container(
        width: 200,
        height: 200,
        color: Colors.lightBlue,
        child: const Center(
          child: Text("Whoo"),
        ),
      ),
      builder: (BuildContext context, Widget child){
        return Transform.rotate(
          angle: _controller.value * 2.0 * 3.14,
          child: child,
        );
      },
    );
  }
}

