// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../attributes/enum/enum_util.dart';
import '../core/attribute.dart';
import '../core/factory/mix_data.dart';
import '../core/factory/mix_provider.dart';
import '../core/modifier.dart';
import '../core/spec.dart';
import '../core/utility.dart';
import '../internal/diagnostic_properties_builder_ext.dart';

part 'flexible_widget_modifier.g.dart';

@MixableSpec()
final class FlexibleSpec extends Spec<FlexibleSpec>
    with _$FlexibleSpec, ModifierSpecMixin {
  final int? flex;
  final FlexFit? fit;
  const FlexibleSpec({this.flex, this.fit});

  @override
  Widget build(Widget child) {
    return Flexible(
      flex: flex ?? 1,
      fit: fit ?? FlexFit.loose,
      child: child,
    );
  }
}

extension FlexibleSpecUtilityX<T extends Attribute> on FlexibleSpecUtility<T> {
  T tight({int? flex}) => only(flex: flex, fit: FlexFit.tight);
  T loose({int? flex}) => only(flex: flex, fit: FlexFit.loose);
  T expanded({int? flex}) => tight(flex: flex);

  T call({int? flex, FlexFit? fit}) {
    return only(flex: flex, fit: fit);
  }
}

@Deprecated('Use FlexibleSpec instead')
typedef FlexibleModifierSpec = FlexibleSpec;

@Deprecated('Use FlexibleSpecAttribute instead')
typedef FlexibleModifierAttribute = FlexibleSpecAttribute;

@Deprecated('Use FlexibleSpecUtility instead')
typedef FlexibleUtility = FlexibleSpecUtility;
