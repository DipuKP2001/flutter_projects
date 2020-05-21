import 'package:flutter/material.dart';

void main() =>  runApp(MyApp());


class MyApp extends StatelessWidget{
  static const _title = "Flutter code sample";
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget{
  @override 
  _MyStatefulWidget createState() => _MyStatefulWidget();
}
class _MyStatefulWidget extends State<MyStatefulWidget>{
  bool selected = false;
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){
        setState(() {
          selected = !selected;
        });
      },
      child: Column(
        children: <Widget>[
          AnimatedContainer(
            width: selected ?  100:200 ,
            height: selected ?  200:100 ,
            color: selected ? Theme.of(context).primaryColor : Colors.blue[200],
            alignment: selected?Alignment.center:AlignmentDirectional.topCenter,
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            child: FlutterLogo(size: 76),
          ),
          AnimatedCrossFade(
            firstChild: const FlutterLogo(style: FlutterLogoStyle.horizontal, size: 100.0), 
            secondChild: const FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0), 
            crossFadeState: selected ? CrossFadeState.showFirst : CrossFadeState.showSecond, 
            duration: const Duration(milliseconds: 3),
          ),
        ],
      ),
    );
  }
}

