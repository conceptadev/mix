import 'package:flutter/material.dart';

import '../../attributes/shared/shared.descriptor.dart';
import '../empty.widget.dart';
import '../mix.widget.dart';
import '../mix_context_builder.dart';
import 'icon.props.dart';

class IconMix extends MixWidget {
  const IconMix(
    this.icon, {
    this.semanticLabel,
    super.mix,
    super.key,
    super.variants,
    super.inherit,
  });

  final IconData? icon;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return MixContextBuilder(
      mix: mix,
      inherit: inherit,
      variants: variants,
      builder: (context, mixContext) {
        final iconProps = IconProps.fromContext(context);
        final commonProps = CommonDescriptor.fromContext(context);

        return IconMixerWidget(
          iconProps: iconProps,
          commonProps: commonProps,
          icon: icon,
        );
      },
    );
  }
}

class IconMixerWidget extends StatelessWidget {
  const IconMixerWidget({
    required this.iconProps,
    required this.commonProps,
    this.icon,
    this.semanticLabel,
    super.key,
  });

  final IconData? icon;
  final IconProps iconProps;
  final CommonDescriptor commonProps;

  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    if (!commonProps.visible) {
      return const Empty();
    }
    Widget iconWidget = Icon(
      icon,
      color: iconProps.color,
      size: iconProps.size,
      textDirection: commonProps.textDirection,
    );

    if (commonProps.animated) {
      iconWidget = TweenAnimationBuilder<double>(
        duration: commonProps.animationDuration,
        curve: commonProps.animationCurve,
        tween: Tween<double>(
          end: iconProps.size,
        ),
        builder: (context, value, child) {
          final sizeValue = value;

          return TweenAnimationBuilder<Color?>(
            duration: commonProps.animationDuration,
            curve: commonProps.animationCurve,
            tween: ColorTween(end: iconProps.color),
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

    return Semantics(
      label: semanticLabel,
      child: iconWidget,
    );
  }
}
