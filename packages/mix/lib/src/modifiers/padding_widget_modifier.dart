// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../attributes/spacing/edge_insets_dto.dart';
import '../attributes/spacing/spacing_util.dart';
import '../core/attribute.dart';
import '../core/factory/mix_data.dart';
import '../core/factory/mix_provider.dart';
import '../core/modifier.dart';
import '../core/spec.dart';
import '../internal/diagnostic_properties_builder_ext.dart';

part 'padding_widget_modifier.g.dart';

/// A modifier that wraps a widget with the [Padding] widget.
///
/// The [Padding] widget is used to add padding around a widget.
@MixableSpec()
final class PaddingSpec extends Spec<PaddingSpec>
    with _$PaddingSpec, ModifierSpecMixin {
  final EdgeInsetsGeometry? padding;
  const PaddingSpec._({this.padding});
  factory PaddingSpec({EdgeInsetsGeometry? padding}) =>
      PaddingSpec._(padding: padding);

  static const of = _$PaddingSpec.of;
  static const from = _$PaddingSpec.from;

  @override
  Widget build(Widget child) {
    return Padding(padding: padding ?? EdgeInsets.zero, child: child);
  }
}

extension PaddingSpecUtilityX<T extends Attribute> on PaddingSpecUtility<T> {
  // TODO: This is inconsistent with other utilities. Should be `call` instead of `only`.
  T call(EdgeInsetsGeometryDto padding) => only(padding: padding);
}

/// A modifier that wraps a widget with the [Padding] widget.
///
/// The [Padding] widget is used to add padding around a widget.
@Deprecated('Use PaddingSpec instead')
final class PaddingModifierSpec extends PaddingSpec {
  const PaddingModifierSpec(EdgeInsetsGeometry padding)
      : super(padding: padding);
}

@Deprecated('Use PaddingSpecAttribute instead')
final class PaddingModifierAttribute extends PaddingSpecAttribute {
  const PaddingModifierAttribute(EdgeInsetsGeometryDto padding)
      : super(padding: padding);
}

@Deprecated('Use PaddingSpecUtility instead')
typedef PaddingUtility = PaddingSpecUtility;
