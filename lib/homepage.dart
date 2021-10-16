import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:HexColor("#109d58") ,
        title: Text("Hydro System"),
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
