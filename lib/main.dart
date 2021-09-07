import 'package:ampersand_app/app/router.gr.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import './src/app.dart';
import 'app/locator.dart';

void main() {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (_) => runApp(App()),
  );
}
