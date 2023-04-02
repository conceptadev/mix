import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../attributes/shared/shared.descriptor.dart';
import '../empty.widget.dart';
import '../mix.widget.dart';
import '../mix_context_builder.dart';
import 'text.descriptor.dart';

class TextMix extends MixWidget {
  const TextMix(
    this.text, {
    super.mix,
    super.key,
    super.variants,
    super.inherit,
    this.semanticsLabel,
  });

  final String text;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    return MixContextBuilder(
      mix: mix,
      builder: (context, _) {
        final textProps = TextDescriptor.fromContext(context);

        return TextMixedWidget(
          textDescriptor: textProps,
          text: text,
          semanticsLabel: semanticsLabel,
        );
      },
    );
  }
}

class TextMixedWidget extends StatelessWidget {
  const TextMixedWidget({
    required this.textDescriptor,
    required this.text,
    Key? key,
    this.semanticsLabel,
  }) : super(key: key);

  final String text;
  final TextDescriptor textDescriptor;

  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final commonDescriptor = CommonDescriptor.fromContext(context);
    if (!commonDescriptor.visible) {
      return const Empty();
    }

    final content = textDescriptor.applyTextDirectives(text);

    final textWidget = Text(
      content,
      textDirection: commonDescriptor.textDirection,
      textWidthBasis: textDescriptor.textWidthBasis,
      textScaleFactor: textDescriptor.textScaleFactor,
      locale: textDescriptor.locale,
      maxLines: textDescriptor.maxLines,
      overflow: textDescriptor.overflow,
      softWrap: textDescriptor.softWrap,
      strutStyle: textDescriptor.strutStyle,
      style: textDescriptor.style,
      textAlign: textDescriptor.textAlign,
      textHeightBehavior: textDescriptor.textHeightBehavior,
      semanticsLabel: semanticsLabel,
    );

    if (commonDescriptor.animated) {
      return AnimatedDefaultTextStyle(
        style: textDescriptor.style ??
            Theme.of(context).textTheme.bodyLarge ??
            const TextStyle(),
        duration: commonDescriptor.animationDuration,
        curve: commonDescriptor.animationCurve,
        softWrap: textDescriptor.softWrap,
        overflow: textDescriptor.overflow,
        textAlign: textDescriptor.textAlign,
        maxLines: textDescriptor.maxLines,
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
        text,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<TextDescriptor>(
        'props',
        textDescriptor,
        defaultValue: null,
      ),
    );
  }
}
