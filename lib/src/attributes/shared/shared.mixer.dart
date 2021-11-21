import 'package:flutter/material.dart';
import 'package:mix/src/mixer/mixer.dart';

class SharedMixer {
  final bool visible;
  //Animation
  final bool animated;
  final Duration animationDuration;
  final Curve animationCurve;
  final TextDirection? textDirection;

  const SharedMixer({
    required this.visible,
    required this.animated,
    required this.animationDuration,
    required this.animationCurve,
    this.textDirection,
  });

  factory SharedMixer.fromContext(MixContext mixContext) {
    final shared = mixContext.mix.sharedAttribute;
    return SharedMixer(
      visible: shared?.visible ?? true,
      animated: shared?.animated ?? false,
      animationDuration: shared?.animationDuration ??
          const Duration(
            milliseconds: 100,
          ),
      animationCurve: shared?.animationCurve ?? Curves.linear,
      textDirection: shared?.textDirection,
    );
  }
}
