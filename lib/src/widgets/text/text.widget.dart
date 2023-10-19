import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../attributes/text/attributes/text.attribute.dart';
import '../../factory/mix_provider.dart';
import '../empty/empty.widget.dart';
import '../styled.widget.dart';

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
    final common = mix.commonSpec;

    if (!common.visible) {
      return const Empty();
    }

    final modifiedContent = text?.applyTextDirectives(content) ?? content;

    final textWidget = Text(
      modifiedContent,
      style: text?.style,
      strutStyle: text?.strutStyle,
      textAlign: text?.textAlign,
      textDirection: common.textDirection,
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
            curve: common.animation.curve,
            duration: common.animation.duration,
            child: textWidget,
          )
        : textWidget;
  }
}
