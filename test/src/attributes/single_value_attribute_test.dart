import 'package:flutter/material.dart';
import 'package:mix/src/attributes/visual_attributes.dart';

import '../../helpers/testing_utils.dart';

void main() {
  testSingleAttributeValue<AxisAttribute, Axis>(
    'AxisAttribute',
    (value) => AxisAttribute(value),
    Axis.values,
  );

  testSingleAttributeValue<MainAxisAlignmentAttribute, MainAxisAlignment>(
      'MainAxisAlignmentAttribute',
      (value) => MainAxisAlignmentAttribute(value),
      MainAxisAlignment.values);

  testSingleAttributeValue<MainAxisSizeAttribute, MainAxisSize>(
    'MainAxisSizeAttribute',
    (value) => MainAxisSizeAttribute(value),
    MainAxisSize.values,
  );

  testSingleAttributeValue<CrossAxisAlignmentAttribute, CrossAxisAlignment>(
    'CrossAxisAlignmentAttribute',
    (value) => CrossAxisAlignmentAttribute(value),
    CrossAxisAlignment.values,
  );

  testSingleAttributeValue<VerticalDirectionAttribute, VerticalDirection>(
    'VerticalDirectionAttribute',
    (value) => VerticalDirectionAttribute(value),
    VerticalDirection.values,
  );

  testSingleAttributeValue<TextBaselineAttribute, TextBaseline>(
    'TextBaselineAttribute',
    (value) => TextBaselineAttribute(value),
    TextBaseline.values,
  );

  testSingleAttributeValue<ClipAttribute, Clip>(
    'ClipAttribute',
    (value) => ClipAttribute(value),
    Clip.values,
  );

  testSingleAttributeValue<ImageAlignmentAttribute, Alignment>(
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

  testSingleAttributeValue<ImageFitAttribute, BoxFit>(
    'ImageFitAttribute',
    (value) => ImageFitAttribute(value),
    BoxFit.values,
  );

  testSingleAttributeValue<ImageRepeatAttribute, ImageRepeat>(
    'ImageRepeatAttribute',
    (value) => ImageRepeatAttribute(value),
    ImageRepeat.values,
  );

  testSingleAttributeValue<SoftWrapAttribute, bool>(
      'SoftWrapAttribute', (value) => SoftWrapAttribute(value), [
    false,
    true,
  ]);

  testSingleAttributeValue<TextOverflowAttribute, TextOverflow>(
    'TextOverflowAttribute',
    (value) => TextOverflowAttribute(value),
    TextOverflow.values,
  );

  testSingleAttributeValue<MaxLinesAttribute, int>(
      'MaxLinesAttribute', (value) => MaxLinesAttribute(value), [
    1,
    2,
  ]);

  testSingleAttributeValue<TextWidthBasisAttribute, TextWidthBasis>(
    'TextWidthBasisAttribute',
    (value) => TextWidthBasisAttribute(value),
    TextWidthBasis.values,
  );

  testSingleAttributeValue<TextHeightBehaviorAttribute, TextHeightBehavior>(
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

  testSingleAttributeValue<TransformAttribute, Matrix4>(
      'TransformAttribute', (value) => TransformAttribute(value), [
    Matrix4.identity(),
    Matrix4.rotationZ(0.1),
    Matrix4.rotationY(0.2),
  ]);

  testSingleAttributeValue<TransformAlignmentAttribute, Alignment>(
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

  testSingleAttributeValue<BlendModeAttribute, BlendMode>(
    'BlendModeAttribute',
    (value) => BlendModeAttribute(value),
    BlendMode.values,
  );
}
