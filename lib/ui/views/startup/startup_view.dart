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
    var _deviceHeight = MediaQuery.of(context).size.height;
    var _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: _deviceWidth,
            height: _deviceHeight,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/africa.png"), fit: BoxFit.fitHeight),
                color: Colors.white),
            child: Center(
              child: Image.asset("assets/images/full_logo.png"),
            ),
          ),
          Positioned(top: _deviceHeight / 1.7, child: const CircularProgressIndicator.adaptive()),
        ],
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) =>
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
