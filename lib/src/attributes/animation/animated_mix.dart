import 'package:flutter/material.dart';

import '../../../mix.dart';

mixin AnimatedMix<T> on Attribute<T> {
  Duration? animationDuration;
  Curve? animationCurve;

  bool get hasAnimation => animationDuration != null;

  Attribute<T> animated([
    Duration duration = const Duration(milliseconds: 1600),
    Curve curve = Curves.linear,
  ]) {
    animationDuration = duration;
    animationCurve = curve;
    return this;
  }
}
