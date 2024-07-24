// ignore_for_file: prefer-named-boolean-parameters

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../core/attribute.dart';
import '../core/factory/mix_data.dart';
import '../core/modifier.dart';
import '../core/utility.dart';
import '../internal/diagnostic_properties_builder_ext.dart';

final class AlignModifierSpec extends WidgetModifierSpec<AlignModifierSpec> {
  final AlignmentGeometry? alignment;
  final double? widthFactor;
  final double? heightFactor;

  const AlignModifierSpec({
    this.alignment,
    this.widthFactor,
    this.heightFactor,
  });

  @override
  AlignModifierSpec lerp(AlignModifierSpec? other, double t) {
    return AlignModifierSpec(
      widthFactor: lerpDouble(widthFactor, other?.widthFactor, t),
      heightFactor: lerpDouble(heightFactor, other?.heightFactor, t),
      alignment: AlignmentGeometry.lerp(alignment, other?.alignment, t),
    );
  }

  @override
  AlignModifierSpec copyWith({
    AlignmentGeometry? alignment,
    double? widthFactor,
    double? heightFactor,
  }) {
    return AlignModifierSpec(
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

final class AlignModifierAttribute
    extends WidgetModifierAttribute<AlignModifierAttribute, AlignModifierSpec> {
  final AlignmentGeometry? alignment;
  final double? widthFactor;
  final double? heightFactor;

  const AlignModifierAttribute({
    this.alignment,
    this.widthFactor,
    this.heightFactor,
  });

  @override
  AlignModifierSpec resolve(MixData mix) {
    return AlignModifierSpec(
      alignment: alignment,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
    );
  }

  @override
  AlignModifierAttribute merge(AlignModifierAttribute? other) {
    return AlignModifierAttribute(
      alignment: other?.alignment ?? alignment,
      widthFactor: other?.widthFactor ?? widthFactor,
      heightFactor: other?.heightFactor ?? heightFactor,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.addUsingDefault('alignment', alignment);
    properties.addUsingDefault('widthFactor', widthFactor);
    properties.addUsingDefault('heightFactor', heightFactor);
  }

  @override
  get props => [alignment, widthFactor, heightFactor];
}

final class AlignWidgetUtility<T extends Attribute>
    extends MixUtility<T, AlignModifierAttribute> {
  const AlignWidgetUtility(super.builder);
  T call({
    AlignmentGeometry? alignment,
    double? widthFactor,
    double? heightFactor,
  }) {
    return builder(
      AlignModifierAttribute(
        alignment: alignment,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
      ),
    );
  }
}
