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
    final shared = mixContext.sharedAttribute;

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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SharedMixer &&
        other.visible == visible &&
        other.animated == animated &&
        other.animationDuration == animationDuration &&
        other.animationCurve == animationCurve &&
        other.textDirection == textDirection;
  }

  @override
  int get hashCode {
    return visible.hashCode ^
        animated.hashCode ^
        animationDuration.hashCode ^
        animationCurve.hashCode ^
        textDirection.hashCode;
  }
}
