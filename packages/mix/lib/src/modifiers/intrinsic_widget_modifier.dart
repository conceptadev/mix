// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../core/attribute.dart';
import '../core/factory/mix_data.dart';
import '../core/factory/mix_provider.dart';
import '../core/modifier.dart';
import '../core/utility.dart';

part 'intrinsic_widget_modifier.g.dart';

@MixableSpec(prefix: 'IntrinsicHeightModifier', skipUtility: true)
final class IntrinsicHeightModifierSpec
    extends WidgetModifierSpec<IntrinsicHeightModifierSpec>
    with _$IntrinsicHeightModifierSpec {
  const IntrinsicHeightModifierSpec();

  @override
  Widget build(Widget child) {
    return IntrinsicHeight(child: child);
  }
}

@MixableSpec(prefix: 'IntrinsicWidthModifier', skipUtility: true)
final class IntrinsicWidthModifierSpec
    extends WidgetModifierSpec<IntrinsicWidthModifierSpec>
    with _$IntrinsicWidthModifierSpec {
  const IntrinsicWidthModifierSpec();

  @override
  Widget build(Widget child) {
    return IntrinsicWidth(child: child);
  }
}

final class IntrinsicHeightModifierUtility<T extends Attribute>
    extends MixUtility<T, IntrinsicHeightModifierAttribute> {
  const IntrinsicHeightModifierUtility(super.builder);
  T call() => builder(const IntrinsicHeightModifierAttribute());
}

final class IntrinsicWidthModifierUtility<T extends Attribute>
    extends MixUtility<T, IntrinsicWidthModifierAttribute> {
  const IntrinsicWidthModifierUtility(super.builder);
  T call() => builder(const IntrinsicWidthModifierAttribute());
}
