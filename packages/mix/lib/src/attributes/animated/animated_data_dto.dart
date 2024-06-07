import 'package:flutter/animation.dart';

import '../../core/models/animated_data.dart';
import '../../core/dto.dart';
import '../../factory/mix_provider_data.dart';
import '../../internal/constants.dart';

class AnimatedDataDto extends Dto<AnimatedData> {
  final Duration? duration;
  final Curve? curve;

  const AnimatedDataDto({required this.duration, required this.curve});

  const AnimatedDataDto.withDefaults()
      : duration = kDefaultAnimationDuration,
        curve = Curves.linear;

  @override
  AnimatedData resolve(MixData mix) {
    return AnimatedData(duration: duration, curve: curve);
  }

  @override
  AnimatedDataDto merge(AnimatedDataDto? other) {
    return AnimatedDataDto(
      duration: other?.duration ?? duration,
      curve: other?.curve ?? curve,
    );
  }

  @override
  get props => [duration, curve];
}
