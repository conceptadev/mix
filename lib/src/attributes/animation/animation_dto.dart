import 'package:flutter/widgets.dart';

import '../exports.dart';

class AnimationDto extends Dto {
  final Duration duration;
  final Curve curve;
  const AnimationDto({required this.duration, required this.curve});

  const AnimationDto.defaults()
      : duration = Duration.zero,
        curve = Curves.linear;

  @override
  AnimationDto merge(AnimationDto? other) {
    if (other == null) return this;

    return AnimationDto(duration: other.duration, curve: other.curve);
  }

  @override
  get props => [duration, curve];
}
