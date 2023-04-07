import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../attributes/shared/shared.descriptor.dart';
import '../../factory/mix_provider_data.dart';
import '../empty/empty.widget.dart';
import '../mix.widget.dart';
import '../mix_context_builder.dart';
import 'text.descriptor.dart';

class TextMix extends MixWidget {
  const TextMix(
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
    return MixBuilder(
      style: style,
      builder: (mix) {
        return TextMixedWidget(
          mix: mix,
          content: text,
          semanticsLabel: semanticsLabel,
        );
      },
    );
  }
}

class TextMixedWidget extends StatelessWidget {
  const TextMixedWidget({
    required this.mix,
    required this.content,
    Key? key,
    this.semanticsLabel,
  }) : super(key: key);

  final String content;
  final MixData mix;

  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final common = CommonDescriptor.fromContext(mix);
    final text = TextDescriptor.fromContext(mix);

    if (!common.visible) {
      return const Empty();
    }

    final modifiedContent = text.applyTextDirectives(content);

    final textWidget = Text(
      modifiedContent,
      textDirection: common.textDirection,
      textWidthBasis: text.textWidthBasis,
      textScaleFactor: text.textScaleFactor,
      locale: text.locale,
      maxLines: text.maxLines,
      overflow: text.overflow,
      softWrap: text.softWrap,
      strutStyle: text.strutStyle,
      style: text.style,
      textAlign: text.textAlign,
      textHeightBehavior: text.textHeightBehavior,
      semanticsLabel: semanticsLabel,
    );

    if (common.animated) {
      return AnimatedDefaultTextStyle(
        style: text.style ??
            Theme.of(context).textTheme.bodyLarge ??
            const TextStyle(),
        duration: common.animationDuration,
        curve: common.animationCurve,
        softWrap: text.softWrap,
        overflow: text.overflow,
        textAlign: text.textAlign,
        maxLines: text.maxLines,
        child: textWidget,
      );
    } else {
      return textWidget;
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(
      DiagnosticsProperty<String>(
        'text',
        content,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<MixData>(
        'props',
        mix,
        defaultValue: null,
      ),
    );
  }
}
