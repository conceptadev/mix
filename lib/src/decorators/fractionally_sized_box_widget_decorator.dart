// ignore_for_file: prefer-named-boolean-parameters

import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';

class FractionallySizedBoxWidgetSpec
    extends DecoratorSpec<FractionallySizedBoxWidgetSpec> {
  final double? widthFactor;
  final double? heightFactor;
  final AlignmentGeometry? alignment;

  const FractionallySizedBoxWidgetSpec({
    this.widthFactor,
    this.heightFactor,
    this.alignment,
  });

  @override
  FractionallySizedBoxWidgetSpec copyWith({
    double? widthFactor,
    double? heightFactor,
    AlignmentGeometry? alignment,
  }) {
    return FractionallySizedBoxWidgetSpec(
      widthFactor: widthFactor ?? this.widthFactor,
      heightFactor: heightFactor ?? this.heightFactor,
      alignment: alignment ?? this.alignment,
    );
  }

  @override
  FractionallySizedBoxWidgetSpec lerp(
    FractionallySizedBoxWidgetSpec? other,
    double t,
  ) {
    return FractionallySizedBoxWidgetSpec(
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

class FractionallySizedBoxWidgetDecorator extends WidgetDecorator<
    FractionallySizedBoxWidgetDecorator, FractionallySizedBoxWidgetSpec> {
  final double? widthFactor;
  final double? heightFactor;
  final AlignmentGeometry? alignment;

  const FractionallySizedBoxWidgetDecorator({
    this.widthFactor,
    this.heightFactor,
    this.alignment,
  });

  @override
  FractionallySizedBoxWidgetDecorator merge(
    FractionallySizedBoxWidgetDecorator? other,
  ) {
    return FractionallySizedBoxWidgetDecorator(
      widthFactor: other?.widthFactor ?? widthFactor,
      heightFactor: other?.heightFactor ?? heightFactor,
      alignment: other?.alignment ?? alignment,
    );
  }

  @override
  FractionallySizedBoxWidgetSpec resolve(MixData mix) {
    return FractionallySizedBoxWidgetSpec(
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      alignment: alignment,
    );
  }

  @override
  get props => [widthFactor, heightFactor, alignment];
}

class FractionallySizedBoxDecoratorUtility<T extends StyleAttribute>
    extends MixUtility<T, FractionallySizedBoxWidgetDecorator> {
  const FractionallySizedBoxDecoratorUtility(super.builder);

  T call({
    AlignmentGeometry? alignment,
    double? widthFactor,
    double? heightFactor,
  }) {
    return builder(
      FractionallySizedBoxWidgetDecorator(
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        alignment: alignment,
      ),
    );
  }
}
