import 'package:auto_route/auto_route_annotations.dart';
import '../src/pages/start_page/start_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: StartPage, initial: true),
  ],
)
class $AppRouter {}
