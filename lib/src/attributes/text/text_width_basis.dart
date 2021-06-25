import 'package:flutter/material.dart';

import '../base_attribute.dart';

class TextWidthBasisUtility {
  const TextWidthBasisUtility();
  TextWidthBasisAttribute get parent =>
      TextWidthBasisAttribute(TextWidthBasis.parent);

  TextWidthBasisAttribute get longestLine =>
      TextWidthBasisAttribute(TextWidthBasis.longestLine);
}

class TextWidthBasisAttribute extends TextTypeAttribute<TextWidthBasis> {
  const TextWidthBasisAttribute(this.textWidthBasis);
  final TextWidthBasis textWidthBasis;

  TextWidthBasis get value => textWidthBasis;
}
