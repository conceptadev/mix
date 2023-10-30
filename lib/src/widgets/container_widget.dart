// ignore_for_file: avoid-unnecessary-reassignment

import 'package:flutter/material.dart';

import '../specs/container_spec.dart';
import 'styled_widget.dart';

typedef Box = StyledContainer;

class StyledContainer extends StyledWidget {
  const StyledContainer({super.style, super.key, super.inherit, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return buildWithStyle(context, (data) {
      final spec = ContainerSpec.resolve(data);

      return Container(
        alignment: spec.alignment,
        padding: spec.padding,
        decoration: spec.decoration,
        width: spec.width,
        height: spec.height,
        constraints: spec.constraints,
        margin: spec.margin,
        transform: spec.transform,
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
