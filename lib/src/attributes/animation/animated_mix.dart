import 'package:flutter/material.dart';

import '../../../mix.dart';

mixin AnimatedMix<T> on Attribute<T> {
  Duration? animationDuration;
  Curve? animationCurve;
  VoidCallback? onEnd;

  bool get hasAnimation => animationDuration != null;

  Attribute<T> animated([
    Duration duration = const Duration(milliseconds: 100),
    Curve curve = Curves.linear,
    VoidCallback? onEnd,
  ]) {
    animationDuration = duration;
    animationCurve = curve;
    this.onEnd = onEnd;
    return this;
  }
}
