import 'package:flutter/material.dart';

import '../../helpers/build_context_ext.dart';
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
    final inheritedAttribute = inherit && context.mix != null
        // ignore: avoid-non-null-assertion
        ? TextMixAttribute.of(context.mix!)
        : const TextMixAttribute();

    return withMix(context, (mix) {
      final attribute = TextMixAttribute.of(mix);
      final merged = inheritedAttribute.merge(attribute);

      final mixture = merged.resolve(mix);

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
