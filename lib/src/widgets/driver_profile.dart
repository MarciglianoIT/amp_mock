import 'package:flutter/material.dart';

import '../app_theme.dart';

class DriverProfile extends StatelessWidget {
  final String driverName;
  final String driverId;
  final String currentBatteryId;

  DriverProfile(this.driverName, this.driverId, this.currentBatteryId);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Scaned Drivers Profile: ",
            style: AppTheme.of(context).headerStyle,
          ),
          Text("Drivers Name: ${driverName}"),
          Text("Drivers Id: ${driverId}"),
          Text("Current Battery: ${currentBatteryId}"),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
