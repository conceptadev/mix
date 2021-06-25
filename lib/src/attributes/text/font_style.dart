import 'package:flutter/material.dart';

import '../base_attribute.dart';

class FontStyleUtility {
  const FontStyleUtility();
  FontStyleAttribute get normal => FontStyleAttribute(FontStyle.normal);
  FontStyleAttribute get italic => FontStyleAttribute(FontStyle.italic);
}

class FontStyleAttribute extends TextTypeAttribute<FontStyle> {
  const FontStyleAttribute(this.fontStyle);

  final FontStyle fontStyle;

  FontStyle get value => fontStyle;
}
