import 'package:flutter/widgets.dart';

import '../../factory/mix_provider_data.dart';
import '../resolvable_attribute.dart';

class TextOverflowAttribute extends ResolvableAttribute<TextOverflow> {
  final TextOverflow overflow;

  const TextOverflowAttribute(this.overflow);

  @override
  TextOverflowAttribute merge(TextOverflowAttribute? other) =>
      TextOverflowAttribute(other?.overflow ?? overflow);

  @override
  TextOverflow resolve(MixData mix) => overflow;

  @override
  List<Object?> get props => [overflow];
}
