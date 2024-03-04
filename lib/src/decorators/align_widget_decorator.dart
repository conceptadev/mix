// ignore_for_file: prefer-named-boolean-parameters

import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';

class AlignDecoratorSpec extends DecoratorSpec<AlignDecoratorSpec> {
  final AlignmentGeometry? alignment;
  final double? widthFactor;
  final double? heightFactor;

  const AlignDecoratorSpec(
      {this.alignment, this.widthFactor, this.heightFactor});

  @override
  AlignDecoratorSpec lerp(AlignDecoratorSpec? other, double t) {
    return AlignDecoratorSpec(
      alignment: AlignmentGeometry.lerp(alignment, other?.alignment, t),
      widthFactor: lerpDouble(widthFactor, other?.widthFactor, t),
      heightFactor: lerpDouble(heightFactor, other?.heightFactor, t),
    );
  }

  @override
  AlignDecoratorSpec copyWith({
    AlignmentGeometry? alignment,
    double? widthFactor,
    double? heightFactor,
  }) {
    return AlignDecoratorSpec(
      alignment: alignment ?? this.alignment,
      widthFactor: widthFactor ?? this.widthFactor,
      heightFactor: heightFactor ?? this.heightFactor,
    );
  }

  @override
  get props => [alignment, widthFactor, heightFactor];

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

class AlignDecoratorAttribute
    extends DecoratorAttribute<AlignDecoratorAttribute, AlignDecoratorSpec> {
  final AlignmentGeometry? alignment;
  final double? widthFactor;
  final double? heightFactor;

  const AlignDecoratorAttribute({
    this.alignment,
    this.widthFactor,
    this.heightFactor,
  });

  @override
  AlignDecoratorSpec resolve(MixData mix) {
    return AlignDecoratorSpec(
      alignment: alignment,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
    );
  }

  @override
  AlignDecoratorAttribute merge(AlignDecoratorAttribute? other) {
    return AlignDecoratorAttribute(
      alignment: other?.alignment ?? alignment,
      widthFactor: other?.widthFactor ?? widthFactor,
      heightFactor: other?.heightFactor ?? heightFactor,
    );
  }

  @override
  get props => [alignment, widthFactor, heightFactor];
}

class AlignWidgetUtility<T extends StyleAttribute>
    extends MixUtility<T, AlignDecoratorAttribute> {
  const AlignWidgetUtility(super.builder);
  T call({
    AlignmentGeometry? alignment,
    double? widthFactor,
    double? heightFactor,
  }) {
    return builder(
      AlignDecoratorAttribute(
        alignment: alignment,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
      ),
    );
  }
}
