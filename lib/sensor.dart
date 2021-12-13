class Sensor {
  final double kepekatan;
  final double suhu;
  final double pH;

  Sensor({this.kepekatan, this.suhu, this.pH});
  factory Sensor.fromJson(Map<dynamic, dynamic> json) {
    double parser(dynamic source) {
      try {
        return double.parse(source.toString());
      } on FormatException {
        return -1;
      }
    }

    return Sensor(
      kepekatan: parser(json['Data']),
      suhu: parser(json['Data']),
      pH: parser(json['Data']),
    );
  }
}
