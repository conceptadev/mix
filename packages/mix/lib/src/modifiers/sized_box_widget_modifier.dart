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

part 'sized_box_widget_modifier.g.dart';

@MixableSpec()
final class SizedBoxSpec extends Spec<SizedBoxSpec>
    with _$SizedBoxSpec, ModifierSpecMixin {
  final double? width;
  final double? height;

  const SizedBoxSpec({this.width, this.height});

  @override
  Widget build(Widget child) {
    return SizedBox(width: width, height: height, child: child);
  }
}

extension SizedBoxSpecUtilityX<T extends Attribute> on SizedBoxSpecUtility<T> {
  T call({double? width, double? height}) {
    return only(width: width, height: height);
  }

  /// Utility for defining [SizedBoxSpec.width] and [SizedBoxSpec.height]
  /// from [Size]
  T as(Size size) => call(width: size.width, height: size.height);
}

@Deprecated('Use SizedBoxSpec instead')
typedef SizedBoxModifierSpec = SizedBoxSpec;

@Deprecated('Use SizedBoxSpecAttribute instead')
typedef SizedBoxModifierAttribute = SizedBoxSpecAttribute;

@Deprecated('Use SizedBoxSpecUtility instead')
typedef SizedBoxModifierUtility = SizedBoxSpecUtility;
