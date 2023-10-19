// import 'package:flutter/material.dart';

// import '../../factory/exports.dart';
// import '../style_attribute.dart';

// class AnimationAttribute extends StyleAttribute<AnimationSpec> {
//   @protected
//   final Duration? duration;

//   @protected
//   final Curve? curve;

//   const AnimationAttribute({this.duration, this.curve});

//   @override
//   AnimationAttribute merge(AnimationAttribute? other) {
//     if (other == null) return this;

//     return AnimationAttribute(
//       duration: other.duration ?? duration,
//       curve: other.curve ?? curve,
//     );
//   }

//   @override
//   AnimationSpec resolve(MixData mix) {
//     return AnimationSpec(
//       duration: duration ?? const Duration(milliseconds: 200),
//       curve: curve ?? Curves.linear,
//     );
//   }

//   @override
//   get props => [duration, curve];
// }

// class AnimationSpec extends Spec<AnimationSpec> {
//   final Duration duration;
//   final Curve curve;

//   static const defaults = AnimationSpec(
//     duration: Duration(milliseconds: 200),
//     curve: Curves.linear,
//   );

//   const AnimationSpec({required this.duration, required this.curve});

//   @override
//   get props => [duration, curve];
// }
