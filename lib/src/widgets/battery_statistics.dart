import 'package:flutter/material.dart';

class BatterStatistic extends StatelessWidget {
  final double power;
  final double price;

  BatterStatistic(this.power, this.price);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.0),
        Text("Used Battery Statistics:"),
        Text("Battery Status: ${(power * 100).toStringAsFixed(0)} %"),
        Text("Price: ${(price).toStringAsFixed(0)} RWF"),
        SizedBox(height: 20.0),
      ],
    );
  }
}
