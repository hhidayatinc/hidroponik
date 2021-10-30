import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';

class Sensor{
   Float suhu;

   Sensor({this.suhu});

   Sensor.fromJson(Map<dynamic, dynamic> json){
     this.suhu = json['Suhu'];
   }
    

Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
      'Suhu' : suhu.toString(),
    };

  //  Sensor.fromSnapshot(DataSnapshot snapshot) :
  //  suhu = snapshot.value["Suhu"];
   
  //  toJson(){
  //    return {
  //      "Suhu" : suhu 
  //    };
  //  }
}