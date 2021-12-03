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
    this.variant,
    this.inherit = true,
  }) : super(mix, key: key);

  final IconData icon;
  final String? semanticLabel;
  final String? variant;
  final bool inherit;

  @override
  Widget build(BuildContext context) {
    MixContext mixCtx = MixContext.create(
      context,
      mix,
      inherit: inherit,
    );

    return IconMixerWidget(
      mixCtx,
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
          end: iconMixer.size,
        ),
        builder: (context, value, child) {
          final sizeValue = value;
          return TweenAnimationBuilder<Color?>(
            duration: sharedMixer.animationDuration,
            curve: sharedMixer.animationCurve,
            tween: ColorTween(end: iconMixer.color),
            child: child,
            builder: (context, value, child) {
              final colorValue = value;

              return Icon(
                icon,
                color: colorValue,
                size: sizeValue,
              );
            },
          );
        },
      );
    }

    return iconWidget;
  }
}
