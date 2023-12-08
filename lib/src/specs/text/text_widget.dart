import 'package:flutter/material.dart';

import '../../core/directive.dart';
import '../../core/styled_widget.dart';
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
      final textSpec = TextSpec.of(mix);

      final modifyText = mix.attributeOf<TextDataDirective>();

      return Text(
        modifyText?.apply(text) ?? text,
        style: textSpec.style,
        strutStyle: textSpec.strutStyle,
        textAlign: textSpec.textAlign,
        textDirection: textSpec.textDirection ?? TextDirection.ltr,
        locale: locale,
        softWrap: textSpec.softWrap,
        overflow: textSpec.overflow,
        textScaleFactor: textSpec.textScaleFactor,
        maxLines: textSpec.maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textSpec.textWidthBasis,
        textHeightBehavior: textSpec.textHeightBehavior,
      );
    });
  }
}
