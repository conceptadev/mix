import 'package:flutter/material.dart';

import '../base_attribute.dart';

class TextDirectionUtility {
  const TextDirectionUtility();
  TextDirectionAttribute get ltr => TextDirectionAttribute(TextDirection.ltr);

  TextDirectionAttribute get rtl => TextDirectionAttribute(TextDirection.rtl);
}

class TextDirectionAttribute extends TextTypeAttribute<TextDirection> {
  const TextDirectionAttribute(this.textDirection);

  final TextDirection textDirection;

  TextDirection get value => textDirection;
}
