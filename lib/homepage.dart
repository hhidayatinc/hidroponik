import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final databaseReference = FirebaseDatabase.instance.reference();
  bool isLoading = false;

  AnimationController progressController;
  Animation<num> tempAnimation;
  Animation<num> densityAnimation;
  Animation<num> pHAnimation;

  @override
  void initState() {
    super.initState();

    databaseReference
        .child('ESP32_Device')
        .once()
        .then((DataSnapshot snapshot) {
      num temp = snapshot.value['Suhu']['Data'];
      num pH = snapshot.value['pH']['Data'];
      num density = snapshot.value['Kepekatan']['Data'];

      isLoading = true;
      _dashboardInit(temp, density, pH);
    });
  }

  _dashboardInit(num temp, num density, num pH) {
    progressController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000)); //5s

    tempAnimation = Tween<num>(begin: 0, end: temp).animate(progressController)
      ..addListener(() {
        setState(() {});
      });

    densityAnimation =
        Tween<num>(begin: 0, end: density).animate(progressController)
          ..addListener(() {
            setState(() {});
          });

    pHAnimation = Tween<num>(begin: 0, end: pH).animate(progressController)
      ..addListener(() {
        setState(() {});
      });
    progressController.forward();
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
                      _showPh(),
                      SizedBox(width: 22),
                      _showDensity(),
                      SizedBox(width: 22),
                      _showTemp()
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    
  }

  void _showMaterialDialogpH() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Informasi pH'),
            content: Text('Nilai pH yang baik untuk tanaman hidroponik adalah 5,5-6,5'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close')),
              
            ],
          );
        });
  }

  void _showMaterialDialogNutrisi() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Informasi Nutrisi'),
            content: Text('Nilai nutrisi yang baik untuk selada peremajaan adalah 700 ppm'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close')),
              
            ],
          );
        });
  }
  void _showMaterialDialogSuhu() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Informasi Suhu'),
            content: Text('Nilai suhu yang baik untuk tanaman hidroponik adalah 25-26' +  " \u2103"),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close')),
              
            ],
          );
        });
  }

  getCurrentDate() {
    return DateFormat('EEE, dd MMM yyyy').format(DateTime.now());
  }

  getCurrentTime() {
    return DateFormat('kk:mm').format(DateTime.now());
  }

  readDataDensity() {
    final databaseReference = FirebaseDatabase.instance.reference();
    databaseReference.child("ESP32_Device").once().then(
      (DataSnapshot snapshot) {
        print('Kepekatan air: ${snapshot.value["Kepekatan"]["Data"]}');
      },
    );
  }

  readDataTemp() {
    final databaseReference = FirebaseDatabase.instance.reference();
    databaseReference.child("ESP32_Device").once().then(
      (DataSnapshot snapshot) {
        print('Suhu: ${snapshot.value["Suhu"]["Data"]}');
      },
    );
  }

  readDatapH() {
    final databaseReference = FirebaseDatabase.instance.reference();
    databaseReference.child("ESP32_Device").once().then(
      (DataSnapshot snapshot) {
        print('pH: ${snapshot.value["pH"]["Data"]}');
      },
    );
  }

  Widget _showPh() {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: InkWell(
        onTap: _showMaterialDialogpH,
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
                // readDatapH().toString(),
                '${pHAnimation.value.toInt()}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
      )
    );
  }

  Widget _showDensity() {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: InkWell(
        onTap: _showMaterialDialogNutrisi,
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
                // readDataDensity().toString(),
                '${densityAnimation.value.toInt()}' + ' ppm',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
      )
    );
  }

  Widget _showTemp() {
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
                // readDataTemp().toString(),
                '${tempAnimation.value.toInt()}' + " \u2103",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
      )
    );
  }
}
 

