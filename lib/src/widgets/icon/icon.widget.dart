import 'package:flutter/material.dart';

import '../../mixer/mix_factory.dart';
import '../../variants/variant.dart';
import '../mix.widget.dart';
import '../nothing.widget.dart';
import 'icon.props.dart';

class IconMix extends MixWidget {
  const IconMix(
    this.icon, {
    Mix? mix,
    this.semanticLabel,
    Key? key,
    List<Variant>? variants,
    bool inherit = true,
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
class IconMixerWidget extends StatelessWidget {
  const IconMixerWidget(
    this.props, {
    this.icon,
    Key? key,
  }) : super(key: key);

  final IconData? icon;
  final IconProps props;

  @override
  Widget build(BuildContext context) {
    if (!props.visible) {
      return const Nothing();
    }
    Widget iconWidget = Icon(
      icon,
      color: props.color,
      size: props.size,
      textDirection: props.textDirection,
    );

    if (props.animated) {
      iconWidget = TweenAnimationBuilder<double>(
        duration: props.animationDuration,
        curve: props.animationCurve,
        tween: Tween<double>(
          end: props.size,
        ),
        builder: (context, value, child) {
          final sizeValue = value;

          return TweenAnimationBuilder<Color?>(
            duration: props.animationDuration,
            curve: props.animationCurve,
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
