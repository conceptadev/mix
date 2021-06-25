import 'package:flutter/material.dart';

import '../base_attribute.dart';

class TextAlignUtility {
  const TextAlignUtility();

  /// Align the text on the left edge of the container.
  TextAlignAttribute get left => TextAlignAttribute(TextAlign.left);

  /// Align the text on the right edge of the container.
  TextAlignAttribute get right => TextAlignAttribute(TextAlign.right);

  /// Align the text in the center of the container.
  TextAlignAttribute get center => TextAlignAttribute(TextAlign.center);

  /// Stretch lines of text that end with a soft line break to fill the width of
  /// the container.
  ///
  /// Lines that end with hard line breaks are aligned towards the [start] edge.
  TextAlignAttribute get justify => TextAlignAttribute(TextAlign.justify);

  /// Align the text on the leading edge of the container.
  ///
  /// For left-to-right text ([TextDirection.ltr]), this is the left edge.
  ///
  /// For right-to-left text ([TextDirection.rtl]), this is the right edge.
  TextAlignAttribute get start => TextAlignAttribute(TextAlign.start);

  /// Align the text on the trailing edge of the container.
  ///
  /// For left-to-right text ([TextDirection.ltr]), this is the right edge.
  ///
  /// For right-to-left text ([TextDirection.rtl]), this is the left edge.
  TextAlignAttribute get end => TextAlignAttribute(TextAlign.end);
}

class TextAlignAttribute extends TextTypeAttribute<TextAlign> {
  const TextAlignAttribute(this.textAlign);
  final TextAlign textAlign;

  TextAlign get value => textAlign;
}
