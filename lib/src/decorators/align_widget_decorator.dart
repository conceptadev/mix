// ignore_for_file: prefer-named-boolean-parameters

import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/scalars/scalar_util.dart';
import '../core/attribute.dart';
import '../core/decorator.dart';
import '../factory/mix_provider_data.dart';

class AlignWidgetSpec extends DecoratorSpec<AlignWidgetSpec> {
  final AlignmentGeometry? alignment;
  final double? widthFactor;
  final double? heightFactor;

  const AlignWidgetSpec({this.alignment, this.widthFactor, this.heightFactor});

  @override
  AlignWidgetSpec lerp(AlignWidgetSpec? other, double t) {
    return AlignWidgetSpec(
      alignment: AlignmentGeometry.lerp(alignment, other?.alignment, t),
      widthFactor: lerpDouble(widthFactor, other?.widthFactor, t),
      heightFactor: lerpDouble(heightFactor, other?.heightFactor, t),
    );
  }

  @override
  AlignWidgetSpec copyWith({
    AlignmentGeometry? alignment,
    double? widthFactor,
    double? heightFactor,
  }) {
    return AlignWidgetSpec(
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

class AlignWidgetDecorator
    extends WidgetDecorator<AlignWidgetDecorator, AlignWidgetSpec> {
  final AlignmentGeometry? alignment;
  final double? widthFactor;
  final double? heightFactor;

  const AlignWidgetDecorator({
    this.alignment,
    this.widthFactor,
    this.heightFactor,
  });

  @override
  AlignWidgetSpec resolve(MixData mix) {
    return AlignWidgetSpec(
      alignment: alignment,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
    );
  }

  @override
  AlignWidgetDecorator merge(AlignWidgetDecorator? other) {
    return AlignWidgetDecorator(
      alignment: other?.alignment ?? alignment,
      widthFactor: other?.widthFactor ?? widthFactor,
      heightFactor: other?.heightFactor ?? heightFactor,
    );
  }

  @override
  get props => [alignment, widthFactor, heightFactor];
}

class AlignWidgetUtility<T extends StyleAttribute>
    extends MixUtility<T, AlignWidgetDecorator> {
  const AlignWidgetUtility(super.builder);
  T call({
    AlignmentGeometry? alignment,
    double? widthFactor,
    double? heightFactor,
  }) {
    return builder(
      AlignWidgetDecorator(
        alignment: alignment,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
      ),
    );
  }
}
