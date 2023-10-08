import 'package:flutter/animation.dart';

import '../../factory/exports.dart';
import '../attribute.dart';
import '../resolvable_attribute.dart';
import 'animation_curve.attribute.dart';
import 'animation_duration.attribute.dart';

class AnimationAttribute
    extends ResolvableAttribute<AnimationAttributeResolved> {
  final AnimationDurationAttribute? _duration;
  final AnimationCurveAttribute? _curve;

  const AnimationAttribute({
    AnimationDurationAttribute? duration,
    AnimationCurveAttribute? curve,
  })  : _duration = duration,
        _curve = curve;

  factory AnimationAttribute.from({Duration? duration, Curve? curve}) {
    return AnimationAttribute(
      duration: duration == null ? null : AnimationDurationAttribute(duration),
      curve: curve == null ? null : AnimationCurveAttribute(curve),
    );
  }

  @override
  AnimationAttribute merge(AnimationAttribute? other) {
    if (other == null) return this;

    return AnimationAttribute(
      duration: mergeAttribute(_duration, other._duration),
      curve: mergeAttribute(_curve, other._curve),
    );
  }

  @override
  AnimationAttributeResolved resolve(MixData mix) {
    return AnimationAttributeResolved(
      duration: resolveAttribute(_duration, mix),
      curve: resolveAttribute(_curve, mix),
    );
  }

  @override
  get props => [_duration, _curve];
}

class AnimationAttributeResolved extends Dto {
  final Duration? duration;
  final Curve? curve;
  const AnimationAttributeResolved({
    required this.duration,
    required this.curve,
  });

  @override
  get props => [duration, curve];
}
