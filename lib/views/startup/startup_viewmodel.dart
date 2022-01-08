import 'dart:async';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:starter/app/app.locator.dart';
import 'package:starter/app/app.logger.dart';
import 'package:starter/app/app.router.dart';

class StartUpViewModel extends BaseViewModel {
  final log = getLogger('StartUpViewModel');
  final _navigationService = locator<NavigationService>();

  Future<void> init() async {
    return _navigationService.navigateTo(Routes.homeView);
  }

  /// Here you can set startup delay Shoudn't exceed more than [3 sec]
  Future handleMove() async {
    Duration duration = const Duration(milliseconds: 3500);
    return Timer(duration, init);
  }
}
