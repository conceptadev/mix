import 'package:flutter/material.dart';

import '../mixer/mix_factory.dart';
import '../mixer/mixer.dart';
import 'mix.widget.dart';

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
    Mixer mixer, {
    required this.icon,
    this.semanticLabel,
    Key? key,
  }) : super(mixer, key: key);

  final IconData icon;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final iconWidget = Icon(
      icon,
      color: iconProps.color,
      size: iconProps.size,
      textDirection: textDirection,
      semanticLabel: semanticLabel,
    );

    if (!animated) {
      return iconWidget;
    } else {
      return TweenAnimationBuilder<double?>(
        duration: animationDuration,
        curve: animationCurve,
        tween: Tween<double?>(
          end: iconProps.size,
        ),
        builder: (context, value, child) {
          return IconTheme.merge(
            data: IconThemeData(size: value),
            child: TweenAnimationBuilder<Color?>(
              duration: animationDuration,
              curve: animationCurve,
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
        child: iconWidget,
      );
    }
  }
}
