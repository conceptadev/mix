import 'package:flutter/material.dart';
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

  testScalarAttribute<GradientAttribute, Gradient>(
      'GradientAttribute', (value) => GradientAttribute(value), [
    const LinearGradient(
      colors: [Colors.red, Colors.blue],
    ),
    const RadialGradient(
      colors: [Colors.red, Colors.blue],
    ),
    const SweepGradient(
      colors: [Colors.red, Colors.blue],
    ),
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

  testScalarAttribute<ImageWidthAttribute, double>(
    'ImageWidthAttribute',
    (value) => ImageWidthAttribute(value),
    [
      1.0,
      2.0,
    ],
  );

  testScalarAttribute<ImageHeightAttribute, double>(
    'ImageHeightAttribute',
    (value) => ImageHeightAttribute(value),
    [
      1.0,
      2.0,
    ],
  );

  testScalarAttribute<TextAlignAttribute, TextAlign>(
    'TextAlignAttribute',
    (value) => TextAlignAttribute(value),
    TextAlign.values,
  );

  testScalarAttribute<TextDirectionAttribute, TextDirection>(
    'TextDirectionAttribute',
    (value) => TextDirectionAttribute(value),
    TextDirection.values,
  );

//   class IconSizeAttribute extends ScalarAttribute<IconSizeAttribute, double> {
//   const IconSizeAttribute(super.value);

//   @override
//   IconSizeAttribute create(value) => IconSizeAttribute(value);
// }

// class BoxFitAttribute extends ScalarAttribute<BoxFitAttribute, BoxFit> {
//   const BoxFitAttribute(super.value);

//   @override
//   BoxFitAttribute create(value) => BoxFitAttribute(value);
// }

// class StackFitAttribute extends ScalarAttribute<StackFitAttribute, StackFit> {
//   const StackFitAttribute(super.value);

//   @override
//   StackFitAttribute create(value) => StackFitAttribute(value);
// }

// class FlexFitAttribute extends ScalarAttribute<FlexFitAttribute, FlexFit> {
//   const FlexFitAttribute(super.value);

//   @override
//   FlexFitAttribute create(value) => FlexFitAttribute(value);
// }

  testScalarAttribute<IconSizeAttribute, double>(
    'IconSizeAttribute',
    (value) => IconSizeAttribute(value),
    [
      1.0,
      2.0,
    ],
  );

  testScalarAttribute<BoxFitAttribute, BoxFit>(
    'BoxFitAttribute',
    (value) => BoxFitAttribute(value),
    BoxFit.values,
  );

  testScalarAttribute<StackFitAttribute, StackFit>(
    'StackFitAttribute',
    (value) => StackFitAttribute(value),
    StackFit.values,
  );

  testScalarAttribute<FlexFitAttribute, FlexFit>(
    'FlexFitAttribute',
    (value) => FlexFitAttribute(value),
    FlexFit.values,
  );

  testScalarAttribute<BoxShapeAttribute, BoxShape>(
    'BoxShapeAttribute',
    (value) => BoxShapeAttribute(value),
    BoxShape.values,
  );

  testScalarAttribute<VisibleAttribute, bool>(
    'VisibleAttribute',
    (value) => VisibleAttribute(value),
    [
      false,
      true,
    ],
  );

  testScalarAttribute<TextScaleFactorAttribute, double>(
    'TextScaleFactorAttribute',
    (value) => TextScaleFactorAttribute(value),
    [
      1.0,
      2.0,
    ],
  );
}
