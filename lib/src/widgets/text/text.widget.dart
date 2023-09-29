import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../attributes/shared/shared.descriptor.dart';
import '../../factory/mix_provider_data.dart';
import '../empty/empty.widget.dart';
import '../styled.widget.dart';
import 'text.descriptor.dart';

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
    return buildWithMix(
      context,
      (mix) => MixedText(
        mix: mix,
        content: text,
        semanticsLabel: semanticsLabel,
      ),
    );
  }
}

@Deprecated('Use MixedText now')
typedef TextMixedWidget = MixedText;

class MixedText extends StatelessWidget {
  const MixedText({
    required this.mix,
    required this.content,
    super.key,
    this.semanticsLabel,
  });

  final String content;
  final MixData mix;

  final String? semanticsLabel;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(
      DiagnosticsProperty<String>(
        'text',
        content,
      ),
    );

    properties.add(
      DiagnosticsProperty<MixData>(
        'props',
        mix,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final common = CommonDescriptor.fromContext(mix);
    final text = StyledTextDescriptor.fromContext(mix);

    if (!common.visible) {
      return const Empty();
    }

    final modifiedContent = text.applyTextDirectives(content);

    final textWidget = Text(
      modifiedContent,
      style: text.style,
      strutStyle: text.strutStyle,
      textAlign: text.textAlign,
      textDirection: common.textDirection,
      locale: text.locale,
      softWrap: text.softWrap,
      overflow: text.overflow,
      textScaleFactor: text.textScaleFactor,
      maxLines: text.maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: text.textWidthBasis,
      textHeightBehavior: text.textHeightBehavior,
    );

    return common.animated
        ? AnimatedDefaultTextStyle(
            child: textWidget,
            style: text.style ??
                Theme.of(context).textTheme.bodyLarge ??
                const TextStyle(),
            textAlign: text.textAlign,
            softWrap: text.softWrap,
            overflow: text.overflow,
            maxLines: text.maxLines,
            curve: common.animationCurve,
            duration: common.animationDuration,
          )
        : textWidget;
  }
}
