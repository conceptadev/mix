// ignore_for_file: avoid-unnecessary-reassignment

import 'package:flutter/material.dart';

import '../../widgets/styled_widget.dart';
import 'container_mixture.dart';

typedef Box = StyledContainer;

class StyledContainer extends StyledWidget {
  const StyledContainer({super.style, super.key, super.inherit, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    ContainerMixture? inheritedMixture;
    if (inherit) {
      inheritedMixture = ContainerMixture.maybeOf(context);
    }

    return withMix(context, (data) {
      final mixture = ContainerMixture.of(context).merge(inheritedMixture);

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

// class AnimatedStyledContainer extends AnimatedStyledWidget {
//   const AnimatedStyledContainer({
//     super.style,
//     super.key,
//     super.inherit,
//     this.child,
//     this.mix,
//   });

//   @override
//   @Deprecated('Use the style parameter instead')
//   final StyleMix? mix;
//   final Widget? child;

//   @override
//   Widget build(BuildContext context) {
//     return buildWithStyle(context, (data) {
//       final spec = ContainerSpec.resolve(data);

//       return AnimatedContainer(
//         alignment: spec.alignment,
//         padding: spec.padding,
//         decoration: spec.decoration,
//         width: spec.width,
//         height: spec.height,
//         constraints: spec.constraints,
//         margin: spec.margin,
//         transform: spec.transform,
//         curve: curve,
//         duration: duration,
//         child: child,
//       );
//     });
//   }
// }
