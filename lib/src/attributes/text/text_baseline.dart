import 'package:flutter/material.dart';

import '../base_attribute.dart';

class TextBaselineUtility {
  const TextBaselineUtility();
  TextBaselineAttribute get alphabetic =>
      const TextBaselineAttribute(TextBaseline.alphabetic);

  TextBaselineAttribute get ideographic =>
      const TextBaselineAttribute(TextBaseline.ideographic);
}

class TextBaselineAttribute extends TextMixAttribute<TextBaseline> {
  const TextBaselineAttribute(this.textBaseline);
  final TextBaseline textBaseline;
  @override
  TextBaseline get value => textBaseline;
}
