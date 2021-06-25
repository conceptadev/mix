import 'package:flutter/material.dart';

import '../base_attribute.dart';

class TextOverflowUtility {
  const TextOverflowUtility();
  TextOverflowAttribute get clip => TextOverflowAttribute(TextOverflow.clip);
  TextOverflowAttribute get ellipsis =>
      TextOverflowAttribute(TextOverflow.ellipsis);
  TextOverflowAttribute get fade => TextOverflowAttribute(TextOverflow.fade);
  TextOverflowAttribute get visible =>
      TextOverflowAttribute(TextOverflow.visible);
}

class TextOverflowAttribute extends TextTypeAttribute<TextOverflow> {
  const TextOverflowAttribute([this.textOverflow = TextOverflow.clip]);
  final TextOverflow textOverflow;

  TextOverflow get value => textOverflow;
}
