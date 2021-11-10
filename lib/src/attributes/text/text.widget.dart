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
    onEnd() {}
    final animated = attributes.animated;
    final animationDuration = attributes.animationDuration;
    final animationCurve = attributes.animationCurve;

    final textAtr = recipe.textProps;

    final content = recipe.applyTextDirectives(text);

    return BoxMixerWidget(
        recipe: recipe,
        child: animated
            ? AnimatedDefaultTextStyle(
                child: Text(
                  content,
                  textDirection: textAtr.textDirection,
                  textWidthBasis: textAtr.textWidthBasis,
                  textScaleFactor: textAtr.textScaleFactor,
                ),
                style: textAttributes.style,
                duration: animationDuration,
                curve: animationCurve,
                onEnd: onEnd,
                softWrap: textAttributes.softWrap,
                textAlign: textAtr.textAlign,
                overflow: textAttributes.overflow,
                maxLines: textAttributes.maxLines,
              )
            : Text(
                content,
                softWrap: textAttributes.softWrap,
                textDirection: textAttributes.textDirection,
                textWidthBasis: textAttributes.textWidthBasis,
                textAlign: textAttributes.textAlign,
                overflow: textAttributes.overflow,
                maxLines: textAttributes.maxLines,
                textScaleFactor: textAttributes.textScaleFactor,
                style: textAttributes.style,
              ));
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(
      DiagnosticsProperty<EdgeInsetsGeometry>(
        'padding',
        boxAttributes.padding,
        defaultValue: null,
      ),
    );

    // if (recipe.backgroundColor != null) {
    //   properties.add(
    //     DiagnosticsProperty<Color>(
    //         'backgroundColor', recipe.backgroundColor?.value),
    //   );
    // }

    // if (recipe.constraints != null) {
    //   properties.add(
    //     DiagnosticsProperty<BoxConstraints>(
    //         'constraints', recipe.constraints?.value,
    //         defaultValue: null),
    //   );
    // }
    // properties.add(
    //   DiagnosticsProperty<EdgeInsetsGeometry>('margin', recipe.margin?.value,
    //       defaultValue: null),
    // );
  }
}
