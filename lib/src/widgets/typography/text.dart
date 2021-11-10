import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mix/src/attributes/primitives/text/text_attributes.dart';

import '../../mixer/mix_factory.dart';
import '../../mixer/recipe_factory.dart';
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
    final mixer = Recipe.build(context, mix);
    return TextMixerWidget(mixer, text: text);
  }
}

class TextMixerWidget extends MixerWidget {
  const TextMixerWidget(
    Recipe mixer, {
    Key? key,
    required this.text,
  }) : super(mixer, key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final animated = recipe.animated;
    final animationDuration = recipe.widgetAttribute.animationDuration;
    final animationCurve = recipe.widgetAttribute.animationCurve;
    final hidden = recipe.widgetAttribute.hidden;

    final textAtr = recipe.textProps;

    if (animated) {
      return AnimatedDefaultTextStyle(
        child: Text(
          recipe.applyTextModifiers(text),
          textDirection: textAtr.textDirection,
          textWidthBasis: textAtr.textWidthBasis,
          textScaleFactor: textAtr.textScaleFactor,
        ),
        style: textStyle,
        duration: animationDuration,
        curve: animationCurve,
        onEnd: recipe.animatedText!.onEnd,
        softWrap: textAtr.softWrap,
        textAlign: textAtr.textAlign,
        overflow: textAtr.textOverflow,
        maxLines: mixtextAtrer.maxLines?.value,
      );
    }
    return Text(
      recipe.applyTextModifiers(text),
      softWrap: recipe.softWrap?.value,
      textDirection: recipe.textDirection?.value,
      textWidthBasis: recipe.textWidthBasis?.value,
      textAlign: recipe.textAlign?.value,
      overflow: recipe.textOverflow?.value,
      maxLines: recipe.maxLines?.value,
      textScaleFactor: recipe.textScaleFactor?.value,
      style: textStyle,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(
      DiagnosticsProperty<EdgeInsetsGeometry>('padding', recipe.padding?.value,
          defaultValue: null),
    );

    if (recipe.backgroundColor != null) {
      properties.add(
        DiagnosticsProperty<Color>(
            'backgroundColor', recipe.backgroundColor?.value),
      );
    }

    if (recipe.constraints != null) {
      properties.add(
        DiagnosticsProperty<BoxConstraints>(
            'constraints', recipe.constraints?.value,
            defaultValue: null),
      );
    }
    properties.add(
      DiagnosticsProperty<EdgeInsetsGeometry>('margin', recipe.margin?.value,
          defaultValue: null),
    );
  }
}
