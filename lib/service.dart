import 'package:firebase_database/firebase_database.dart';
import 'package:hidroponik/sensor.dart';

class Service{
  static Future<List<Sensor>> getSensors() async {
    Query sensorsSenapshot = await FirebaseDatabase.instance
    .reference()
    .child("hidroponik-3865f-default-rtdb");

    print(sensorsSenapshot);

    List<Sensor> sensors;

    
  }
}