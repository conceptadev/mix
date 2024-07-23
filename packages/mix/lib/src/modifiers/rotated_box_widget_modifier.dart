// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../core/attribute.dart';
import '../core/factory/mix_data.dart';
import '../core/factory/mix_provider.dart';
import '../core/modifier.dart';
import '../core/spec.dart';
import '../core/utility.dart';
import '../internal/diagnostic_properties_builder_ext.dart';

part 'rotated_box_widget_modifier.g.dart';

@MixableSpec()
final class RotatedBoxSpec extends Spec<RotatedBoxSpec>
    with _$RotatedBoxSpec, ModifierSpecMixin {
  final int? quarterTurns;
  const RotatedBoxSpec._({
    this.quarterTurns,
  });
  factory RotatedBoxSpec(int quarterTurns) =>
      RotatedBoxSpec._(quarterTurns: quarterTurns);

  @override
  Widget build(Widget child) {
    return RotatedBox(quarterTurns: quarterTurns ?? 0, child: child);
  }
}

extension RotatedBoxSpecUtilityX<T extends Attribute>
    on RotatedBoxSpecUtility<T> {
  T call(int value) => only(quarterTurns: value);
  T d90() => only(quarterTurns: 1);
  T d180() => only(quarterTurns: 2);
  T d270() => only(quarterTurns: 3);
}

@Deprecated('Use RotatedBoxSpec instead')
typedef RotatedBoxModifierSpec = RotatedBoxSpec;

@Deprecated('Use RotatedBoxSpecAttribute instead')
typedef RotatedBoxModifierAttribute = RotatedBoxSpecAttribute;

@Deprecated('Use RotatedBoxSpecUtility instead')
typedef RotatedBoxWidgetUtility = RotatedBoxSpecUtility;
