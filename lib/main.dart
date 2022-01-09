import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:starter/core/shared/themes.dart' as themes;
import 'package:stacked_themes/stacked_themes.dart';
import 'package:starter/app/app.locator.dart';
import 'package:starter/app/app.router.dart';
import 'package:starter/core/managers/core_manager.dart';
import 'package:starter/mixin/lock_phone.mixin.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await ThemeManager.initialise();

  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget with PortraitModeMixin {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return CoreManager(
      child: ThemeBuilder(
        defaultThemeMode: ThemeMode.light,
        lightTheme: themes.lightTheme,
        darkTheme: themes.darkTheme,
        builder: (
          context,
          regularTheme,
          darkTheme,
          themeMode,
        ) =>
            MaterialApp(
          title: dotenv.env['NAME'] ?? "Starter",
          theme: regularTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          navigatorKey: StackedService.navigatorKey,
          onGenerateRoute: StackedRouter().onGenerateRoute,
        ),
      ),
    );
  }
}
