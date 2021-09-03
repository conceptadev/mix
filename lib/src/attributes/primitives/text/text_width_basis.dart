import 'package:flutter/material.dart';

import '../../base_attribute.dart';

class TextWidthBasisUtility {
  const TextWidthBasisUtility();
  TextWidthBasisAttribute get parent =>
      const TextWidthBasisAttribute(TextWidthBasis.parent);

  TextWidthBasisAttribute get longestLine =>
      const TextWidthBasisAttribute(TextWidthBasis.longestLine);
}

class TextWidthBasisAttribute extends TextMixAttribute<TextWidthBasis> {
  const TextWidthBasisAttribute(this.textWidthBasis);
  final TextWidthBasis textWidthBasis;

  @override
  TextWidthBasis get value => textWidthBasis;
}
