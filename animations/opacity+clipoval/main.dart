import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _appTitle = 'opacity demo';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      home: MyHomePage(title: _appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 700),
          opacity: _visible ? 1.0 : 0.5,
          child: ClipOval(
            child: Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: 'Toggle opacity',
        child: Icon(Icons.flip),
      ),
    );
  }
}
