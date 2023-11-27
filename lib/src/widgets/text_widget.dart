import 'package:flutter/material.dart';

import '../recipes/text/text_mixture.dart';
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
    this.locale,
  });

  final String text;
  final String? semanticsLabel;
  final Locale? locale;

  @override
  Widget build(BuildContext context) {
    return withMix(context, (data) {
      final spec = TextMixture.resolve(data);

      return Text(
        spec.applyTextDirectives(text),
        style: spec.style,
        strutStyle: spec.strutStyle,
        textAlign: spec.textAlign,
        textDirection: spec.textDirection ?? TextDirection.ltr,
        locale: locale,
        softWrap: spec.softWrap,
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
