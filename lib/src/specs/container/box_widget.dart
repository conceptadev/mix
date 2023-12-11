import 'package:flutter/material.dart';

import '../../core/styled_widget.dart';
import '../../decorators/widget_decorator_widget.dart';
import '../../factory/mix_provider_data.dart';
import 'box_attribute.dart';
import 'box_spec.dart';

typedef StyledContainer = Box;
typedef StyledAnimatedContainer = AnimatedBox;

class Box extends StyledWidget {
  const Box({super.style, super.key, super.inherit, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return withMix(context, (mix) {
      return MixedBox(mix, child: child);
    });
  }
}

class AnimatedBox extends StyledWidget {
  const AnimatedBox({
    super.style,
    super.key,
    super.inherit,
    this.child,
    this.curve,
    this.duration,
  });

  final Widget? child;
  final Curve? curve;
  final Duration? duration;

  @override
  Widget build(BuildContext context) {
    return withMix(context, (mix) {
      final spec = mix.attributeOf<BoxSpecAttribute>()?.resolve(mix) ??
          const BoxSpec.empty();

      return AnimatedBoxSpecWidget(
        spec,
        curve: curve,
        duration: duration,
        child: child,
      );
    });
  }
}

class MixedBox extends StatelessWidget {
  const MixedBox(
    this.mix, {
    super.key,
    this.child,
    this.decoratorOrder = const [],
  });

  final Widget? child;
  final MixData mix;
  final List<Type> decoratorOrder;

  @override
  Widget build(BuildContext context) {
    final spec = mix.attributeOf<BoxSpecAttribute>()?.resolve(mix);
    final current = Container(
      alignment: spec?.alignment,
      padding: spec?.padding,
      decoration: spec?.decoration,
      width: spec?.width,
      height: spec?.height,
      constraints: spec?.constraints,
      margin: spec?.margin,
      transform: spec?.transform,
      clipBehavior: spec?.clipBehavior ?? Clip.none,
      child: child,
    );

    return RenderWidgetDecorators(mix: mix, child: current);
  }
}

class AnimatedBoxSpecWidget extends StatelessWidget {
  const AnimatedBoxSpecWidget(
    this.spec, {
    super.key,
    this.child,
    this.curve,
    this.duration,
  });

  final Widget? child;
  final Curve? curve;
  final Duration? duration;
  final BoxSpec spec;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: spec.alignment,
      padding: spec.padding,
      decoration: spec.decoration,
      width: spec.width,
      height: spec.height,
      constraints: spec.constraints,
      margin: spec.margin,
      transform: spec.transform,
      clipBehavior: spec.clipBehavior ?? Clip.none,
      curve: curve ?? Curves.linear,
      duration: duration ?? const Duration(milliseconds: 150),
      child: child,
    );
  }
}
