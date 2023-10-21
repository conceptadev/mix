import 'package:flutter/animation.dart';

import '../factory/mix_provider_data.dart';
import 'style_attribute.dart';

class CurveAttribute extends StyleAttribute<Curve> {
  final Curve curve;

  const CurveAttribute(this.curve);

  Curve get value => curve;

  @override
  CurveAttribute merge(covariant CurveAttribute? other) {
    return CurveAttribute(other?.curve ?? curve);
  }

  @override
  Curve resolve(MixData mix) => curve;

  @override
  List<Object?> get props => [curve];
}
