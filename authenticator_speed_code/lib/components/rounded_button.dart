import 'package:flutter/material.dart';


class RoundedButton extends StatelessWidget {
  final Color color,textColor;
  final Function press;
  final String text;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: size.width * 0.2),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          color: color,
          padding: EdgeInsets.symmetric(vertical:20, horizontal:40),
          onPressed: press,
          child: Text(text, style: TextStyle(color: textColor),),
        ),
      ),
    );
  }
}