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

part 'aspect_ratio_widget_modifier.g.dart';

@MixableSpec(prefix: 'AspectRatioModifier', skipUtility: true)
final class AspectRatioModifierSpec
    extends WidgetModifierSpec<AspectRatioModifierSpec>
    with _$AspectRatioModifierSpec {
  final double aspectRatio;

  const AspectRatioModifierSpec([double? aspectRatio])
      : aspectRatio = aspectRatio ?? 1.0;

  @override
  Widget build(Widget child) {
    return AspectRatio(aspectRatio: aspectRatio, child: child);
  }
}

final class AspectRatioModifierUtility<T extends Attribute>
    extends MixUtility<T, AspectRatioModifierAttribute> {
  const AspectRatioModifierUtility(super.builder);
  T call(double value) {
    return builder(AspectRatioModifierAttribute(aspectRatio: value));
  }
}
