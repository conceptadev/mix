import 'package:flutter/material.dart';

import '../base_attribute.dart';

class TextOverflowUtility {
  const TextOverflowUtility();
  TextOverflowAttribute get clip =>
      const TextOverflowAttribute(TextOverflow.clip);
  TextOverflowAttribute get ellipsis =>
      const TextOverflowAttribute(TextOverflow.ellipsis);
  TextOverflowAttribute get fade =>
      const TextOverflowAttribute(TextOverflow.fade);
  TextOverflowAttribute get visible =>
      const TextOverflowAttribute(TextOverflow.visible);
}

class TextOverflowAttribute extends TextTypeAttribute<TextOverflow> {
  const TextOverflowAttribute([this.textOverflow = TextOverflow.clip]);
  final TextOverflow textOverflow;
  @override
  TextOverflow get value => textOverflow;
}
