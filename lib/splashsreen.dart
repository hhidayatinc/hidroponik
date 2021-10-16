import 'package:flutter/material.dart';
import 'package:hidroponik/homepage.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:hexcolor/hexcolor.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
     child: SplashScreen(
       backgroundColor: HexColor("#109d58"),
        seconds: 5,
      navigateAfterSeconds: HomePage(),
      title: new Text("Hydro System", 
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
      useLoader: false,
      //image: Image.asset('img/hello1.png'),
      photoSize: 180,
     ),
     
    );
  }

}