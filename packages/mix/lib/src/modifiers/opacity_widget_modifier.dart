// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../core/attribute.dart';
import '../core/factory/mix_data.dart';
import '../core/factory/mix_provider.dart';
import '../core/helpers.dart';
import '../core/modifier.dart';
import '../core/utility.dart';
import '../internal/diagnostic_properties_builder_ext.dart';

part 'opacity_widget_modifier.g.dart';

/// A modifier that wraps a widget with the [Opacity] widget.
///
/// The [Opacity] widget is used to make a widget partially transparent.
@MixableSpec(prefix: 'OpacityModifier', skipUtility: true)
final class OpacityModifierSpec extends WidgetModifierSpec<OpacityModifierSpec>
    with _$OpacityModifierSpec {
  /// The [opacity] argument must not be null and
  /// must be between 0.0 and 1.0 (inclusive).
  final double opacity;
  const OpacityModifierSpec([double? opacity]) : opacity = opacity ?? 1.0;

  @override
  Widget build(Widget child) {
    return Opacity(opacity: opacity, child: child);
  }
}

final class OpacityModifierUtility<T extends Attribute>
    extends MixUtility<T, OpacityModifierAttribute> {
  const OpacityModifierUtility(super.builder);
  T call(double value) => builder(OpacityModifierAttribute(opacity: value));
}
