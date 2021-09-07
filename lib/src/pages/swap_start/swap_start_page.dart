import 'package:ampersand_app/models/driver.dart';
import 'package:ampersand_app/src/widgets/driver_profile.dart';
import 'package:ampersand_app/src/widgets/qr_code_scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as stacked;

import 'swap_start_page_viewmodel.dart';

class SwapStart extends StatelessWidget {
  final Driver driver;
  SwapStart({Key? key, required this.driver}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return stacked.ViewModelBuilder<SwapStartPageModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
            key: model.key,
            appBar: AppBar(
              title: Text("Ampersand"),
            ),
            body: model.scan == false
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        DriverProfile(
                          model.driver.driverName,
                          model.driver.driverId,
                          model.driver.currentBatteryId,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            model.openScanPage();
                          },
                          child: Text("Verify Battery"),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        !model.batteryStatus
                            ? Text("Not verified")
                            : Column(
                                children: [
                                  Text(
                                      "verified Battery: ${model.driver.currentBatteryId} :"),
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    controller: model.usedVoltage,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      model.calculateUsage(
                                          model.usedVoltage.text);
                                    },
                                    child: Text("Calculate Usage"),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text("Used Battery Statistics:"),
                                  Text(
                                      "Battery Status: ${(model.p * 100).toStringAsFixed(0)} %"),
                                  Text(
                                      "Price: ${(model.price).toStringAsFixed(0)} RWF"),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      model.scanNewBattery();
                                    },
                                    child: Text("Enter new Battery"),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text("New Battery Id: ${model.newBattery}"),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text("Enter news Battery starting Voltage"),
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    controller: model.newVoltage,
                                  ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      model.registerNewBattery(
                                          context, model.newVoltage.text);
                                    },
                                    child: Text("Confirm and Save"),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  )
                : QrCodeScanner(
                    "Scan the Battery",
                    model.qrKey,
                    model.scanNew == false
                        ? model.verifyBattery
                        : model.enterNewBattery,
                  ));
      },
      viewModelBuilder: () => SwapStartPageModel(driver),
      onModelReady: (model) => model.initialize(driver),
      fireOnModelReadyOnce: false,
    );
  }
}
