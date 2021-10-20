import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../mixer/mix_factory.dart';
import '../../mixer/mixer.dart';
import '../mix_widget.dart';

class TextMix extends MixWidget {
  const TextMix(
    Mix mix, {
    Key? key,
    required this.text,
  }) : super(mix, key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    final mixer = Mixer.build(context, mix);
    return TextMixerWidget(mixer, text: text);
  }
}

class TextMixerWidget extends MixerWidget {
  const TextMixerWidget(
    Mixer mixer, {
    Key? key,
    required this.text,
  }) : super(mixer, key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    if (mixer.animatedText != null) {
      return AnimatedDefaultTextStyle(
        child: Text(
          mixer.applyTextModifiers(text),
          textDirection: mixer.textDirection?.value,
          textWidthBasis: mixer.textWidthBasis?.value,
          textScaleFactor: mixer.textScaleFactor?.value,
        ),
        style: textStyle,
        duration: mixer.animatedText!.animationDuration!,
        curve: mixer.animatedText!.animationCurve!,
        onEnd: mixer.animatedText!.onEnd,
        softWrap: mixer.softWrap?.value ?? true,
        textAlign: mixer.textAlign?.value,
        overflow: mixer.textOverflow?.value ?? TextOverflow.clip,
        maxLines: mixer.maxLines?.value,
      );
    }
    return Text(
      mixer.applyTextModifiers(text),
      softWrap: mixer.softWrap?.value,
      textDirection: mixer.textDirection?.value,
      textWidthBasis: mixer.textWidthBasis?.value,
      textAlign: mixer.textAlign?.value,
      overflow: mixer.textOverflow?.value,
      maxLines: mixer.maxLines?.value,
      textScaleFactor: mixer.textScaleFactor?.value,
      style: textStyle,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(
      DiagnosticsProperty<EdgeInsetsGeometry>('padding', mixer.padding?.value,
          defaultValue: null),
    );

    if (mixer.backgroundColor != null) {
      properties.add(
        DiagnosticsProperty<Color>(
            'backgroundColor', mixer.backgroundColor?.value),
      );
    }

    if (mixer.constraints != null) {
      properties.add(
        DiagnosticsProperty<BoxConstraints>(
            'constraints', mixer.constraints?.value,
            defaultValue: null),
      );
    }
    properties.add(
      DiagnosticsProperty<EdgeInsetsGeometry>('margin', mixer.margin?.value,
          defaultValue: null),
    );
  }
}
