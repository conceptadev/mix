import 'package:flutter/animation.dart';

import '../../attributes/animated/animated_data_dto.dart';
import '../../internal/constants.dart';

class AnimatedData {
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
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AnimatedData &&
        other._curve == _curve &&
        other._duration == _duration;
  }

  @override
  int get hashCode => _curve.hashCode ^ _duration.hashCode;
}
