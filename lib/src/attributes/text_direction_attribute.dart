import 'package:flutter/widgets.dart';

import '../core/style_attribute.dart';
import '../factory/mix_provider_data.dart';

class TextDirectionAttribute extends StyleAttribute<TextDirection> {
  final TextDirection direction;

  const TextDirectionAttribute(this.direction);

  static TextDirectionAttribute? maybeFrom(TextDirection? direction) {
    return direction == null ? null : TextDirectionAttribute(direction);
  }

  @visibleForTesting
  TextDirection get value => direction;

  @override
  TextDirectionAttribute merge(TextDirectionAttribute? other) =>
      TextDirectionAttribute(other?.direction ?? direction);

  @override
  TextDirection resolve(MixData mix) => direction;

  @override
  List<Object?> get props => [direction];
}
