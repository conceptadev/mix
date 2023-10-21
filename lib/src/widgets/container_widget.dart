// ignore_for_file: avoid-unnecessary-reassignment

import 'package:flutter/material.dart';

import '../attributes/container_attribute.dart';
import '../core/decorators/widget_decorator_wrapper.dart';
import '../factory/mix_provider.dart';
import 'empty_widget.dart';
import 'styled_widget.dart';

@Deprecated('Use MixedContainer now')
typedef BoxMixedWidget = MixedContainer;

typedef Box = StyledContainer;

class StyledContainer extends StyledWidget {
  const StyledContainer({
    @Deprecated('Use the style parameter instead') super.mix,
    super.style,
    super.key,
    super.variants,
    super.inherit,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return withMix(context, MixedContainer(child: child));
  }
}

class MixedContainer extends StatelessWidget {
  const MixedContainer({this.child, super.key, this.animated = false});

  // Child Widget.
  final Widget? child;
  final bool animated;

  @override
  Widget build(BuildContext context) {
    final mix = MixProvider.of(context);
    final spec = mix.spec<ContainerSpec>();
    final animationDuration = mix.commonSpec.animationDuration;
    final animationCurve = mix.commonSpec.animationCurve;
    final visible = mix.commonSpec.visible;

    if (!visible) {
      return const Empty();
    }
    Widget? current = child;

    current = mix.animated
        ? AnimatedContainer(
            alignment: spec.alignment,
            padding: spec.padding,
            color: spec.color,
            decoration: spec.decoration,
            width: spec.width,
            height: spec.height,
            constraints: spec.constraints,
            margin: spec.margin,
            transform: spec.transform,
            curve: animationCurve,
            duration: animationDuration,
            child: current,
          )
        : Container(
            alignment: spec.alignment,
            padding: spec.padding,
            color: spec.color,
            decoration: spec.decoration,
            width: spec.width,
            height: spec.height,
            constraints: spec.constraints,
            margin: spec.margin,
            transform: spec.transform,
            child: current,
          );
    // Wrap parent decorators.
    current = WidgetDecoratorWrapper(mix, child: current);

    return current;
  }
}
