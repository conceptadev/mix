import 'package:flutter/material.dart';
import 'package:mix/src/attributes/box/box.widget.dart';

import '../../../mix.dart';
import '../../mixer/mix_factory.dart';
import '../../mixer/recipe_factory.dart';
import '../../widgets/mix_widget.dart';

class IconMix extends MixWidget {
  const IconMix(
    Mix mix, {
    required this.icon,
    this.semanticLabel,
    Key? key,
  }) : super(mix, key: key);

  final IconData icon;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final mixer = Recipe.build(context, mix);
    return IconMixerWidget(
      mixer,
      icon: icon,
      semanticLabel: semanticLabel,
    );
  }
}

class IconMixerWidget extends MixerWidget {
  const IconMixerWidget(
    Recipe mixer, {
    required this.icon,
    this.semanticLabel,
    Key? key,
  }) : super(mixer, key: key);

  final IconData icon;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return BoxMixerWidget(
      recipe: recipe,
      child: TweenAnimationBuilder<double?>(
        duration: attributes.animationDuration,
        curve: recipe.iconSize?.animationCurve ?? Curves.linear,
        tween: Tween<double?>(
          end: recipe.iconSize?.value ?? IconTheme.of(context).size ?? 24.0,
        ),
        builder: (context, value, child) {
          return IconTheme.merge(
            data: IconThemeData(size: value),
            child: TweenAnimationBuilder<Color?>(
              duration: recipe.iconColor?.animationDuration ?? Duration.zero,
              curve: recipe.iconColor?.animationCurve ?? Curves.linear,
              tween: ColorTween(end: recipe.iconColor?.value),
              child: child,
              builder: (context, value, child) {
                if (value == null) {
                  return child!;
                }
                return IconTheme.merge(
                  data: IconThemeData(color: value),
                  child: child!,
                );
              },
            ),
          );
        },
        child: Icon(
          icon,
          textDirection: recipe.textDirection?.value,
          semanticLabel: semanticLabel,
        ),
      ),
    );
  }
}
