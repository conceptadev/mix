// ignore_for_file: prefer-named-boolean-parameters

import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/factory/mix_data.dart';
import '../core/modifier.dart';

final class FractionallySizedBoxModifierSpec
    extends WidgetModifierSpec<FractionallySizedBoxModifierSpec> {
  final double? widthFactor;
  final double? heightFactor;
  final AlignmentGeometry? alignment;

  const FractionallySizedBoxModifierSpec({
    this.widthFactor,
    this.heightFactor,
    this.alignment,
  });

  @override
  FractionallySizedBoxModifierSpec copyWith({
    double? widthFactor,
    double? heightFactor,
    AlignmentGeometry? alignment,
  }) {
    return FractionallySizedBoxModifierSpec(
      widthFactor: widthFactor ?? this.widthFactor,
      heightFactor: heightFactor ?? this.heightFactor,
      alignment: alignment ?? this.alignment,
    );
  }

  @override
  FractionallySizedBoxModifierSpec lerp(
    FractionallySizedBoxModifierSpec? other,
    double t,
  ) {
    return FractionallySizedBoxModifierSpec(
      widthFactor: lerpDouble(widthFactor, other?.widthFactor, t),
      heightFactor: lerpDouble(heightFactor, other?.heightFactor, t),
      alignment: AlignmentGeometry.lerp(alignment, other?.alignment, t),
    );
  }

  @override
  get props => [widthFactor, heightFactor, alignment];

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

final class FractionallySizedBoxModifierAttribute
    extends WidgetModifierAttribute<FractionallySizedBoxModifierAttribute,
        FractionallySizedBoxModifierSpec> {
  final double? widthFactor;
  final double? heightFactor;
  final AlignmentGeometry? alignment;

  const FractionallySizedBoxModifierAttribute({
    this.widthFactor,
    this.heightFactor,
    this.alignment,
  });

  @override
  FractionallySizedBoxModifierAttribute merge(
    FractionallySizedBoxModifierAttribute? other,
  ) {
    return FractionallySizedBoxModifierAttribute(
      widthFactor: other?.widthFactor ?? widthFactor,
      heightFactor: other?.heightFactor ?? heightFactor,
      alignment: other?.alignment ?? alignment,
    );
  }

  @override
  FractionallySizedBoxModifierSpec resolve(MixData mix) {
    return FractionallySizedBoxModifierSpec(
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      alignment: alignment,
    );
  }

  @override
  get props => [widthFactor, heightFactor, alignment];
}

final class FractionallySizedBoxModifierUtility<T extends Attribute>
    extends MixUtility<T, FractionallySizedBoxModifierAttribute> {
  const FractionallySizedBoxModifierUtility(super.builder);

  T call({
    AlignmentGeometry? alignment,
    double? widthFactor,
    double? heightFactor,
  }) {
    return builder(
      FractionallySizedBoxModifierAttribute(
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        alignment: alignment,
      ),
    );
  }
}
