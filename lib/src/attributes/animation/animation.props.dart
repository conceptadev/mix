import 'package:flutter/material.dart';

class AnimationProps {
  final bool animated;
  final Duration animationDuration;
  final Curve animationCurve;

  const AnimationProps({
    required this.animationDuration,
    required this.animationCurve,
    required this.animated,
    Key? key,
  });
}
