import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';

import '../../internal/constants.dart';
import 'animated_data_dto.dart';

class AnimatedData {
  final VoidCallback? _onEnd;
  final Curve? _curve;
  final Duration? _duration;
  const AnimatedData({
    required Duration? duration,
    required Curve? curve,
    VoidCallback? onEnd,
  })  : _curve = curve,
        _duration = duration,
        _onEnd = onEnd;

  const AnimatedData.withDefaults()
      : _duration = kDefaultAnimationDuration,
        _curve = Curves.linear,
        _onEnd = null;

  // Se default in case is not set
  Duration get duration => _duration ?? kDefaultAnimationDuration;

  // set default in case its not set
  Curve get curve => _curve ?? Curves.linear;

  VoidCallback? get onEnd => _onEnd;

  AnimatedDataDto toDto() {
    return AnimatedDataDto(duration: duration, curve: curve, onEnd: _onEnd);
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
