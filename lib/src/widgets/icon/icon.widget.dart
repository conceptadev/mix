import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../empty.widget.dart';

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
        createMixContext(context),
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
    final props = mixContext.iconProps;

    final sharedProps = mixContext.sharedProps;

    if (!sharedProps.visible) {
      return const Empty();
    }
    Widget iconWidget = Icon(
      icon,
      color: props.color,
      size: props.size,
      textDirection: sharedProps.textDirection,
    );

    if (sharedProps.animated) {
      iconWidget = TweenAnimationBuilder<double>(
        duration: sharedProps.animationDuration,
        curve: sharedProps.animationCurve,
        tween: Tween<double>(
          end: props.size,
        ),
        builder: (context, value, child) {
          final sizeValue = value;
          return TweenAnimationBuilder<Color?>(
            duration: sharedProps.animationDuration,
            curve: sharedProps.animationCurve,
            tween: ColorTween(end: props.color),
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
