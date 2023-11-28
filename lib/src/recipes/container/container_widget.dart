import 'package:flutter/material.dart';

import '../../helpers/build_context_ext.dart';
import '../../widgets/styled_widget.dart';
import 'container_attribute.dart';

typedef Box = StyledContainer;

class StyledContainer extends StyledWidget {
  const StyledContainer({super.style, super.key, super.inherit, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final attribute = inherit
        ? context.mix?.attributeOf<ContainerMixAttribute>() ??
            const ContainerMixAttribute()
        : const ContainerMixAttribute();

    return withMix(context, (mix) {
      final mixture = attribute
          .merge(mix.attributeOf<ContainerMixAttribute>())
          .resolve(mix);

      return Container(
        alignment: mixture.alignment,
        padding: mixture.padding,
        decoration: mixture.decoration,
        constraints: mixture.constraints,
        margin: mixture.margin,
        transform: mixture.transform,
        clipBehavior: mixture.clipBehavior ?? Clip.none,
        child: child,
      );
    });
  }
}
