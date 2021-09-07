import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScanner extends StatelessWidget {
  final String description;
  final GlobalKey qrKey;
  final onQRViewCreated;

  QrCodeScanner(
    this.description,
    this.qrKey,
    this.onQRViewCreated,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: QRView(
            key: this.qrKey,
            onQRViewCreated: onQRViewCreated,
          ),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: Text(description),
          ),
        )
      ],
    );
  }
}
