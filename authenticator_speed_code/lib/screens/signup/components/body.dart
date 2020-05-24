import 'package:authenticator_speed_code/screens/signup/components/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "SIGN UP",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
          SvgPicture.asset(
            "assets/icons/signup.svg",
            height: size.height * 0.4,
          ),
        ],
      ),
    );
  }
}

