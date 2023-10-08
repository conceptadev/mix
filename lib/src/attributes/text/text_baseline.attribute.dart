import 'package:flutter/widgets.dart';

import '../../factory/mix_provider_data.dart';
import '../resolvable_attribute.dart';

class TextBaselineAttribute extends ResolvableAttribute<TextBaseline> {
  final TextBaseline baseline;

  const TextBaselineAttribute(this.baseline);

  @override
  TextBaselineAttribute merge(TextBaselineAttribute? other) =>
      TextBaselineAttribute(other?.baseline ?? baseline);

  @override
  TextBaseline resolve(MixData mix) => baseline;

  @override
  List<Object?> get props => [baseline];
}
