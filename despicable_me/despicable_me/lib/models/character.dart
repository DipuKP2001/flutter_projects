import 'package:flutter/material.dart';

class Character{
  final String name;
  final String imagePath;
  final String description;
  final List<Color> colors;

  Character({this.name, this.imagePath, this.description, this.colors});
}

List characters = [
  Character(
    name: "Kevin",
    imagePath: "assets/images/Kevin_minions.png",
    description:  "Kevin is one of the most famous minions of all the time and throughout the movie he plays a very vital role and is very nice to watch his foolishness and see his fellow minions making Gru running into trouble.",
    colors: [Colors.orange, Colors.deepOrange],
  ),
  Character(
    name: "Agnes",
    imagePath: "assets/images/Agnes_gru.png",
    description:  "Agnes is the most youngest as well as the cutest character in this film and her main ambition is to have a unicorn as her pet and she seems always  very loyal and adorable child and all she needs is a good parent like Gru and it is she who makes Gru a better father of the three childrens.",
    colors: [Colors.pink, Colors.redAccent],
  ),
];