import 'package:flutter/widgets.dart';

import '../../factory/mix_provider_data.dart';
import '../resolvable_attribute.dart';

class AxisAttribute extends ResolvableAttribute<Axis> {
  final Axis axis;

  const AxisAttribute(this.axis);

  @override
  AxisAttribute merge(AxisAttribute? other) =>
      AxisAttribute(other?.axis ?? axis);

  @override
  Axis resolve(MixData mix) => axis;

  @override
  List<Object?> get props => [axis];
}
