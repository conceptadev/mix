// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/factory/mix_data.dart';
import '../core/factory/mix_provider.dart';
import '../core/helpers.dart';
import '../core/modifier.dart';
import '../core/spec.dart';
import '../core/utility.dart';
import '../internal/diagnostic_properties_builder_ext.dart';

part 'fractionally_sized_box_widget_modifier.g.dart';

@MixableSpec()
final class FractionallySizedBoxSpec extends Spec<FractionallySizedBoxSpec>
    with _$FractionallySizedBoxSpec, ModifierSpecMixin {
  final double? widthFactor;
  final double? heightFactor;
  final AlignmentGeometry? alignment;

  const FractionallySizedBoxSpec({
    this.widthFactor,
    this.heightFactor,
    this.alignment,
  });

  @override
  Widget build(Widget child) {
    return FractionallySizedBox(
      alignment: alignment ?? Alignment.center,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: child,
    );
  }
}

extension FractionallySizedBoxSpecUtilityX<T extends Attribute>
    on FractionallySizedBoxSpecUtility<T> {
  T call({
    AlignmentGeometry? alignment,
    double? widthFactor,
    double? heightFactor,
  }) {
    return only(
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      alignment: alignment,
    );
  }
}

@Deprecated('Use FractionallySizedBoxSpec instead')
typedef FractionallySizedBoxModifierSpec = FractionallySizedBoxSpec;

@Deprecated('Use FractionallySizedBoxSpecAttribute instead')
typedef FractionallySizedBoxModifierAttribute
    = FractionallySizedBoxSpecAttribute;

@Deprecated('Use FractionallySizedBoxSpecUtility instead')
typedef FractionallySizedBoxModifierUtility = FractionallySizedBoxSpecUtility;
