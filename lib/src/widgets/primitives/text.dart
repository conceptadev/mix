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
    return TextMixer(mixer, text: text);
  }
}

class TextMixer extends MixerWidget {
  const TextMixer(
    Mixer mixer, {
    Key? key,
    required this.text,
  }) : super(mixer, key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: mixer.softWrap?.value,
      textDirection: mixer.textDirection?.value,
      textWidthBasis: mixer.textWidthBasis?.value,
      textAlign: mixer.textAlign?.value,
      overflow: mixer.textOverflow?.value,
      maxLines: mixer.maxLines?.value,
      textScaleFactor: mixer.textScaleFactor?.value,
      style: TextStyle(
        wordSpacing: mixer.wordSpacing?.value,
        textBaseline: mixer.textBaseline?.value,
        letterSpacing: mixer.letterSpacing?.value,
        fontSize: mixer.fontSize?.value,
        fontWeight: mixer.fontWeight?.value,
        fontFamily: mixer.fontFamily?.value,
        locale: mixer.locale?.value,
        debugLabel: mixer.debugLabel?.value,
        color: mixer.textColor?.value,
        fontStyle: mixer.fontStyle?.value,
        height: mixer.textHeight?.value,
        backgroundColor: mixer.backgroundColor?.value,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<bool>('softWrap', mixer.softWrap?.value,
          showName: false, defaultValue: null),
    );
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
