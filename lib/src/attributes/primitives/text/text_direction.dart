import 'package:flutter/material.dart';

import '../../base_attribute.dart';

class TextDirectionUtility {
  const TextDirectionUtility();
  TextDirectionAttribute get ltr =>
      const TextDirectionAttribute(TextDirection.ltr);

  TextDirectionAttribute get rtl =>
      const TextDirectionAttribute(TextDirection.rtl);
}

class TextDirectionAttribute extends TextMixAttribute<TextDirection> {
  const TextDirectionAttribute(this.textDirection);

  final TextDirection textDirection;
  @override
  TextDirection get value => textDirection;
}
