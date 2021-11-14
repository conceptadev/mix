import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../mixer/mix_factory.dart';
import '../mixer/mixer.dart';
import 'mix.widget.dart';

class TextMix extends MixWidget {
  const TextMix(
    Mix mix, {
    Key? key,
    required this.text,
  }) : super(mix, key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return _TextMixerWidget(
      Mixer.build(context, mix),
      text: text,
    );
  }
}

class _TextMixerWidget extends MixerWidget {
  const _TextMixerWidget(
    Mixer recipe, {
    Key? key,
    required this.text,
  }) : super(recipe, key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    onEnd() {}

    final content = recipe.applyTextDirectives(text);

    if (animated) {
      return AnimatedDefaultTextStyle(
        child: Text(
          content,
          textDirection: textDirection,
          textWidthBasis: textProps.textWidthBasis,
          textScaleFactor: textProps.textScaleFactor,
        ),
        style: textProps.style ?? const TextStyle(),
        duration: animationDuration,
        curve: animationCurve,
        onEnd: onEnd,
        softWrap: textProps.softWrap ?? true,
        textAlign: textProps.textAlign,
        overflow: textProps.overflow ?? TextOverflow.clip,
        maxLines: textProps.maxLines,
      );
    } else {
      return Text(
        content,
        softWrap: textProps.softWrap,
        textDirection: textDirection,
        textWidthBasis: textProps.textWidthBasis,
        textAlign: textProps.textAlign,
        overflow: textProps.overflow,
        maxLines: textProps.maxLines,
        textScaleFactor: textProps.textScaleFactor,
        style: textProps.style,
      );
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(
      DiagnosticsProperty<EdgeInsetsGeometry>(
        'padding',
        boxProps.padding,
        defaultValue: null,
      ),
    );
  }
}
