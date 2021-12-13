import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

import 'sensor.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  DatabaseReference _sensorRef =
      FirebaseDatabase.instance.reference().child('ESP32_Device');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#C4DF9C"),
        elevation: 0,
        title: Text(
          "Hydro",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18),
              width: double.infinity,
              height: 280,
              decoration: BoxDecoration(
                color: HexColor("#C4DF9C"),
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
                      color: Colors.black,
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
                      color: Colors.black,
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
              child: StreamBuilder(
                stream: _sensorRef.onValue,
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      !snapshot.hasError &&
                      snapshot.data.snapshot.value != null) {
                    var _kepekatan = Sensor.fromJson(
                        snapshot.data.snapshot.value['Kepekatan']);
                    print("DHT: ${_kepekatan.kepekatan}");
                    var _suhu =
                        Sensor.fromJson(snapshot.data.snapshot.value['Suhu']);
                    print("DHT: ${_suhu.suhu}");
                    var _pH =
                        Sensor.fromJson(snapshot.data.snapshot.value['pH']);
                    print("DHT: ${_pH.pH}");
                    return Column(
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
                            _showPh(_pH),
                            SizedBox(width: 22),
                            _showKepekatan(_kepekatan),
                            SizedBox(width: 22),
                            _showSuhu(_suhu)
                          ],
                        )
                      ],
                    );
                  } else {
                    return Center(
                      child: Text("NO DATA YET"),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  getCurrentDate() {
    return DateFormat('EEE, dd MMM yyyy').format(DateTime.now());
  }

  getCurrentTime() {
    return DateFormat('kk:mm').format(DateTime.now());
  }

  Widget _showKepekatan(Sensor _sensor) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: InkWell(
        onTap: _showMaterialDialogKepekatan,
        child: Container(
          height: 160,
          decoration: BoxDecoration(
            color: HexColor("#F8E752"),
            borderRadius: BorderRadius.circular(15),
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
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  "Nutrisi",
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
                  '${_sensor.kepekatan.toStringAsFixed(0)}' + ' ppm',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showSuhu(Sensor _sensor) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: InkWell(
        onTap: _showMaterialDialogSuhu,
        child: Container(
          height: 160,
          decoration: BoxDecoration(
            color: HexColor("#F8E752"),
            borderRadius: BorderRadius.circular(15),
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
                padding: EdgeInsets.only(top: 15),
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
                  '${_sensor.suhu.toStringAsFixed(2)}' + " \u2103",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showPh(Sensor _sensor) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: InkWell(
        onTap: () {
          if (_sensor.pH.toInt() >= 5.5 && _sensor.pH.toInt() <= 6.5) {
            _showpHnormal();
          } else if (_sensor.pH.toInt() > 6.5) {
            _showpHbasa();
          } else {
            _showpHasam();
          }
        },
        child: Container(
          height: 160,
          decoration: BoxDecoration(
            color: HexColor("#F8E752"),
            borderRadius: BorderRadius.circular(15),
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
                padding: EdgeInsets.only(top: 15),
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
                  '${_sensor.pH.toStringAsFixed(1)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMaterialDialogKepekatan() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Informasi Dosis Larutan Nutrisi'),
          content: Text('Selada berumur 1-7 hari: 500 ppm' +
              ' Selada berumur 8-14 hari: 700 ppm' +
              ' Selada berumur 15-21 hari: 900 ppm' +
              ' Selada berumur >= 22 hari: 900 ppm'),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close')),
          ],
        );
      },
    );
  }

  void _showMaterialDialogSuhu() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Informasi Suhu'),
          content: Text(
              'Nilai suhu yang baik untuk tanaman hidroponik adalah 25-26' +
                  " \u2103"),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close')),
          ],
        );
      },
    );
  }

  _showpHnormal() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Informasi pH'),
          content: Text('Nilai pH normal!'),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close')),
          ],
        );
      },
    );
  }

  _showpHasam() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Informasi pH'),
          content: Text(
              'Nilai pH terlalu asam! Nilai pH yang baik berkisar antara 5.5-6.5'),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close')),
          ],
        );
      },
    );
  }

  _showpHbasa() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Informasi pH'),
          content: Text(
              'Nilai pH tidak normal! Tambahkan asam nitrat untuk menurunkan kadar pH'),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close')),
          ],
        );
      },
    );
  }
}
