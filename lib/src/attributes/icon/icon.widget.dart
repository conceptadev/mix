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
    return IconMixerWidget(
      mix.build(context),
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
      recipe,
      child: TweenAnimationBuilder<double?>(
        duration: props.animationDuration,
        curve: props.animationCurve,
        tween: Tween<double?>(
          end: iconProps.size,
        ),
        builder: (context, value, child) {
          return IconTheme.merge(
            data: IconThemeData(size: value),
            child: TweenAnimationBuilder<Color?>(
              duration: props.animationDuration,
              curve: props.animationCurve,
              tween: ColorTween(end: iconProps.color),
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
          color: iconProps.color,
          size: iconProps.size,
          textDirection: iconProps.textDirection,
          semanticLabel: semanticLabel,
        ),
      ),
    );
  }
}
