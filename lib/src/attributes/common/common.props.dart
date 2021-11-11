import 'package:flutter/material.dart';

class CommonProps {
  final bool animated;
  final Duration animationDuration;
  final Curve animationCurve;
  final bool hidden;

  const CommonProps({
    required this.animationDuration,
    required this.animationCurve,
    required this.animated,
    required this.hidden,
  });
}
