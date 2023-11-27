import 'package:flutter/material.dart';

import '../recipes/icon/icon_mixture.dart';
import 'styled_widget.dart';

class StyledIcon extends StyledWidget {
  const StyledIcon(
    this.icon, {
    this.semanticLabel,
    super.style,
    super.key,
    super.inherit,
    this.textDirection,
  });

  final IconData? icon;
  final String? semanticLabel;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return withMix(context, (data) {
      // Resolve style attributes
      final spec = IconMixture.resolve(data);

      return Icon(
        icon,
        size: spec.size,
        color: spec.color,
        semanticLabel: semanticLabel,
        textDirection: textDirection,
      );
    });
  }
}

class AnimatedStyledIcon extends StyledWidget {
  const AnimatedStyledIcon(
    this.icon, {
    this.semanticLabel,
    super.style,
    super.key,
    required this.progress,
    super.inherit,
    this.textDirection,
  });

  final AnimatedIconData icon;
  final String? semanticLabel;
  final Animation<double> progress;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return withMix(context, (data) {
      // Resolve style attributes
      final spec = IconMixture.resolve(data);

      return AnimatedIcon(
        icon: icon,
        progress: progress,
        color: spec.color,
        size: spec.size,
        semanticLabel: semanticLabel,
        textDirection: textDirection,
      );
    });
  }
}
