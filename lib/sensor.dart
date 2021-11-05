import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';

class Sensor{
   Float suhu, kepekatan;
   int pH;

   Sensor({this.suhu, this.kepekatan});

   Sensor.fromSnapshot(DataSnapshot snapshot) :
   
    suhu = snapshot.value["Suhu"],
    kepekatan = snapshot.value["Kepekatan air"];
    //pH = snapshot.value["pH"];

  toJson() {
    return {
      "Suhu": suhu,
      "Kepekatan air": kepekatan,
      //"pH": pH,
    };
  }
  //  Sensor.fromJson(Map<dynamic, dynamic> json){
  //    this.suhu = json['Suhu'];
  //  }
    

// Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
//       'Suhu' : suhu.toString(),
//     };

  //  Sensor.fromSnapshot(DataSnapshot snapshot) :
  //  suhu = snapshot.value["Suhu"];
   
  //  toJson(){
  //    return {
  //      "Suhu" : suhu 
  //    };
  //  }
}