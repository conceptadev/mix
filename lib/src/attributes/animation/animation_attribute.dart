import 'package:flutter/animation.dart';

import '../../factory/exports.dart';
import '../resolvable_attribute.dart';
import 'animation_dto.dart';

class AnimationAttribute extends ResolvableAttribute<AnimationDto> {
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
  AnimationDto resolve(MixData mix) {
    return AnimationDto(duration: _duration, curve: _curve);
  }

  @override
  get props => [_duration, _curve];
}
