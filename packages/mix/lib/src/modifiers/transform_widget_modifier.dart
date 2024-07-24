// ignore_for_file: prefer-named-boolean-parameters

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../core/attribute.dart';
import '../core/factory/mix_data.dart';
import '../core/helpers.dart';
import '../core/modifier.dart';
import '../core/utility.dart';

part 'transform_widget_modifier.g.dart';

@MixableSpec(skipUtility: true)
final class TransformModifierSpec
    extends WidgetModifierSpec<TransformModifierSpec>
    with _$TransformModifierSpec, Diagnosticable {
  final Matrix4? transform;
  final Alignment? alignment;

  const TransformModifierSpec({this.transform, this.alignment});

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }

  @override
  Widget build(Widget child) {
    return Transform(
      transform: transform ?? Matrix4.identity(),
      alignment: alignment ?? Alignment.center,
      child: child,
    );
  }
}

final class TransformModifierSpecUtility<T extends Attribute>
    extends MixUtility<T, TransformModifierSpecAttribute> {
  const TransformModifierSpecUtility(super.builder);

  T _flip(bool x, bool y) => builder(
        TransformModifierSpecAttribute(
          transform: Matrix4.diagonal3Values(
            x ? -1.0 : 1.0,
            y ? -1.0 : 1.0,
            1.0,
          ),
          alignment: Alignment.center,
        ),
      );

  T flipX() => _flip(true, false);
  T flipY() => _flip(false, true);

  T call(Matrix4 value) =>
      builder(TransformModifierSpecAttribute(transform: value));

  T scale(double value) => builder(
        TransformModifierSpecAttribute(
          transform: Matrix4.diagonal3Values(value, value, 1.0),
          alignment: Alignment.center,
        ),
      );

  T rotate(double value) => builder(
        TransformModifierSpecAttribute(
          transform: Matrix4.rotationZ(value),
          alignment: Alignment.center,
        ),
      );
}
