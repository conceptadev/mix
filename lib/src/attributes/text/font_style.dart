import 'package:flutter/material.dart';

import '../base_attribute.dart';

class FontStyleUtility {
  const FontStyleUtility();
  FontStyleAttribute get normal => const FontStyleAttribute(FontStyle.normal);
  FontStyleAttribute get italic => const FontStyleAttribute(FontStyle.italic);
}

class FontStyleAttribute extends TextMixAttribute<FontStyle> {
  const FontStyleAttribute(this.fontStyle);

  final FontStyle fontStyle;
  @override
  FontStyle get value => fontStyle;
}
