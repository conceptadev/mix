import 'package:flutter/widgets.dart';

import 'animation.attribute.dart';
import 'animation_duration.attribute.dart';

// TODO: We should expose AnimationDuration and AnimationCurve as individual attributes
AnimationAttribute animation({Curve? curve, Duration? duration}) {
  return AnimationAttribute.from(duration: duration, curve: curve);
}

AnimationDurationAttribute animationDuration(Duration duration) {
  return AnimationDurationAttribute(duration);
}

AnimationAttribute animationCurve(Curve curve) {
  return AnimationAttribute.from(curve: curve);
}

@Deprecated('Use animation instead')
AnimationAttribute animated(bool animated) =>
    throw UnimplementedError('animated no longer exists');
