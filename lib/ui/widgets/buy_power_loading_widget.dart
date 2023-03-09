import 'package:flutter/material.dart';

import 'dots_animated_widget.dart';

class BuyPowerLoadingWidget extends StatefulWidget {
  const BuyPowerLoadingWidget({super.key});

  @override
  State<BuyPowerLoadingWidget> createState() => _BuyPowerLoadingWidgetState();
}

class _BuyPowerLoadingWidgetState extends State<BuyPowerLoadingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    // keep the animation running forever
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DotsAnimatedWidget(listener: controller);
  }
}
