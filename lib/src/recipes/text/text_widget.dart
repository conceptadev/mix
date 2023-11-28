import 'package:flutter/material.dart';

import '../../widgets/styled_widget.dart';
import 'text_attribute.dart';

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
    return withMix(context, (mix) {
      final mixture = mix.resolvableOf(const TextMixAttribute());

      return Text(
        mixture.applyTextDirectives(text),
        style: mixture.style,
        strutStyle: mixture.strutStyle,
        textAlign: mixture.textAlign,
        textDirection: mixture.textDirection ?? TextDirection.ltr,
        locale: locale,
        softWrap: mixture.softWrap,
        overflow: mixture.overflow,
        textScaleFactor: mixture.textScaleFactor,
        maxLines: mixture.maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: mixture.textWidthBasis,
        textHeightBehavior: mixture.textHeightBehavior,
      );
    });
  }
}
