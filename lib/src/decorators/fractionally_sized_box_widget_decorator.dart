// ignore_for_file: prefer-named-boolean-parameters

import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';

class FractionallySizedBoxDecoratorSpec
    extends DecoratorSpec<FractionallySizedBoxDecoratorSpec> {
  final double? widthFactor;
  final double? heightFactor;
  final AlignmentGeometry? alignment;

  const FractionallySizedBoxDecoratorSpec({
    this.widthFactor,
    this.heightFactor,
    this.alignment,
  });

  @override
  FractionallySizedBoxDecoratorSpec copyWith({
    double? widthFactor,
    double? heightFactor,
    AlignmentGeometry? alignment,
  }) {
    return FractionallySizedBoxDecoratorSpec(
      widthFactor: widthFactor ?? this.widthFactor,
      heightFactor: heightFactor ?? this.heightFactor,
      alignment: alignment ?? this.alignment,
    );
  }

  @override
  FractionallySizedBoxDecoratorSpec lerp(
    FractionallySizedBoxDecoratorSpec? other,
    double t,
  ) {
    return FractionallySizedBoxDecoratorSpec(
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

class FractionallySizedBoxDecoratorAttribute extends DecoratorAttribute<
    FractionallySizedBoxDecoratorAttribute, FractionallySizedBoxDecoratorSpec> {
  final double? widthFactor;
  final double? heightFactor;
  final AlignmentGeometry? alignment;

  const FractionallySizedBoxDecoratorAttribute({
    this.widthFactor,
    this.heightFactor,
    this.alignment,
  });

  @override
  FractionallySizedBoxDecoratorAttribute merge(
    FractionallySizedBoxDecoratorAttribute? other,
  ) {
    return FractionallySizedBoxDecoratorAttribute(
      widthFactor: other?.widthFactor ?? widthFactor,
      heightFactor: other?.heightFactor ?? heightFactor,
      alignment: other?.alignment ?? alignment,
    );
  }

  @override
  FractionallySizedBoxDecoratorSpec resolve(MixData mix) {
    return FractionallySizedBoxDecoratorSpec(
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      alignment: alignment,
    );
  }

  @override
  get props => [widthFactor, heightFactor, alignment];
}

class FractionallySizedBoxDecoratorUtility<T extends Attribute>
    extends MixUtility<T, FractionallySizedBoxDecoratorAttribute> {
  const FractionallySizedBoxDecoratorUtility(super.builder);

  T call({
    AlignmentGeometry? alignment,
    double? widthFactor,
    double? heightFactor,
  }) {
    return builder(
      FractionallySizedBoxDecoratorAttribute(
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        alignment: alignment,
      ),
    );
  }
}
