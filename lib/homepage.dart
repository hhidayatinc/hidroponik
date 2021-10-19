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
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            Text(
              getCurrentDate(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, left: 7),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 195,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: 195,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, left: 85),
              child: Container(
                height: 195,
                width: 140,
                decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
              ),
            )
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
