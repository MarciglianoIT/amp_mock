import 'dart:convert';

import 'package:ampersand_app/models/batteryType.dart';

class Battery {
  String batteryId;

  Battery(this.batteryId);

  factory Battery.fromJson(dynamic json) {
    dynamic Data = jsonDecode(json);

    return Battery(
      Data['batteryId'] as String,
    );
  }
}
