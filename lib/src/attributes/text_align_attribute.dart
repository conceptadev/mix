import 'package:flutter/widgets.dart';

import '../core/style_attribute.dart';
import '../factory/mix_provider_data.dart';

class TextAlignAttribute extends StyleAttribute<TextAlign> {
  final TextAlign align;

  const TextAlignAttribute(this.align);

  static TextAlignAttribute? maybeFrom(TextAlign? align) {
    return align == null ? null : TextAlignAttribute(align);
  }

  @override
  TextAlignAttribute merge(TextAlignAttribute? other) =>
      TextAlignAttribute(other?.align ?? align);

  @override
  TextAlign resolve(MixData mix) => align;

  @override
  List<Object?> get props => [align];
}
