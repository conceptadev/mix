// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../core/attribute.dart';
import '../core/factory/mix_data.dart';
import '../core/factory/mix_provider.dart';
import '../core/modifier.dart';
import '../core/spec.dart';

part 'intrinsic_widget_modifier.g.dart';

@MixableSpec()
final class IntrinsicHeightSpec extends Spec<IntrinsicHeightSpec>
    with _$IntrinsicHeightSpec, ModifierSpecMixin {
  const IntrinsicHeightSpec();

  @override
  Widget build(Widget child) {
    return IntrinsicHeight(child: child);
  }
}

@MixableSpec()
final class IntrinsicWidthSpec extends Spec<IntrinsicWidthSpec>
    with _$IntrinsicWidthSpec, ModifierSpecMixin {
  const IntrinsicWidthSpec();

  @override
  Widget build(Widget child) {
    return IntrinsicWidth(child: child);
  }
}

extension IntrinsicHeightSpecUtilityX<T extends Attribute>
    on IntrinsicHeightSpecUtility<T> {
  T call() => only();
}

extension IntrinsicWidthSpecUtilityX<T extends Attribute>
    on IntrinsicWidthSpecUtility<T> {
  T call() => only();
}

@Deprecated('Use IntrinsicHeightSpec instead')
typedef IntrinsicHeightModifierSpec = IntrinsicHeightSpec;

@Deprecated('Use IntrinsicHeightSpecAttribute instead')
typedef IntrinsicHeightModifierAttribute = IntrinsicHeightSpecAttribute;

@Deprecated('Use IntrinsicHeightSpecUtility instead')
typedef IntrinsicHeightWidgetUtility = IntrinsicHeightSpecUtility;

@Deprecated('Use IntrinsicWidthSpec instead')
typedef IntrinsicWidthModifierSpec = IntrinsicWidthSpec;

@Deprecated('Use IntrinsicWidthSpecAttribute instead')
typedef IntrinsicWidthModifierAttribute = IntrinsicWidthSpecAttribute;

@Deprecated('Use IntrinsicWidthSpecUtility instead')
typedef IntrinsicWidthWidgetUtility = IntrinsicWidthSpecUtility;
