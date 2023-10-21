import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../attributes/text_attribute.dart';
import '../factory/mix_provider.dart';
import '../helpers/extensions/build_context_ext.dart';
import 'empty_widget.dart';
import 'styled_widget.dart';

@Deprecated('Use StyledText now')
typedef TextMix = StyledText;

class StyledText extends StyledWidget {
  const StyledText(
    this.text, {
    @Deprecated('Use the style parameter instead') super.mix,
    super.style,
    super.key,
    super.variants,
    super.inherit,
    this.semanticsLabel,
  });

  final String text;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    return withMix(
      context,
      MixedText(content: text, semanticsLabel: semanticsLabel),
    );
  }
}

@Deprecated('Use MixedText now')
typedef TextMixedWidget = MixedText;

class MixedText extends StatelessWidget {
  const MixedText({required this.content, super.key, this.semanticsLabel});

  final String content;
  final String? semanticsLabel;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(DiagnosticsProperty<String>('text', content));
  }

  @override
  Widget build(BuildContext context) {
    final mix = MixProvider.of(context);

    final text = mix.maybeGet<TextAttributes, TextSpec>();
    final animationDuration = mix.commonSpec.animationDuration;
    final animationCurve = mix.commonSpec.animationCurve;
    final textDirection = mix.commonSpec.textDirection;

    final textStyle =
        text?.style ?? context.textTheme.bodyLarge ?? const TextStyle();

    final visible = mix.commonSpec.visible;

    if (!visible) {
      return const Empty();
    }

    final modifiedContent = text?.applyTextDirectives(content) ?? content;

    final textWidget = Text(
      modifiedContent,
      style: text?.style,
      strutStyle: text?.strutStyle,
      textAlign: text?.textAlign,
      textDirection: text?.textDirection ?? context.directionality,
      locale: text?.locale,
      softWrap: text?.softWrap,
      overflow: text?.overflow,
      textScaleFactor: text?.textScaleFactor,
      maxLines: text?.maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: text?.textWidthBasis,
      textHeightBehavior: text?.textHeightBehavior,
    );

    return mix.animated
        ? AnimatedDefaultTextStyle(
            style: text?.style ??
                Theme.of(context).textTheme.bodyLarge ??
                const TextStyle(),
            textAlign: text?.textAlign,
            softWrap: text?.softWrap ?? true,
            overflow: text?.overflow ?? TextOverflow.clip,
            maxLines: text?.maxLines,
            curve: animationCurve,
            duration: animationDuration,
            child: textWidget,
          )
        : textWidget;
  }
}
