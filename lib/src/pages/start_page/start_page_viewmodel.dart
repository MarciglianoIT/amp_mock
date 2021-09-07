import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../scan_page/scan_page.dart';

class StartPageViewModel extends BaseViewModel {
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  startSwap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ScanPage("Scan QR Code of the driver")),
    );
  }
}
