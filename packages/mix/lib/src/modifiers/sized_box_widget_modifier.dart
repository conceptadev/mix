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

part 'sized_box_widget_modifier.g.dart';

@MixableSpec(prefix: 'SizedBoxModifier', skipUtility: true)
final class SizedBoxModifierSpec
    extends WidgetModifierSpec<SizedBoxModifierSpec>
    with _$SizedBoxModifierSpec {
  final double? width;
  final double? height;

  const SizedBoxModifierSpec({this.width, this.height});

  @override
  Widget build(Widget child) {
    return SizedBox(width: width, height: height, child: child);
  }
}

final class SizedBoxModifierUtility<T extends Attribute>
    extends MixUtility<T, SizedBoxModifierAttribute> {
  /// Utility for defining [SizedBoxModifierAttribute.height]
  late final height = DoubleUtility((value) => call(height: value));

  /// Utility for defining [SizedBoxModifierAttribute.width]
  late final width = DoubleUtility((value) => call(width: value));

  /// Utility for defining [SizedBoxModifierAttribute.width]
  /// and [SizedBoxModifierAttribute.height]
  late final square =
      DoubleUtility((value) => call(width: value, height: value));

  SizedBoxModifierUtility(super.builder);

  T call({double? width, double? height}) {
    return builder(SizedBoxModifierAttribute(width: width, height: height));
  }

  /// Utility for defining [SizedBoxModifierAttribute.width] and [SizedBoxModifierAttribute.height]
  /// from [Size]
  T as(Size size) => call(width: size.width, height: size.height);
}
