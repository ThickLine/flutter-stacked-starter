import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:starter/views/home/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => const Scaffold(
        body: Center(
          child: Text("Home"),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
