import 'package:flutter/material.dart';

import '../../attributes/animation/animation.attribute.dart';
import '../../attributes/text_direction/text_direction_attribute.dart';
import '../../attributes/visible/visible_attribute.dart';
import '../../factory/mix_provider_data.dart';
import '../empty/empty.widget.dart';
import '../styled.widget.dart';
import 'icon.attribute.dart';

@Deprecated('Use StyledIcon now')
typedef IconMix = StyledIcon;

@Deprecated('Use MixedIcon now')
typedef IconMixedWidget = MixedIcon;

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
    final visible = mix.mustGet<VisibleAttribute, bool>(true);
    final attributes = mix.get<IconAttributes, IconAttributesResolved>();
    final textDirection = mix.get<TextDirectionAttribute, TextDirection>();
    final animation = mix.get<AnimationAttribute, AnimationAttributeResolved>();

    if (!visible) {
      return const Empty();
    }
    Widget iconWidget = Icon(
      icon,
      size: attributes?.size,
      color: attributes?.color,
      textDirection: textDirection,
    );

    if (animation != null) {
      iconWidget = TweenAnimationBuilder<double>(
        tween: Tween<double>(end: attributes?.size),
        duration: animation.duration,
        curve: animation.curve,
        builder: (context, value, child) {
          final sizeValue = value;

          return TweenAnimationBuilder<Color?>(
            tween: ColorTween(end: attributes?.color),
            duration: animation.duration,
            curve: animation.curve,
            builder: (context, value, child) {
              final colorValue = value;

              return Icon(icon, size: sizeValue, color: colorValue);
            },
            child: child,
          );
        },
      );
    }

    return Semantics(label: semanticLabel, child: iconWidget);
  }
}
