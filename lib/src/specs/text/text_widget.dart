import 'package:flutter/material.dart';

import '../../core/directive.dart';
import '../../core/styled_widget.dart';
import '../../factory/mix_provider.dart';
import '../../factory/mix_provider_data.dart';
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
      return MixedText(
        text: text,
        semanticsLabel: semanticsLabel,
        locale: locale,
      );
    });
  }
}

class MixedText extends StatelessWidget {
  const MixedText({
    required this.text,
    this.mix,
    this.semanticsLabel,
    this.locale,
    super.key,
  });

  final String text;
  final String? semanticsLabel;
  final Locale? locale;
  final MixData? mix;

  @override
  Widget build(BuildContext context) {
    final mix = this.mix ?? MixProvider.of(context);
    final spec = TextSpec.of(mix);
    final modifyText = mix.attributeOf<TextDataDirective>();

    return Text(
      modifyText?.apply(text) ?? text,
      style: spec.style,
      strutStyle: spec.strutStyle,
      textAlign: spec.textAlign,
      textDirection: spec.textDirection,
      locale: locale,
      softWrap: spec.softWrap,
      overflow: spec.overflow,
      textScaleFactor: spec.textScaleFactor,
      maxLines: spec.maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: spec.textWidthBasis,
      textHeightBehavior: spec.textHeightBehavior,
    );
  }
}
