import 'package:flutter/material.dart';

import '../specs/icon_spec.dart';
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
        semanticLabel: semanticLabel,
        textDirection: spec.textDirection,
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
  });

  final AnimatedIconData icon;
  final String? semanticLabel;
  final Animation<double> progress;

  @override
  Widget build(BuildContext context) {
    return buildWithStyle(context, (data) {
      // Resolve style attributes
      final spec = IconSpec.resolve(data);

      return AnimatedIcon(
        icon: icon,
        progress: progress,
        color: spec.color,
        size: spec.size,
        semanticLabel: semanticLabel,
        textDirection: spec.textDirection,
      );
    });
  }
}
