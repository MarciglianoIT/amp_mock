import 'dart:io';
import 'package:ampersand_app/app/locator.dart';
import 'package:ampersand_app/src/pages/swap_start/swap_start_page.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../models/driver.dart';

class ScanPageViewModel extends BaseViewModel {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  final _snackBarService = locator<SnackbarService>();

  String description;
  ScanPageViewModel(this.description);

  QRViewController? controller;

  initialize() {
    try {
      if (Platform.isAndroid) {
        controller!.pauseCamera();
      } else if (Platform.isIOS) {
        controller!.resumeCamera();
      }
    } catch (e) {}
  }

  void onQRViewCreated(BuildContext context, QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((Barcode scanData) {
      if (scanData.format == BarcodeFormat.qrcode) {
        if (!isBusy) {
          setBusy(true);
          try {
            Driver scannedDriver = Driver.fromJson(scanData.code);
            if (_barCodeContainsDriverData(scannedDriver) == true) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SwapStart(driver: scannedDriver)),
              );
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

  bool _barCodeContainsDriverData(Driver scannedDriver) {
    return scannedDriver.driverName.isNotEmpty &&
        scannedDriver.driverName.isNotEmpty &&
        scannedDriver.currentBatteryId.isNotEmpty;
  }

  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
