import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'app_theme.dart';

import '../app/router.gr.dart';

class App extends StatefulWidget {
  _AppState createState() => new _AppState();
}

class _AppState extends State<App> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      theme: AppTheme.of(context).theme,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
