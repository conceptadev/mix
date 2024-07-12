// ignore_for_file: prefer-named-boolean-parameters

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../core/attribute.dart';
import '../core/factory/mix_data.dart';
import '../core/modifier.dart';
import '../core/utility.dart';

/// A modifier that wraps a widget with the [Opacity] widget.
///
/// The [Opacity] widget is used to make a widget partially transparent.
final class OpacityModifierSpec
    extends WidgetModifierSpec<OpacityModifierSpec> {
  /// The [opacity] argument must not be null and
  /// must be between 0.0 and 1.0 (inclusive).
  final double opacity;
  const OpacityModifierSpec(this.opacity);

  @override
  OpacityModifierSpec lerp(OpacityModifierSpec? other, double t) {
    return OpacityModifierSpec(
      lerpDouble(opacity, other?.opacity, t) ?? opacity,
    );
  }

  @override
  OpacityModifierSpec copyWith({double? opacity}) {
    return OpacityModifierSpec(opacity ?? this.opacity);
  }

  @override
  get props => [opacity];

  @override
  Widget build(Widget child) {
    assert(
      opacity >= 0.0 && opacity <= 1.0,
      'The opacity must be between 0.0 and 1.0 (inclusive).',
    );

    return Opacity(opacity: opacity, child: child);
  }
}

final class OpacityModifierAttribute extends WidgetModifierAttribute<
    OpacityModifierAttribute, OpacityModifierSpec> {
  final double opacity;
  const OpacityModifierAttribute(this.opacity);

  @override
  OpacityModifierAttribute merge(OpacityModifierAttribute? other) {
    return OpacityModifierAttribute(other?.opacity ?? opacity);
  }

  @override
  OpacityModifierSpec resolve(MixData mix) {
    return OpacityModifierSpec(opacity);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('opacity', opacity));
  }

  @override
  get props => [opacity];
}

final class OpacityUtility<T extends Attribute>
    extends MixUtility<T, OpacityModifierAttribute> {
  const OpacityUtility(super.builder);
  T call(double value) => builder(OpacityModifierAttribute(value));
}
