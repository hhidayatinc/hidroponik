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
        elevation: 0,
        title: Text("Hydro"),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18),
            width: double.infinity,
            height: 280,
            decoration: BoxDecoration(
              color: HexColor("#109d58"),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(70),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getCurrentTime(),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  getCurrentDate(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/images/header.png',
                      width: 214,
                      height: 214,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 18, top: 310, right: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Plant Overview",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      height: 145,
                      width: 110,
                      decoration: BoxDecoration(
                        color: HexColor("#F8E752"),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "pH",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 18),
                            child: Image.asset(
                              'assets/images/ph.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              "7,3",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 22),
                    Container(
                      height: 145,
                      width: 110,
                      decoration: BoxDecoration(
                        color: HexColor("#F8E752"),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "pH",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 18),
                            child: Image.asset(
                              'assets/images/flask.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              "750 ppm",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 22),
                    Container(
                      height: 145,
                      width: 110,
                      decoration: BoxDecoration(
                        color: HexColor("#F8E752"),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Suhu",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 18),
                            child: Image.asset(
                              'assets/images/celsius.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              "25 \u2103",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
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
