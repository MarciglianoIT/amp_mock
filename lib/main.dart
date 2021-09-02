import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'src/services/firebase_service.dart';
import './src/app.dart';
import 'app/locator.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await locator<FirebaseService>().initializeApp();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (_) => runApp(App()),
  );
}
