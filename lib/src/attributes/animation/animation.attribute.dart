import 'package:flutter/animation.dart';

import '../../factory/exports.dart';
import '../attribute.dart';
import '../resolvable_attribute.dart';

class AnimationAttribute
    extends ResolvableAttribute<AnimationAttributeResolved> {
  final Duration? _duration;
  final Curve? _curve;

  const AnimationAttribute({Duration? duration, Curve? curve})
      : _duration = duration,
        _curve = curve;

  @override
  AnimationAttribute merge(AnimationAttribute? other) {
    if (other == null) return this;

    return AnimationAttribute(
      duration: other._duration ?? _duration,
      curve: other._curve ?? _curve,
    );
  }

  @override
  AnimationAttributeResolved resolve(MixData mix) {
    return AnimationAttributeResolved(
      duration: _duration ?? Duration.zero,
      curve: _curve ?? Curves.linear,
    );
  }

  @override
  get props => [_duration, _curve];
}

class AnimationAttributeResolved extends Dto {
  final Duration duration;
  final Curve curve;
  const AnimationAttributeResolved({
    required this.duration,
    required this.curve,
  });

  const AnimationAttributeResolved.defaults()
      : duration = Duration.zero,
        curve = Curves.linear;

  @override
  get props => [duration, curve];
}
