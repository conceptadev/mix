import 'package:flutter/widgets.dart';

import '../../../factory/mix_provider_data.dart';
import '../../resolvable_attribute.dart';

class TextDirectionAttribute extends ResolvableAttribute<TextDirection> {
  final TextDirection direction;

  const TextDirectionAttribute(this.direction);

  @override
  TextDirectionAttribute merge(TextDirectionAttribute? other) =>
      TextDirectionAttribute(other?.direction ?? direction);

  @override
  TextDirection resolve(MixData mix) => direction;

  @override
  List<Object?> get props => [direction];
}
