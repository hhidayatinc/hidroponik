import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#109d58"),
        title: Text("Hydro System"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              getCurrentTime(),
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            Text(
              getCurrentDate(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}

getCurrentDate() {
  return DateFormat('EEE, dd MMM yyyy').format(DateTime.now());
}

getCurrentTime() {
  return DateFormat('kk:mm').format(DateTime.now());
}
