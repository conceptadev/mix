import 'package:flutter/animation.dart';

import '../../core/dto.dart';
import '../../factory/mix_provider_data.dart';
import '../../helpers/compare_mixin.dart';
import '../../helpers/constants.dart';

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

class AnimatedData with Comparable {
  final Curve? _curve;
  final Duration? _duration;
  const AnimatedData({required Duration? duration, required Curve? curve})
      : _curve = curve,
        _duration = duration;

  const AnimatedData.withDefaults()
      : _duration = kDefaultAnimationDuration,
        _curve = Curves.linear;

  // Se default in case is not set
  Duration get duration => _duration ?? kDefaultAnimationDuration;

  // set default in case its not set
  Curve get curve => _curve ?? Curves.linear;

  AnimatedDataDto toDto() {
    return AnimatedDataDto(duration: duration, curve: curve);
  }

  @override
  get props => [_duration, _curve];
}
