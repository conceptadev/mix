import 'package:flutter/animation.dart';

import '../../factory/mix_provider_data.dart';
import '../base/curve.attribute.dart';

class AnimationCurveAttribute extends CurveAttribute {
  const AnimationCurveAttribute(super.curve);

  @override
  AnimationCurveAttribute merge(AnimationCurveAttribute? other) =>
      AnimationCurveAttribute(other?.curve ?? curve);

  @override
  Curve resolve(MixData mix) => curve;
}
