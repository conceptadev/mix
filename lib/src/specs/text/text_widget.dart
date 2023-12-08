import 'package:flutter/material.dart';

import '../../core/styled_widget.dart';
import 'text_attribute.dart';
import 'text_spec.dart';

class StyledText extends StyledWidget {
  const StyledText(
    this.text, {
    this.semanticsLabel,
    super.style,
    super.key,
    super.inherit = true,
    this.locale,
  });

  final String text;
  final String? semanticsLabel;
  final Locale? locale;

  @override
  Widget build(BuildContext context) {
    return withMix(context, (mix) {
      final spec = mix.attributeOf<TextSpecAttribute>()?.resolve(mix) ??
          const TextSpec.empty();

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
