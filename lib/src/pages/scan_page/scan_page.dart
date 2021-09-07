import 'package:ampersand_app/src/widgets/qr_code_scanner.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as stacked;
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'scan_page_viewmodel.dart';

class ScanPage extends StatelessWidget {
  final String description;
  ScanPage(this.description);

  @override
  Widget build(BuildContext context) {
    return stacked.ViewModelBuilder<ScanPageViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          key: model.key,
          appBar: AppBar(
            title: Text("Ampersand"),
          ),
          body: QrCodeScanner(model.description, model.qrKey,
              (controller) => model.onQRViewCreated(context, controller)),
        );
      },
      viewModelBuilder: () => ScanPageViewModel(description),
      onModelReady: (model) => model.initialize(),
      fireOnModelReadyOnce: false,
    );
  }
}
