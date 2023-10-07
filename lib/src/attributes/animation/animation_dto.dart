import 'package:flutter/widgets.dart';

import '../exports.dart';

class AnimationDto extends Dto {
  final Duration? duration;
  final Curve? curve;
  const AnimationDto({this.duration, this.curve});

  @override
  AnimationDto merge(covariant AnimationDto? other) {
    if (other == null) return this;

    return AnimationDto(
      duration: other.duration ?? duration,
      curve: other.curve ?? curve,
    );
  }

  @override
  get props => [duration, curve];
}
