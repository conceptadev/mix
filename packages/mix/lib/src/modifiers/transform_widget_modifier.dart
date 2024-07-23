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
import '../internal/diagnostic_properties_builder_ext.dart';

part 'transform_widget_modifier.g.dart';

@MixableSpec()
final class TransformSpec extends Spec<TransformSpec>
    with _$TransformSpec, ModifierSpecMixin {
  final Matrix4? transform;
  final Alignment? alignment;

  const TransformSpec({this.transform, this.alignment});

  @override
  Widget build(Widget child) {
    return Transform(
      transform: transform ?? Matrix4.identity(),
      alignment: alignment ?? Alignment.center,
      child: child,
    );
  }
}

extension TransformSpecUtilityX<T extends Attribute>
    on TransformSpecUtility<T> {
  T _flip(bool x, bool y) => builder(
        TransformSpecAttribute(
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

  T call(Matrix4 value) => builder(TransformSpecAttribute(transform: value));

  T scale(double value) => builder(
        TransformSpecAttribute(
          transform: Matrix4.diagonal3Values(value, value, 1.0),
          alignment: Alignment.center,
        ),
      );

  T rotate(double value) => builder(
        TransformSpecAttribute(
          transform: Matrix4.rotationZ(value),
          alignment: Alignment.center,
        ),
      );
}

@Deprecated('Use TransformSpec instead')
typedef TransformModifierSpec = TransformSpec;

@Deprecated('Use TransformSpecAttribute instead')
typedef TransformModifierAttribute = TransformSpecAttribute;

@Deprecated('Use TransformSpecUtility instead')
typedef TransformUtility = TransformSpecUtility;
