import 'package:flutter/material.dart';

import '../../core/styled_widget.dart';
import '../../factory/mix_provider.dart';
import '../../factory/mix_provider_data.dart';
import '../../utils/helper_util.dart';
import 'icon_attribute.dart';
import 'icon_spec.dart';

class StyledIcon extends StyledWidget {
  const StyledIcon(
    this.icon, {
    this.semanticLabel,
    super.style,
    super.key,
    super.inherit = true,
    this.textDirection,
  });

  final IconData? icon;
  final String? semanticLabel;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return withMix(context, (mix) {
      return MixedIcon(
        icon,
        semanticLabel: semanticLabel,
        textDirection: textDirection,
      );
    });
  }
}

class MixedIcon extends StatelessWidget {
  const MixedIcon(
    this.icon, {
    this.mix,
    this.semanticLabel,
    super.key,
    this.textDirection,
    this.decoratorOrder = const [],
  });

  final IconData? icon;
  final MixData? mix;
  final String? semanticLabel;
  final TextDirection? textDirection;
  final List<Type> decoratorOrder;

  @override
  Widget build(BuildContext context) {
    final mix = this.mix ?? MixProvider.of(context);
    final spec = IconSpec.of(mix);

    final current = Icon(
      icon,
      size: spec.size,
      color: spec.color,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
    );

    return shouldApplyDecorators(
      mix: mix,
      orderOfDecorators: decoratorOrder,
      child: current,
    );
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
    return withMix(context, (mix) {
      final spec = mix.attributeOf<IconSpecAttribute>()?.resolve(mix) ??
          const IconSpec.empty();

      return shouldApplyDecorators(
        mix: mix,
        child: AnimatedIcon(
          icon: icon,
          progress: progress,
          color: spec.color,
          size: spec.size,
          semanticLabel: semanticLabel,
          textDirection: textDirection,
        ),
      );
    });
  }
}
