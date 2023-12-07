import 'package:flutter/material.dart';

import '../../widgets/styled_widget.dart';
import 'container_attribute.dart';
import 'container_spec.dart';

typedef Box = StyledContainer;
typedef AnimatedBox = AnimatedStyleContainer;

class StyledContainer extends StyledWidget {
  const StyledContainer({super.style, super.key, super.inherit, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return withMix(context, (mix) {
      final spec = mix.attributeOf<ContainerSpecAttribute>()?.resolve(mix) ??
          const ContainerSpec.empty();

      return ContainerSpecWidget(spec, child: child);
    });
  }
}

class AnimatedStyleContainer extends StyledWidget {
  const AnimatedStyleContainer({
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
      final spec = mix.attributeOf<ContainerSpecAttribute>()?.resolve(mix) ??
          const ContainerSpec.empty();

      return AnimatedContainerSpecWidget(
        spec,
        curve: curve,
        duration: duration,
        child: child,
      );
    });
  }
}

class ContainerSpecWidget extends StatelessWidget {
  const ContainerSpecWidget(this.spec, {super.key, this.child});

  final Widget? child;
  final ContainerSpec spec;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: spec.alignment,
      padding: spec.padding,
      decoration: spec.decoration,
      width: spec.width,
      height: spec.height,
      constraints: spec.constraints,
      margin: spec.margin,
      transform: spec.transform,
      clipBehavior: spec.clipBehavior ?? Clip.none,
      child: child,
    );
  }
}

class AnimatedContainerSpecWidget extends StatelessWidget {
  const AnimatedContainerSpecWidget(
    this.spec, {
    super.key,
    this.child,
    this.curve,
    this.duration,
  });

  final Widget? child;
  final Curve? curve;
  final Duration? duration;
  final ContainerSpec spec;

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
