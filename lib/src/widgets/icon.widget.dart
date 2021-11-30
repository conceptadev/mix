import 'package:flutter/material.dart';
import 'package:mix/src/widgets/nothing.widget.dart';

import '../mixer/mix_factory.dart';
import '../mixer/mixer.dart';
import 'mix.widget.dart';

class IconMix extends MixWidget {
  const IconMix({
    Mix? mix,
    required this.icon,
    this.semanticLabel,
    Key? key,
  }) : super(mix, key: key);

  final IconData icon;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return IconMixerWidget(
      mix.createContext(context),
      icon: icon,
      semanticLabel: semanticLabel,
    );
  }
}

class IconMixerWidget extends MixedWidget {
  const IconMixerWidget(
    MixContext mixContext, {
    required this.icon,
    this.semanticLabel,
    Key? key,
  }) : super(mixContext, key: key);

  final IconData icon;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    if (!sharedMixer.visible) {
      return const Empty();
    }
    Widget iconWidget = Icon(
      icon,
      color: iconMixer.color,
      size: iconMixer.size,
      textDirection: sharedMixer.textDirection,
      semanticLabel: semanticLabel,
    );

    if (sharedMixer.animated) {
      iconWidget = TweenAnimationBuilder<double>(
        duration: sharedMixer.animationDuration,
        curve: sharedMixer.animationCurve,
        tween: Tween<double>(
          end: iconMixer.size ?? 24,
        ),
        builder: (context, value, child) {
          return IconTheme.merge(
            data: IconThemeData(size: value),
            child: TweenAnimationBuilder<Color?>(
              duration: sharedMixer.animationDuration,
              curve: sharedMixer.animationCurve,
              tween: ColorTween(end: iconMixer.color),
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

    return iconWidget;
  }
}
