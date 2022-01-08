import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:starter/core/shared/styles.dart';
import 'package:starter/views/startup/startup_viewmodel.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      disposeViewModel: false,
      onModelReady: (model) => model.handleMove(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Image.asset("assets/icon.png"),
        ),
        backgroundColor: kcBlackColor,
      ),
      viewModelBuilder: () => StartUpViewModel(),
    );
  }
}
