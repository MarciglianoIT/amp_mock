import 'package:ampersand_app/src/pages/swap_start/swap_start_page.dart';
import 'package:auto_route/auto_route.dart';
import '../src/pages/start_page/start_page.dart';
import '../src/pages/scan_page/scan_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: StartPage, initial: true),
    MaterialRoute(page: SwapStart),
    MaterialRoute(page: ScanPage),
  ],
)
class $AppRouter {}
