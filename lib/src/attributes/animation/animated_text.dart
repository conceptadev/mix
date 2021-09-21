import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix/src/attributes/animation/animated_mix.dart';

import '../base_attribute.dart';

class AnimatedTextUtility {
  const AnimatedTextUtility();
  AnimatedTextAttribute call({
    Duration duration = const Duration(milliseconds: 100),
    Curve curve = Curves.linear,
    VoidCallback? onEnd,
  }) =>
      AnimatedTextAttribute(
        duration: duration,
        curve: curve,
        onEnd: onEnd,
      );
}

class AnimatedTextAttribute extends TextMixAttribute with AnimatedMix {
  AnimatedTextAttribute({
    Duration duration = const Duration(milliseconds: 100),
    Curve curve = Curves.linear,
    VoidCallback? onEnd,
  }) {
    animated(duration, curve, onEnd);
  }

  @override
  bool get value => true;
}
