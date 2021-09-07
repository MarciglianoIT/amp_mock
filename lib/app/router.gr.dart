// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../models/driver.dart' as _i6;
import '../src/pages/scan_page/scan_page.dart' as _i5;
import '../src/pages/start_page/start_page.dart' as _i3;
import '../src/pages/swap_start/swap_start_page.dart' as _i4;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    StartPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.StartPage();
        }),
    SwapStartRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<SwapStartRouteArgs>();
          return _i4.SwapStart(key: args.key, driver: args.driver);
        }),
    ScanPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ScanPageRouteArgs>();
          return _i5.ScanPage(args.description);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(StartPageRoute.name, path: '/'),
        _i1.RouteConfig(SwapStartRoute.name, path: '/swap-start'),
        _i1.RouteConfig(ScanPageRoute.name, path: '/scan-page')
      ];
}

class StartPageRoute extends _i1.PageRouteInfo {
  const StartPageRoute() : super(name, path: '/');

  static const String name = 'StartPageRoute';
}

class SwapStartRoute extends _i1.PageRouteInfo<SwapStartRouteArgs> {
  SwapStartRoute({_i2.Key? key, required _i6.Driver driver})
      : super(name,
            path: '/swap-start',
            args: SwapStartRouteArgs(key: key, driver: driver));

  static const String name = 'SwapStartRoute';
}

class SwapStartRouteArgs {
  const SwapStartRouteArgs({this.key, required this.driver});

  final _i2.Key? key;

  final _i6.Driver driver;
}

class ScanPageRoute extends _i1.PageRouteInfo<ScanPageRouteArgs> {
  ScanPageRoute({required String description})
      : super(name,
            path: '/scan-page',
            args: ScanPageRouteArgs(description: description));

  static const String name = 'ScanPageRoute';
}

class ScanPageRouteArgs {
  const ScanPageRouteArgs({required this.description});

  final String description;
}
