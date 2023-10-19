import 'package:flutter/material.dart';

import '../../attributes/text/text_direction/text_direction.attribute.dart';
import '../../factory/mix_provider.dart';
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
    return withMix(context, MixedIcon(icon: icon));
  }
}

class MixedIcon extends StatelessWidget {
  const MixedIcon({this.icon, super.key, this.semanticLabel});

  final IconData? icon;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final mix = MixProvider.of(context);

    final attributes = mix.maybeGet<IconAttributes, IconSpec>();
    final textDirection = mix.maybeGet<TextDirectionAttribute, TextDirection>();
    final common = mix.commonSpec;

    if (!common.visible) {
      return const Empty();
    }
    Widget iconWidget = Icon(
      icon,
      size: attributes?.size,
      color: attributes?.color,
      textDirection: textDirection,
    );

    if (mix.animated) {
      iconWidget = TweenAnimationBuilder<double>(
        tween: Tween<double>(end: attributes?.size),
        duration: common.animation.duration,
        curve: common.animation.curve,
        builder: (context, value, child) {
          final sizeValue = value;

          return TweenAnimationBuilder<Color?>(
            tween: ColorTween(end: attributes?.color),
            duration: common.animation.duration,
            curve: common.animation.curve,
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
