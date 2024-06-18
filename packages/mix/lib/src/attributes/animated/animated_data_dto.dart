import 'package:flutter/animation.dart';

import '../../core/dto.dart';
import '../../core/factory/mix_data.dart';
import '../../internal/constants.dart';
import 'animated_data.dart';

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
  AnimatedData get defaultValue => const AnimatedData.withDefaults();

  @override
  get props => [duration, curve];
}
