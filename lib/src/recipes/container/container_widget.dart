import 'package:flutter/material.dart';

import '../../helpers/build_context_ext.dart';
import '../../widgets/styled_widget.dart';
import 'container_attribute.dart';
import 'container_spec.dart';

typedef Box = StyledContainer;

class StyledContainer extends StyledWidget {
  const StyledContainer({super.style, super.key, super.inherit, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final contextMix = context.mix;
    final inheritedAttribute = inherit && contextMix != null
        ? ContainerSpecAttribute.of(contextMix)
        : const ContainerSpecAttribute();

    return withMix(context, (mix) {
      final attribute = ContainerSpecAttribute.of(mix);
      final merged = inheritedAttribute.merge(attribute);

      final mixture = merged.resolve(mix);

      return MixedContainer(mixture, child: child);
    });
  }
}

class MixedContainer extends StatelessWidget {
  const MixedContainer(this.mixture, {super.key, this.child});

  final Widget? child;
  final ContainerSpec mixture;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: mixture.alignment,
      padding: mixture.padding,
      color: mixture.color,
      decoration: mixture.decoration,
      width: mixture.width,
      height: mixture.height,
      constraints: mixture.constraints,
      margin: mixture.margin,
      transform: mixture.transform,
      clipBehavior: mixture.clipBehavior ?? Clip.none,
      child: child,
    );
  }
}
