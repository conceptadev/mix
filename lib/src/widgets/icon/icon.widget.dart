import 'package:flutter/material.dart';

import '../../attributes/shared/shared.descriptor.dart';
import '../../factory/mix_provider_data.dart';
import '../empty/empty.widget.dart';
import '../mix.widget.dart';
import '../mix_context_builder.dart';
import 'icon.descriptor.dart';

class IconMix extends MixWidget {
  const IconMix(
    this.icon, {
    this.semanticLabel,
    @Deprecated('Use the style parameter instead') super.mix,
    super.style,
    super.key,
    super.inherit,
    super.variants,
  });

  final IconData? icon;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return MixBuilder(
      style: style,
      variants: variants,
      builder: (mix) {
        return IconMixerWidget(
          mix: mix,
          icon: icon,
        );
      },
    );
  }
}

class IconMixerWidget extends StatelessWidget {
  const IconMixerWidget({
    required this.mix,
    this.icon,
    this.semanticLabel,
    super.key,
  });

  final IconData? icon;
  final MixData mix;

  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final commonProps = CommonDescriptor.fromContext(mix);
    final iconProps = IconDescriptor.fromContext(mix);

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
