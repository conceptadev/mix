import 'package:flutter/material.dart';

import '../mixer/mix_context.dart';
import '../mixer/mix_factory.dart';
import '../variants/variants.dart';
import 'empty.widget.dart';
import 'mixable.widget.dart';

/// The _Mix_ corollary to Flutter _Icon_ widget
///
/// ## Attributes
/// - [IconAttributes](IconAttributes-class.html)
/// - [SharedAttributes](SharedAttributes-class.html)
/// ## Utilities
/// - [IconUtils](IconUtils-class.html)
/// - [SharedUtils](SharedUtils-class.html)
///
/// {@category Mixable Widgets}
class IconMix extends MixableWidget {
  const IconMix(
    this.icon, {
    Mix? mix,
    this.semanticLabel,
    Key? key,
    List<Variant>? variants,
    bool? inherit,
  }) : super(
          mix,
          variants: variants,
          inherit: inherit,
          key: key,
        );

  final IconData? icon;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      child: IconMixerWidget(
        getMixContext(context),
        icon: icon,
      ),
    );
  }
}

/// {@nodoc}
class IconMixerWidget extends MixedWidget {
  const IconMixerWidget(
    MixContext mixContext, {
    this.icon,
    Key? key,
  }) : super(mixContext, key: key);

  final IconData? icon;

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
