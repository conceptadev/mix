import 'package:flutter/material.dart';

import '../../core/styled_widget.dart';
import 'icon_spec.dart';

class StyledIcon extends StyledWidget {
  const StyledIcon(
    this.icon, {
    this.semanticLabel,
    super.style,
    super.key,
    super.inherit = true,
    this.textDirection,
    super.orderOfDecorators = const [],
  });

  final IconData? icon;
  final String? semanticLabel;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return withMix(context, (mix) {
      final spec = IconSpec.of(mix);

      return mix.isAnimated
          ? AnimatedMixedIcon(
              icon: icon,
              spec: spec,
              semanticLabel: semanticLabel,
              textDirection: textDirection,
              curve: mix.animation!.curve,
              duration: mix.animation!.duration,
            )
          : MixedIcon(
              icon,
              spec: spec,
              semanticLabel: semanticLabel,
              textDirection: textDirection,
            );
    });
  }
}

class MixedIcon extends StatelessWidget {
  const MixedIcon(
    this.icon, {
    this.spec,
    this.semanticLabel,
    super.key,
    this.textDirection,
    this.decoratorOrder = const [],
  });

  final IconData? icon;
  final IconSpec? spec;
  final String? semanticLabel;
  final TextDirection? textDirection;
  final List<Type> decoratorOrder;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: spec?.size,
      fill: spec?.fill,
      weight: spec?.weight,
      grade: spec?.grade,
      opticalSize: spec?.opticalSize,
      color: spec?.color,
      shadows: spec?.shadows,
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
    super.orderOfDecorators = const [],
  });

  final AnimatedIconData icon;
  final String? semanticLabel;
  final Animation<double> progress;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return withMix(context, (mix) {
      final spec = IconSpec.of(mix);

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

class AnimatedMixedIcon extends ImplicitlyAnimatedWidget {
  const AnimatedMixedIcon({
    required this.icon,
    required this.spec,
    super.key,
    this.semanticLabel,
    this.textDirection,
    this.decoratorOrder = const [],
    Curve curve = Curves.linear,
    required Duration duration,
    VoidCallback? onEnd,
  }) : super(curve: curve, duration: duration, onEnd: onEnd);

  final IconData? icon;
  final IconSpec spec;
  final String? semanticLabel;
  final TextDirection? textDirection;
  final List<Type> decoratorOrder;

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedMixedIconState createState() => _AnimatedMixedIconState();
}

class _AnimatedMixedIconState
    extends AnimatedWidgetBaseState<AnimatedMixedIcon> {
  IconSpecTween? _spec;

  @override
  // ignore: avoid-dynamic
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _spec = visitor(
      _spec,
      widget.spec,
      // ignore: avoid-dynamic
      (dynamic value) => IconSpecTween(begin: value as IconSpec?),
    ) as IconSpecTween?;
  }

  @override
  Widget build(BuildContext context) {
    final spec = _spec?.evaluate(animation);

    return MixedIcon(
      widget.icon,
      spec: spec,
      semanticLabel: widget.semanticLabel,
      textDirection: widget.textDirection,
    );
  }
}
