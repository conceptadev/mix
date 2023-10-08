import 'package:flutter/widgets.dart';

import '../../factory/mix_provider_data.dart';
import '../style_attribute.dart';

class TextAlignAttribute extends StyleAttribute<TextAlign> {
  final TextAlign align;

  const TextAlignAttribute(this.align);

  @override
  TextAlignAttribute merge(TextAlignAttribute? other) =>
      TextAlignAttribute(other?.align ?? align);

  @override
  TextAlign resolve(MixData mix) => align;

  @override
  List<Object?> get props => [align];
}
