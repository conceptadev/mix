// // ignore_for_file: prefer-named-boolean-parameters

// import 'dart:ui';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/widgets.dart';

// import '../core/attribute.dart';
// import '../core/factory/mix_data.dart';
// import '../core/modifier.dart';
// import '../core/utility.dart';
// import '../internal/diagnostic_properties_builder_ext.dart';

// /// A modifier that wraps a widget with the [MouseRegion] widget.
// ///
// /// The [MouseRegion] widget is used to make a widget partially transparent.
// final class MouseRegionSpec extends ModifierSpec<MouseRegionSpec> {
//   /// The [opacity] argument must not be null and
//   /// must be between 0.0 and 1.0 (inclusive).
//   final double opacity;
//   const MouseRegionSpec(this.opacity);

//   @override
//   MouseRegionSpec lerp(MouseRegionSpec? other, double t) {
//     return MouseRegionSpec(
//       lerpDouble(opacity, other?.opacity, t) ?? opacity,
//     );
//   }

//   @override
//   MouseRegionSpec copyWith({double? opacity}) {
//     return MouseRegionSpec(opacity ?? this.opacity);
//   }

//   @override
//   get props => [opacity];

//   @override
//   Widget build(Widget child) {
//     assert(
//       opacity >= 0.0 && opacity <= 1.0,
//       'The opacity must be between 0.0 and 1.0 (inclusive).',
//     );

//     return Opacity(opacity: opacity, child: child);
//   }
// }

// final class OpacityModifierAttribute
//     extends ModifierSpecAttribute<MouseRegionSpec> {
//   final double opacity;
//   const OpacityModifierAttribute(this.opacity);

//   @override
//   OpacityModifierAttribute merge(OpacityModifierAttribute? other) {
//     return OpacityModifierAttribute(other?.opacity ?? opacity);
//   }

//   @override
//   MouseRegionSpec resolve(MixData mix) {
//     return MouseRegionSpec(opacity);
//   }

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.addUsingDefault('opacity', opacity);
//   }

//   @override
//   get props => [opacity];
// }

// final class OpacityUtility<T extends Attribute>
//     extends MixUtility<T, OpacityModifierAttribute> {
//   const OpacityUtility(super.builder);
//   T call(double value) => builder(OpacityModifierAttribute(value));
// }
