import 'package:flutter/material.dart';

class AppTheme {
  BuildContext context;

  final ThemeData theme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color.fromRGBO(111, 111, 123, 1),
    accentColor: Color.fromRGBO(42, 117, 188, 1),
    backgroundColor: Color.fromRGBO(28, 27, 27, 1),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      },
    ),
  );

  Color get colorBottom => Color(0xFFafd6f7);

  Color get colorTop => Color(0xFFdcedfc);

  Color get appCardBackground => Colors.white;

  Color get appBarIconColor => Colors.black87;

  Color get bottomAppBarIconColor => Colors.black87;

  double get width => MediaQuery.of(context).size.width;

  double get height =>
      MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

  double get iconSize => 32.0;

  double get bottomHeight => height * 0.15;

  double get playIconSize => 36.0;

  double get lotteryChildAspectRatio => width / (height / 1.8);

  TextStyle headerStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  TextStyle textStyle = TextStyle(
    color: Colors.black,
    fontSize: 16,
  );

  TextStyle messageStyle = TextStyle(
    color: Colors.black87,
    fontSize: 28,
  );

  final topBarActionPadding = const EdgeInsets.only(right: 35.0);
  final bottomBarIconPadding = const EdgeInsets.symmetric(horizontal: 5.0);

  Widget loading = const Center(
    child: CircularProgressIndicator(),
  );

  AppTheme({
    required this.context,
  });

  static AppTheme of(BuildContext context) {
    return new AppTheme(context: context);
  }
}
