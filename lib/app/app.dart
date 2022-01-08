import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:starter/services/shared_preferences_service.dart';
import 'package:starter/views/home/home_view.dart';
import 'package:starter/views/startup/startup_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartUpView, initial: true),
    MaterialRoute(page: HomeView),
  ],
  dependencies: [
    // ?lazySingletons
    // stacked
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),

// Dependencies

    // Presolve functions
    Presolve(
      classType: SharedPreferencesService,
      presolveUsing: SharedPreferencesService.getInstance,
    ),
  ],
  //  logger
  logger: StackedLogger(),
)
class AppSetup {}
