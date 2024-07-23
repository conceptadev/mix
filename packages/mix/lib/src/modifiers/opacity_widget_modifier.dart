// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../core/attribute.dart';
import '../core/factory/mix_data.dart';
import '../core/factory/mix_provider.dart';
import '../core/helpers.dart';
import '../core/modifier.dart';
import '../core/spec.dart';
import '../core/utility.dart';
import '../internal/diagnostic_properties_builder_ext.dart';

part 'opacity_widget_modifier.g.dart';

/// A modifier that wraps a widget with the [Opacity] widget.
///
/// The [Opacity] widget is used to make a widget partially transparent.
@MixableSpec()
final class OpacitySpec extends Spec<OpacitySpec>
    with _$OpacitySpec, ModifierSpecMixin {
  @MixableProperty(utilities: [MixableUtility(alias: '_opacity')])
  final double? opacity;
  const OpacitySpec({this.opacity});

  static const of = _$OpacitySpec.of;
  static const from = _$OpacitySpec.from;

  @override
  Widget build(Widget child) {
    return Opacity(opacity: opacity ?? 1.0, child: child);
  }
}

extension OpacitySpecUtilityX<T extends Attribute> on OpacitySpecUtility<T> {
  T call(double value) => _opacity(value);
}

/// A modifier that wraps a widget with the [Opacity] widget.
///
/// The [Opacity] widget is used to make a widget partially transparent.
@Deprecated('Use OpacitySpec instead')
final class OpacityModifierSpec extends OpacitySpec {
  const OpacityModifierSpec(double opacity) : super(opacity: opacity);
}

@Deprecated('Use OpacitySpecAttribute instead')
final class OpacityModifierAttribute extends OpacitySpecAttribute {
  const OpacityModifierAttribute(double opacity) : super(opacity: opacity);
}

@Deprecated('Use OpacitySpecUtility instead')
typedef OpacityUtility = OpacitySpecUtility;
