import 'package:flutter/widgets.dart';

import 'animation.attribute.dart';

AnimationAttribute animation({Curve? curve, Duration? duration}) {
  return AnimationAttribute(duration: duration, curve: curve);
}

@Deprecated('Use animation instead')
AnimationAttribute animated(bool animated) =>
    throw UnimplementedError('animated no longer exists');

@Deprecated('Use animation(duration:) instead')
AnimationAttribute animationDuration(Duration duration) {
  return AnimationAttribute(duration: duration);
}

@Deprecated('Use animation(duration:) instead')
AnimationAttribute animationCurve(Curve curve) {
  return AnimationAttribute(curve: curve);
}
