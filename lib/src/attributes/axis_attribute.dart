import 'package:flutter/widgets.dart';

import '../factory/mix_provider_data.dart';
import 'style_attribute.dart';

class AxisAttribute extends StyleAttribute<Axis> {
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
