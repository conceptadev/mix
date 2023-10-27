import 'package:flutter/material.dart';

import '../specs/text_spec.dart';
import 'styled_widget.dart';

@Deprecated('Use StyledText now')
typedef TextMix = StyledText;

class StyledText extends StyledWidget {
  const StyledText(
    this.text, {
    this.semanticsLabel,
    super.style,
    super.key,
    super.inherit,
    this.softWrap,
  });

  final String text;
  final String? semanticsLabel;
  final bool? softWrap;

  @override
  Widget build(BuildContext context) {
    return buildWithStyle(context, (data) {
      final spec = TextSpec.resolve(data);

      return Text(
        text,
        style: spec.style,
        strutStyle: spec.strutStyle,
        textAlign: spec.textAlign,
        textDirection: spec.textDirection ?? TextDirection.ltr,
        locale: spec.locale,
        softWrap: softWrap,
        overflow: spec.overflow,
        textScaleFactor: spec.textScaleFactor,
        maxLines: spec.maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: spec.textWidthBasis,
        textHeightBehavior: spec.textHeightBehavior,
      );
    });
  }
}
