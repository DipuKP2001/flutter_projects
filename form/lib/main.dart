import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget{
  /* MyApp({Key key}) : super(key: key); */
  @override
  MyAppState createState() => MyAppState();
}
class MyAppState extends State<MyApp>{
  final items = List<String>.generate(20, (index) => "Item $index");
  @override
  Widget build(BuildContext context){
    final _title = 'Dismissing items';
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: ListView.builder(
          itemBuilder: (context, index){
            final item = items[index];
            return Dismissible(
              key: Key(item), 
              onDismissed: (direction) {
                setState(() {
                  items.removeAt(index);
                });
                Scaffold.of(context).showSnackBar(SnackBar(content: Text('$item dismissed'),));
              },
              background: Container(color: Colors.red[300]),
              child: ListTile(title: Text('$item')),
            );
          },
        ),
      ),
    );
  }
}