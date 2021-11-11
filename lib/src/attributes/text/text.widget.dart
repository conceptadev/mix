import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mix/src/attributes/box/box.widget.dart';

import '../../mixer/mix_factory.dart';
import '../../mixer/recipe_factory.dart';
import '../../widgets/mix_widget.dart';

class TextMix extends MixWidget {
  const TextMix(
    Mix mix, {
    Key? key,
    required this.text,
  }) : super(mix, key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return TextMixerWidget(
      Recipe.build(context, mix),
      text: text,
    );
  }
}

class TextMixerWidget extends MixerWidget {
  const TextMixerWidget(
    Recipe recipe, {
    Key? key,
    required this.text,
  }) : super(recipe, key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    onEnd() {}
    final animated = props.animated;
    final animationDuration = props.animationDuration;
    final animationCurve = props.animationCurve;

    final textAtr = recipe.text;

    final content = recipe.applyTextDirectives(text);

    return BoxMixerWidget(recipe,
        child: animated
            ? AnimatedDefaultTextStyle(
                child: Text(
                  content,
                  textDirection: textAtr.textDirection,
                  textWidthBasis: textAtr.textWidthBasis,
                  textScaleFactor: textAtr.textScaleFactor,
                ),
                style: textProps.style,
                duration: animationDuration,
                curve: animationCurve,
                onEnd: onEnd,
                softWrap: textProps.softWrap,
                textAlign: textAtr.textAlign,
                overflow: textProps.overflow,
                maxLines: textProps.maxLines,
              )
            : Text(
                content,
                softWrap: textProps.softWrap,
                textDirection: textProps.textDirection,
                textWidthBasis: textProps.textWidthBasis,
                textAlign: textProps.textAlign,
                overflow: textProps.overflow,
                maxLines: textProps.maxLines,
                textScaleFactor: textProps.textScaleFactor,
                style: textProps.style,
              ));
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
