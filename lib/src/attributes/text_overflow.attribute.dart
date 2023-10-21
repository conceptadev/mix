import 'package:flutter/widgets.dart';

import '../factory/mix_provider_data.dart';
import 'style_attribute.dart';

class TextOverflowAttribute extends StyleAttribute<TextOverflow> {
  final TextOverflow overflow;

  const TextOverflowAttribute(this.overflow);

  static TextOverflowAttribute? maybeFrom(TextOverflow? overflow) {
    return overflow == null ? null : TextOverflowAttribute(overflow);
  }

  @override
  TextOverflowAttribute merge(TextOverflowAttribute? other) =>
      TextOverflowAttribute(other?.overflow ?? overflow);

  @override
  TextOverflow resolve(MixData mix) => overflow;

  @override
  List<Object?> get props => [overflow];
}
