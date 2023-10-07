import 'package:flutter/widgets.dart';

import '../../factory/exports.dart';
import '../resolvable_attribute.dart';

class TextDirectionAttribute extends ResolvableAttribute<TextDirection> {
  final TextDirection _direction;
  const TextDirectionAttribute({required TextDirection direction})
      : _direction = direction;

  @override
  TextDirectionAttribute merge(TextDirectionAttribute? other) {
    if (other == null) return this;

    return TextDirectionAttribute(direction: other._direction);
  }

  @override
  TextDirection resolve(MixData mix) {
    return _direction;
  }

  @override
  get props => [_direction];
}
