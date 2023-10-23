import 'package:flutter/widgets.dart';

import '../core/style_attribute.dart';
import '../factory/mix_provider_data.dart';

class VerticalDirectionAttribute extends StyleAttribute<VerticalDirection> {
  final VerticalDirection direction;

  const VerticalDirectionAttribute(this.direction);

  @override
  VerticalDirectionAttribute merge(VerticalDirectionAttribute? other) =>
      VerticalDirectionAttribute(other?.direction ?? direction);

  @override
  VerticalDirection resolve(MixData mix) => direction;

  @override
  List<Object?> get props => [direction];
}
