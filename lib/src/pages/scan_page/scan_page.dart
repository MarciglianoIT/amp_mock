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
          body: Column(
            children: [
              Expanded(
                flex: 5,
                child: QRView(
                  key: model.qrKey,
                  onQRViewCreated: (controller) =>
                      model.onQRViewCreated(context, controller),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(model.description),
                ),
              )
            ],
          ),
        );
      },
      viewModelBuilder: () => ScanPageViewModel(description),
      onModelReady: (model) => model.initialize(),
      fireOnModelReadyOnce: false,
    );
  }
}
