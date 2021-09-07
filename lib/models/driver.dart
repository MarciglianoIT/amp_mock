import 'dart:convert';

class Driver {
  String driverName;
  String driverId;
  String currentBatteryId;

  Driver(
    this.driverName,
    this.driverId,
    this.currentBatteryId,
  );

  factory Driver.fromJson(dynamic json) {
    try {
      dynamic Data = jsonDecode(json);

      return Driver(
        Data['driverName'],
        Data['driverId'],
        Data['currentBattery'],
      );
    } catch (e) {
      print(e);
      return Driver("", "", "");
    }
  }
}
