import 'package:flutter/material.dart';

import '../../mix.dart';
import '../attributes/text_direction_attribute.dart';

import 'styled_widget.dart';

class StyledIcon extends StyledWidget {
  const StyledIcon(
    this.icon, {
    this.semanticLabel,
    super.style,
    super.key,
    super.inherit,
  });

  final IconData? icon;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return buildWithStyle(context, (data) {
      // Resolve style attributes
      final spec = IconSpec.resolve(data);
      

      return Icon(
        icon,
        size: spec.size,
        color: spec.color,
        textDirection: spec.textDirection,
      );
    });
  }
}

class AnimatedStyledIcon extends AnimatedStyledWidget {
  const AnimatedStyledIcon(
    this.icon, {
    this.semanticLabel,
    required super.duration,
    required super.curve,
    super.style,
    super.key,
    super.inherit,
  });

  final IconData? icon;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return buildWithStyle(context, (data) {
      // Resolve style attributes
      final spec = IconSpec.resolve(data);
      final textDirection = TextDirectionAttribute.resolve(data);

      return TweenAnimationBuilder<double>(
        tween: Tween<double>(end: spec.size),
        duration: duration,
        curve: curve,
        builder: (context, value, child) {
          final sizeValue = value;

          return TweenAnimationBuilder<Color?>(
            tween: ColorTween(end: spec.color),
            duration: duration,
            curve: curve,
            builder: (context, value, child) {
              final colorValue = value;

            return Icon(
              icon, 
              size: sizeValue, 
              color: colorValue,
              textDirection: textDirection,
            );
          },
        child: child,
      );
    });
  }
}