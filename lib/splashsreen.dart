import 'package:flutter/material.dart';
import 'package:hidroponik/homescreen.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:hexcolor/hexcolor.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 70),
      child: SplashScreen(
        backgroundColor: Colors.white,
        seconds: 5,
        navigateAfterSeconds: HomeScreen(),
        image: Image.asset('assets/images/Logo2.png'),
        title: Text(
          "Sistem Monitoring Hidroponik",
          style: TextStyle(
            fontSize: 18,
            color: HexColor("#96BB7C"),
          ),
        ),
        useLoader: true,
        loaderColor: HexColor("#96BB7C"),
        photoSize: 140,
      ),
    );
  }
}
