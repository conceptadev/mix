import 'package:flutter/material.dart';
import 'package:mix/src/attributes/data_attributes.dart';
import 'package:mix/src/attributes/scalar_attribute.dart';

import '../../helpers/testing_utils.dart';

void main() {
  testScalarAttribute<AxisAttribute, Axis>(
    'AxisAttribute',
    (value) => AxisAttribute(value),
    Axis.values,
  );

  testScalarAttribute<MainAxisAlignmentAttribute, MainAxisAlignment>(
      'MainAxisAlignmentAttribute',
      (value) => MainAxisAlignmentAttribute(value),
      MainAxisAlignment.values);

  testScalarAttribute<MainAxisSizeAttribute, MainAxisSize>(
    'MainAxisSizeAttribute',
    (value) => MainAxisSizeAttribute(value),
    MainAxisSize.values,
  );

  testScalarAttribute<CrossAxisAlignmentAttribute, CrossAxisAlignment>(
    'CrossAxisAlignmentAttribute',
    (value) => CrossAxisAlignmentAttribute(value),
    CrossAxisAlignment.values,
  );

  testScalarAttribute<VerticalDirectionAttribute, VerticalDirection>(
    'VerticalDirectionAttribute',
    (value) => VerticalDirectionAttribute(value),
    VerticalDirection.values,
  );

  testScalarAttribute<TextBaselineAttribute, TextBaseline>(
    'TextBaselineAttribute',
    (value) => TextBaselineAttribute(value),
    TextBaseline.values,
  );

  testScalarAttribute<ClipAttribute, Clip>(
    'ClipAttribute',
    (value) => ClipAttribute(value),
    Clip.values,
  );

  testScalarAttribute<ImageAlignmentAttribute, Alignment>(
      'ImageAlignmentAttribute', (value) => ImageAlignmentAttribute(value), [
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.centerLeft,
    Alignment.center,
    Alignment.centerRight,
    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.bottomRight,
  ]);

  testScalarAttribute<ImageFitAttribute, BoxFit>(
    'ImageFitAttribute',
    (value) => ImageFitAttribute(value),
    BoxFit.values,
  );

  testScalarAttribute<ImageRepeatAttribute, ImageRepeat>(
    'ImageRepeatAttribute',
    (value) => ImageRepeatAttribute(value),
    ImageRepeat.values,
  );

  testScalarAttribute<SoftWrapAttribute, bool>(
      'SoftWrapAttribute', (value) => SoftWrapAttribute(value), [
    false,
    true,
  ]);

  testScalarAttribute<TextOverflowAttribute, TextOverflow>(
    'TextOverflowAttribute',
    (value) => TextOverflowAttribute(value),
    TextOverflow.values,
  );

  testScalarAttribute<MaxLinesAttribute, int>(
      'MaxLinesAttribute', (value) => MaxLinesAttribute(value), [
    1,
    2,
  ]);

  testScalarAttribute<TextWidthBasisAttribute, TextWidthBasis>(
    'TextWidthBasisAttribute',
    (value) => TextWidthBasisAttribute(value),
    TextWidthBasis.values,
  );

  testScalarAttribute<TextHeightBehaviorAttribute, TextHeightBehavior>(
      'TextHeightBehaviorAttribute',
      (value) => TextHeightBehaviorAttribute(value), [
    const TextHeightBehavior(
      applyHeightToFirstAscent: true,
      applyHeightToLastDescent: true,
      leadingDistribution: TextLeadingDistribution.even,
    ),
    const TextHeightBehavior(
      applyHeightToFirstAscent: false,
      applyHeightToLastDescent: false,
      leadingDistribution: TextLeadingDistribution.proportional,
    ),
  ]);

  testScalarAttribute<TransformAttribute, Matrix4>(
      'TransformAttribute', (value) => TransformAttribute(value), [
    Matrix4.identity(),
    Matrix4.rotationZ(0.1),
    Matrix4.rotationY(0.2),
  ]);

  testScalarAttribute<TransformAlignmentAttribute, Alignment>(
      'TransformAlignmentAttribute',
      (value) => TransformAlignmentAttribute(value), [
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.centerLeft,
    Alignment.center,
    Alignment.centerRight,
    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.bottomRight,
  ]);

  testScalarAttribute<BlendModeAttribute, BlendMode>(
    'BlendModeAttribute',
    (value) => BlendModeAttribute(value),
    BlendMode.values,
  );
}
