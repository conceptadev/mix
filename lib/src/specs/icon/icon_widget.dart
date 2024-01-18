import 'package:flutter/material.dart';

import '../../core/styled_widget.dart';
import '../../decorators/widget_decorator_widget.dart';
import '../../factory/mix_provider.dart';
import '../../factory/mix_provider_data.dart';
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

    return RenderWidgetDecorators(
      mix: mix,
      child: IconSpecWidget(
        spec: spec,
        semanticLabel: semanticLabel,
        textDirection: textDirection,
        icon: icon,
      ),
    );
  }
}

class IconSpecWidget extends StatelessWidget {
  const IconSpecWidget({
    super.key,
    required this.spec,
    this.semanticLabel,
    this.textDirection,
    this.icon,
  });

  final IconSpec spec;

  final IconData? icon;

  final String? semanticLabel;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: spec.size,
      color: spec.color,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
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
