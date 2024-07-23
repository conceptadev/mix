// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../attributes/enum/enum_util.dart';
import '../core/attribute.dart';
import '../core/factory/mix_data.dart';
import '../core/factory/mix_provider.dart';
import '../core/helpers.dart';
import '../core/modifier.dart';
import '../core/utility.dart';
import '../internal/diagnostic_properties_builder_ext.dart';

part 'flexible_widget_modifier.g.dart';

@MixableSpec(prefix: 'FlexibleModifier', skipUtility: true)
final class FlexibleModifierSpec
    extends WidgetModifierSpec<FlexibleModifierSpec>
    with _$FlexibleModifierSpec {
  final int? flex;
  final FlexFit? fit;
  const FlexibleModifierSpec({this.flex, this.fit});

  @override
  Widget build(Widget child) {
    return Flexible(
      flex: flex ?? 1,
      fit: fit ?? FlexFit.loose,
      child: child,
    );
  }
}

final class FlexibleModifierUtility<T extends Attribute>
    extends MixUtility<T, FlexibleModifierAttribute> {
  const FlexibleModifierUtility(super.builder);
  FlexFitUtility<T> get fit => FlexFitUtility((fit) => call(fit: fit));
  IntUtility<T> get flex => IntUtility((flex) => call(flex: flex));
  T tight({int? flex}) =>
      builder(FlexibleModifierAttribute(flex: flex, fit: FlexFit.tight));
  T loose({int? flex}) =>
      builder(FlexibleModifierAttribute(flex: flex, fit: FlexFit.loose));
  T expanded({int? flex}) => tight(flex: flex);

  T call({int? flex, FlexFit? fit}) {
    return builder(FlexibleModifierAttribute(flex: flex, fit: fit));
  }
}
