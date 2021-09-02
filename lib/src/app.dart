import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import '../app/locator.dart';
import '../app/router.gr.dart' as r;

import './app_theme.dart';

class App extends StatefulWidget {
  _AppState createState() => new _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: locator<NavigationService>().navigatorKey,
      initialRoute: r.Routes.startPage,
      onGenerateRoute: r.Router().onGenerateRoute,
      theme: AppTheme.of(context).theme,
    );
  }
}
