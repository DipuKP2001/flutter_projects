import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _appTitle = 'spring';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      home: CardDragDemo(),
    );
  }
}
class CardDragDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DraggableCard(
        child: FlutterLogo(size: 128,)
      ),
    );
  }
}

class DraggableCard extends StatefulWidget{
  final Widget child;
  DraggableCard({this.child});
  @override 
  _DraggableCardState createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard>
with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Alignment _dragAlignment = Alignment.center;
  Animation<Alignment> _animation;
  void _runAnimation(Offset pixelsPerSecond, Size size) {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment.center,
      ),
    );
    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;
    const spring = SpringDescription(
      mass: 20,
      stiffness: 1,
      damping: 1,
    );
    final _simulation = SpringSimulation(spring, 0, 1, -unitVelocity);
    _controller.animateWith(_simulation);
  }
  @override 
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    super.initState();
    _controller.addListener(() {
      setState((){
        _dragAlignment = _animation.value;
      });
    });
  }
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  } 
  @override 
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onPanDown: (details){
        _controller.stop();
      },
      onPanUpdate: (details){
        setState(() {
          _dragAlignment += Alignment(
            details.delta.dx / (size.width / 2),
            details.delta.dy / (size.width / 2),
          );
        });
      },
      onPanEnd: (details){
        _runAnimation(details.velocity.pixelsPerSecond, size);
      },
      child: Align(
        alignment: _dragAlignment,
        child: Card(
          child: widget.child,
        )
     )
    );
  }
}