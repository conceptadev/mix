import 'package:flutter/widgets.dart';

import '../../core/element.dart';
import '../scalars/scalar_util.dart';
import 'animated_data.dart';
import 'mix_animated_data.dart';

final class AnimatedMixUtility<T extends Attribute>
    extends DtoUtility<T, AnimatedDataMix, AnimatedData> {
  AnimatedMixUtility(super.builder)
      : super(valueToDto: (value) => value.toDto());

  DurationUtility<T> get duration => DurationUtility((v) => only(duration: v));

  CurveUtility<T> get curve => CurveUtility((v) => only(curve: v));
  @override
  T only({Duration? duration, Curve? curve}) {
    return builder(AnimatedDataMix(duration: duration, curve: curve));
  }
}
