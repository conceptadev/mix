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

part 'align_widget_modifier.g.dart';

@MixableSpec()
final class AlignSpec extends Spec<AlignSpec>
    with _$AlignSpec, ModifierSpecMixin {
  final AlignmentGeometry? alignment;
  final double? widthFactor;
  final double? heightFactor;

  const AlignSpec({
    this.alignment,
    this.widthFactor,
    this.heightFactor,
  });

  @override
  Widget build(Widget child) {
    return Align(
      alignment: alignment ?? Alignment.center,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: child,
    );
  }
}

extension AlignSpecUtilityX<T extends Attribute> on AlignSpecUtility<T> {
  T call({
    AlignmentGeometry? alignment,
    double? widthFactor,
    double? heightFactor,
  }) {
    return only(
      alignment: alignment,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
    );
  }
}

@Deprecated('Use AlignSpec instead')
typedef AlignModifierSpec = AlignSpec;

@Deprecated('Use AlignSpecAttribute instead')
typedef AlignModifierAttribute = AlignSpecAttribute;

@Deprecated('Use AlignSpecUtility instead')
typedef AlignWidgetUtility = AlignSpecUtility;
