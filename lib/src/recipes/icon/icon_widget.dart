import 'package:flutter/material.dart';

import '../../helpers/build_context_ext.dart';
import '../../widgets/styled_widget.dart';
import 'icon_attribute.dart';

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
    final contextMix = context.mix;
    final inheritedAttribute = inherit && contextMix != null
        ? IconMixAttribute.of(contextMix)
        : const IconMixAttribute();

    return withMix(context, (mix) {
      final attribute = IconMixAttribute.of(mix);
      final merged = inheritedAttribute.merge(attribute);

      final mixture = merged.resolve(mix);

      return Icon(
        icon,
        size: mixture.size,
        color: mixture.color,
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
    final inheritedAttribute = inherit && context.mix != null
        // ignore: avoid-non-null-assertion
        ? IconMixAttribute.of(context.mix!)
        : const IconMixAttribute();

    return withMix(context, (mix) {
      final attribute = IconMixAttribute.of(mix);
      final merged = inheritedAttribute.merge(attribute);

      final mixture = merged.resolve(mix);

      return AnimatedIcon(
        icon: icon,
        progress: progress,
        color: mixture.color,
        size: mixture.size,
        semanticLabel: semanticLabel,
        textDirection: textDirection,
      );
    });
  }
}
