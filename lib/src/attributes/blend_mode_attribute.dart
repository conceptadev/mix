import 'package:flutter/widgets.dart';

import '../factory/mix_provider_data.dart';
import 'style_attribute.dart';

class BlendModeAttribute extends StyleAttribute<BlendMode> {
  final BlendMode value;

  const BlendModeAttribute(this.value);

  @override
  BlendModeAttribute merge(BlendModeAttribute? other) =>
      BlendModeAttribute(other?.value ?? value);

  @override
  BlendMode resolve(MixData mix) => value;

  @override
  List<Object?> get props => [value];
}
