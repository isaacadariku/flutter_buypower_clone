import 'dart:math';

import 'package:flutter/material.dart';

import 'dots_painter.dart';

// Animated widget where our animation concerns lie
class DotsAnimatedWidget extends AnimatedWidget {
  const DotsAnimatedWidget({
    super.key,
    required Animation<double> listener,
  }) : super(listenable: listener);

  // how we get the animation object from our super class
  Animation<double> get listener => listenable as Animation<double>;

  // rotation animation, it goes from 0 degrees to 360 degrees
  Animation<double> get rotateAnimation {
    return Tween<double>(begin: 0, end: 2 * pi).animate(
      CurvedAnimation(
        parent: listener,
        curve: Curves.linear,
      ),
    );
  }

  // for scheduling the animation change of the big circle
  Animation<double> get bigCircleAnimation {
    /// for this animation, the weights are 7, 2 and 0.5, they equate to 9.5
    /// This means that if the animation was running for 1 second
    /// for 0.737(7/9.5) seconds, the first tweensequence would run, for the next
    /// 0.211(2/9.5) seconds the second tweensequence would start and complete in that
    /// time, then the last would finish in the remaining 0.053(0.5/9.5) seconds
    ///
    /// moving from a constant tween to the main animation of 20->4 before another
    /// 4->20 is just for fluidity of the animation, usually the main animation
    /// 20->4 ran using Interval(0.8,1) would do but it won't be as fluid
    return TweenSequence<double>([
      TweenSequenceItem(
        tween: ConstantTween<double>(20),
        weight:
            7, // weights work like flex in flexible widgets but for duration in animation flow
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 20,
          end: 4,
        ).chain(CurveTween(curve: Curves.bounceIn)),
        weight: 2,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 4,
          end: 20,
        ).chain(CurveTween(curve: Curves.ease)),
        weight: 0.5,
      ),
    ]).animate(listener);
  }

  Animation<double> get dotsRadiusAnimation {
    return TweenSequence<double>([
      TweenSequenceItem(
        tween: ConstantTween<double>(3),
        weight: 7,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 3,
          end: 10,
        ).chain(CurveTween(curve: Curves.bounceIn)),
        weight: 2,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 10,
          end: 3,
        ).chain(CurveTween(curve: Curves.ease)),
        weight: 0.5,
      ),
    ]).animate(listener);
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotateAnimation.value,
      child: CustomPaint(
        painter: DotsPainter(
          circleRadius: bigCircleAnimation.value,
          dotsRadius: dotsRadiusAnimation.value,
        ),
        size: const Size(200, 200),
      ),
    );
  }
}
