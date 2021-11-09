import 'package:flutter/material.dart';

import '../../../mix.dart';
import '../../mixer/mix_factory.dart';
import '../../mixer/mixer.dart';
import '../mix_widget.dart';

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
    final mixer = Mixer.build(context, mix);
    return IconMixerWidget(
      mixer,
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
    return BoxMixerWidget(
      mixer,
      child: TweenAnimationBuilder<double?>(
        duration: mixer.boxAttribute.animationDuration ?? Duration.zero,
        curve: mixer.iconSize?.animationCurve ?? Curves.linear,
        tween: Tween<double?>(
          end: mixer.iconSize?.value ?? IconTheme.of(context).size ?? 24.0,
        ),
        builder: (context, value, child) {
          return IconTheme.merge(
            data: IconThemeData(size: value),
            child: TweenAnimationBuilder<Color?>(
              duration: mixer.iconColor?.animationDuration ?? Duration.zero,
              curve: mixer.iconColor?.animationCurve ?? Curves.linear,
              tween: ColorTween(end: mixer.iconColor?.value),
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
          textDirection: mixer.textDirection?.value,
          semanticLabel: semanticLabel,
        ),
      ),
    );
  }
}
