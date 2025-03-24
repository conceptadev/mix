import 'package:flutter/animation.dart';

import '../../core/element.dart';
import '../../core/factory/mix_data.dart';
import '../../internal/constants.dart';
import 'animated_data.dart';

@Deprecated('Use MixAnimatedData instead')
typedef AnimatedDataDto = MixAnimatedData;

class MixAnimatedData extends Mixable<AnimatedData> {
  final Duration? duration;
  final Curve? curve;
  final VoidCallback? onEnd;

  const MixAnimatedData({
    required this.duration,
    required this.curve,
    this.onEnd,
  });

  const MixAnimatedData.withDefaults()
      : duration = kDefaultAnimationDuration,
        curve = Curves.linear,
        onEnd = null;

  @override
  AnimatedData resolve(MixData mix) {
    return AnimatedData(duration: duration, curve: curve, onEnd: onEnd);
  }

  @override
  MixAnimatedData merge(MixAnimatedData? other) {
    return MixAnimatedData(
      duration: other?.duration ?? duration,
      curve: other?.curve ?? curve,
    );
  }

  @override
  get props => [duration, curve];
}
