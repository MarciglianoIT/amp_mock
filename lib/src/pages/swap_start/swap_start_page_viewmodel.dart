import 'package:ampersand_app/app/locator.dart';
import 'package:ampersand_app/constants/constants.dart';
import 'package:ampersand_app/models/battery.dart';
import 'package:ampersand_app/src/pages/start_page/start_page.dart';
import 'package:ampersand_app/status/status.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../models/driver.dart';

class SwapStartPageModel extends BaseViewModel {
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final _snackBarService = locator<SnackbarService>();

  TextEditingController usedVoltage = new TextEditingController();
  TextEditingController newVoltage = new TextEditingController();

  QRViewController? controller;

  Driver driver;
  bool scan = false;
  bool scanNew = false;
  bool batteryStatus = false;

  double p = 0;
  double usedAh = 0;
  double usedWh = 0;
  double price = 0;

  String newBattery = '';

  status state = status.start;

  SwapStartPageModel(
    this.driver,
  );

  openScanPage() {
    this.scan = true;
    notifyListeners();
  }

  scanNewBattery() {
    this.scanNew = true;
    this.scan = true;
    notifyListeners();
  }

  initialize(Driver _driver) {
    setBusy(true);
    driver = _driver;
    setBusy(false);
  }

  verifyBattery(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((Barcode scanData) {
      if (scanData.format == BarcodeFormat.qrcode) {
        if (!isBusy) {
          setBusy(true);
          try {
            Battery scannedBattery = Battery.fromJson(scanData.code);
            if (_barCodeContainsBatteryData(scannedBattery) == true) {
              this.scan = false;
              this.batteryStatus =
                  scannedBattery.batteryId == driver.currentBatteryId;
              notifyListeners();
              setBusy(false);
            } else {
              _snackBarService.showSnackbar(message: "Wrong Code");
              setBusy(false);
            }
          } catch (e) {
            _snackBarService.showSnackbar(message: "Corrupt Code");
            setBusy(false);
          }
        }
      }
    });
  }

  enterNewBattery(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((Barcode scanData) {
      if (scanData.format == BarcodeFormat.qrcode) {
        if (!isBusy) {
          setBusy(true);
          try {
            Battery scannedBattery = Battery.fromJson(scanData.code);
            if (_barCodeContainsBatteryData(scannedBattery) == true) {
              this.newBattery = scannedBattery.batteryId;
              this.scanNew = false;
              this.scan = false;
              notifyListeners();
              setBusy(false);
            } else {
              _snackBarService.showSnackbar(message: "Wrong Code");
              setBusy(false);
            }
          } catch (e) {
            _snackBarService.showSnackbar(message: "Corrupt Code");
            setBusy(false);
          }
        }
      }
    });
  }

  bool _barCodeContainsBatteryData(Battery scannedBattery) {
    return scannedBattery.batteryId.isNotEmpty;
  }

  //The calulate Usage function is not completed:
  //There is a high risk as there is no validation for the entered Value
  //Solution would be to implement a validator with the following factors:
  //Is the entered value above or below the max Values of 12 - 12.72
  void calculateUsage(String _meterVoltage) {
    double _m = double.parse(_meterVoltage);

    double _p = 1 - ((NOMINAL_VOLTAGE - _m) / BATTERY_FACTOR);
    double _usedAh = BATTERY_AH * (1 - p);
    double _usedWh = _usedAh * 12;
    double _price = _usedWh * 0.882;

    this.p = _p;
    this.usedAh = _usedAh;
    this.usedWh = _usedWh;
    this.price = _price;

    notifyListeners();
  }

  void registerNewBattery(BuildContext context, String _meterVoltage) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StartPage()),
    );
  }
}
