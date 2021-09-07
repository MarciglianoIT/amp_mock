import 'package:ampersand_app/app/router.dart';
import 'package:ampersand_app/app/router.gr.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

@module
abstract class ThirdPartyServicesModule {
  @lazySingleton
  NavigationService get navigationService;
  @lazySingleton
  AppRouter get appRouter;
  @lazySingleton
  SnackbarService get snackbarService;
  @lazySingleton
  DialogService get dialogService;
}
