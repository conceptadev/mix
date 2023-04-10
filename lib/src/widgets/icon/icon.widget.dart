import 'package:flutter/material.dart';

import '../../attributes/shared/shared.descriptor.dart';
import '../../factory/mix_provider_data.dart';
import '../empty/empty.widget.dart';
import '../mix_context_builder.dart';
import '../styled.widget.dart';
import 'icon.descriptor.dart';

@Deprecated('Use StyledIcon now')
typedef IconMix = StyledIcon;

class StyledIcon extends StyledWidget {
  const StyledIcon(
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
        return MixedIcon(
          mix: mix,
          icon: icon,
        );
      },
    );
  }
}

@Deprecated('Use MixedIcon now')
typedef IconMixedWidget = MixedIcon;

class MixedIcon extends StatelessWidget {
  const MixedIcon({
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
    final iconProps = StyledIconDescriptor.fromContext(mix);

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
