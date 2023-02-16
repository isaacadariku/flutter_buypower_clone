import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          const Positioned.fill(
            child: Image(
                image: AssetImage("assets/images/africa.png"),
                fit: BoxFit.fitHeight),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset("assets/images/logo.png"),
          ),
          const Align(
            alignment: Alignment(0.0, 0.3),
            child: CircularProgressIndicator.adaptive(),
          ),
        ],
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(BuildContext context) => StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
