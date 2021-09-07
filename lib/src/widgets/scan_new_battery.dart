import 'package:flutter/material.dart';

class ScanNewBattery extends StatelessWidget {
  final String newBattery;
  final Function scanNewBattery;

  const ScanNewBattery(this.newBattery, this.scanNewBattery, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => scanNewBattery(),
          child: Text("Enter new Battery"),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text("New Battery Id: ${newBattery}"),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
