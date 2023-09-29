import 'package:flutter/material.dart';

import '../../attributes/shared/shared.descriptor.dart';
import '../../factory/mix_provider_data.dart';
import '../empty/empty.widget.dart';
import '../styled.widget.dart';
import 'icon.descriptor.dart';

@Deprecated('Use StyledIcon now')
typedef IconMix = StyledIcon;

class StyledIcon extends StyledWidget {
  const StyledIcon(
    this.icon, {
    super.inherit,
    super.key,
    @Deprecated('Use the style parameter instead') super.mix,
    this.semanticLabel,
    super.style,
    super.variants,
  });

  final IconData? icon;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return buildWithMix(context, (mix) => MixedIcon(icon: icon, mix: mix));
  }
}

@Deprecated('Use MixedIcon now')
typedef IconMixedWidget = MixedIcon;

class MixedIcon extends StatelessWidget {
  const MixedIcon({
    this.icon,
    super.key,
    required this.mix,
    this.semanticLabel,
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
      size: iconProps.size,
      color: iconProps.color,
      textDirection: commonProps.textDirection,
    );

    if (commonProps.animated) {
      iconWidget = TweenAnimationBuilder<double>(
        tween: Tween<double>(end: iconProps.size),
        duration: commonProps.animationDuration,
        curve: commonProps.animationCurve,
        builder: (context, value, child) {
          final sizeValue = value;

          return TweenAnimationBuilder<Color?>(
            tween: ColorTween(end: iconProps.color),
            duration: commonProps.animationDuration,
            curve: commonProps.animationCurve,
            builder: (context, value, child) {
              final colorValue = value;

              return Icon(icon, size: sizeValue, color: colorValue);
            },
            child: child,
          );
        },
      );
    }

    return Semantics(child: iconWidget, label: semanticLabel);
  }
}
