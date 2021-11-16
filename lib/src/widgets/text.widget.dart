import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mix/src/helpers/extensions.dart';

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
    Mixer mixer, {
    Key? key,
    required this.text,
  }) : super(mixer, key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final content = mixer.applyTextDirectives(text);

    if (animated) {
      return AnimatedDefaultTextStyle(
        child: Text(
          content,
          textDirection: textDirection,
          textWidthBasis: textProps?.textWidthBasis,
          textScaleFactor: textProps?.textScaleFactor,
          locale: textProps?.locale,
          maxLines: textProps?.maxLines,
          overflow: textProps?.overflow,
          softWrap: textProps?.softWrap,
          strutStyle: textProps?.strutStyle,
          style: textProps?.style,
          textAlign: textProps?.textAlign,
          textHeightBehavior: textProps?.textHeightBehavior,
        ),
        style: textProps?.style ?? context.defaultTextStyle(),
        duration: animationDuration,
        curve: animationCurve,
        softWrap: textProps?.softWrap ?? true,
        textAlign: textProps?.textAlign,
        overflow: textProps?.overflow ?? TextOverflow.clip,
        maxLines: textProps?.maxLines,
      );
    } else {
      return Text(
        content,
        softWrap: textProps?.softWrap,
        textDirection: textDirection,
        textWidthBasis: textProps?.textWidthBasis,
        textAlign: textProps?.textAlign,
        overflow: textProps?.overflow,
        maxLines: textProps?.maxLines,
        textScaleFactor: textProps?.textScaleFactor,
        style: textProps?.style,
        locale: textProps?.locale,
        strutStyle: textProps?.strutStyle,
        textHeightBehavior: textProps?.textHeightBehavior,
      );
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(
      DiagnosticsProperty<bool>(
        'softWrap',
        textProps?.softWrap,
        defaultValue: true,
      ),
    );

    properties.add(
      DiagnosticsProperty<TextAlign>(
        'textAlign',
        textProps?.textAlign,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<TextDirection>(
        'textDirection',
        textDirection,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<TextWidthBasis>(
        'textWidthBasis',
        textProps?.textWidthBasis,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<double>(
        'textScaleFactor',
        textProps?.textScaleFactor,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<Locale>(
        'locale',
        textProps?.locale,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<StrutStyle>(
        'strutStyle',
        textProps?.strutStyle,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<TextHeightBehavior>(
        'textHeightBehavior',
        textProps?.textHeightBehavior,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<TextOverflow>(
        'overflow',
        textProps?.overflow,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<int>(
        'maxLines',
        textProps?.maxLines,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<double>(
        'textScaleFactor',
        textProps?.textScaleFactor,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<TextStyle>(
        'style',
        textProps?.style,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<String>(
        'text',
        text,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<Duration>(
        'animationDuration',
        animationDuration,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<Curve>(
        'animationCurve',
        animationCurve,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<Mixer>(
        'mixer',
        mixer,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<bool>(
        'animated',
        animated,
        defaultValue: false,
      ),
    );
  }
}
