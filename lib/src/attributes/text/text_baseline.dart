import 'package:flutter/material.dart';

import '../base_attribute.dart';

class TextBaselineUtility {
  const TextBaselineUtility();
  TextBaselineAttribute get alphabetic =>
      TextBaselineAttribute(TextBaseline.alphabetic);

  TextBaselineAttribute get ideographic =>
      TextBaselineAttribute(TextBaseline.ideographic);
}

class TextBaselineAttribute extends TextTypeAttribute<TextBaseline> {
  const TextBaselineAttribute(this.textBaseline);
  final TextBaseline textBaseline;

  TextBaseline get value => textBaseline;
}
