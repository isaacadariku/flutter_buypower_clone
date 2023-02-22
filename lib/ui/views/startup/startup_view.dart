import 'package:buypower_clone/gen/assets.gen.dart';
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
          Positioned.fill(
            child: Assets.images.africa.image(
              fit: BoxFit.fitHeight
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Assets.images.logo.image(),
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
