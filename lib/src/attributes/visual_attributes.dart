import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../core/attribute.dart';
import '../core/dto/border_dto.dart';
import '../core/dto/color_dto.dart';
import '../core/dto/dtos.dart';
import '../core/dto/strut_style_dto.dart';
import '../core/dto/text_style_dto.dart';

class AxisAttribute extends ScalarAttribute<AxisAttribute, Axis> {
  const AxisAttribute(super.value);

  @override
  AxisAttribute create(value) => AxisAttribute(value);
}

class MainAxisAlignmentAttribute
    extends ScalarAttribute<MainAxisAlignmentAttribute, MainAxisAlignment> {
  const MainAxisAlignmentAttribute(super.value);

  @override
  MainAxisAlignmentAttribute create(value) => MainAxisAlignmentAttribute(value);
}

class MainAxisSizeAttribute
    extends ScalarAttribute<MainAxisSizeAttribute, MainAxisSize> {
  const MainAxisSizeAttribute(super.value);

  @override
  MainAxisSizeAttribute create(value) => MainAxisSizeAttribute(value);
}

class CrossAxisAlignmentAttribute
    extends ScalarAttribute<CrossAxisAlignmentAttribute, CrossAxisAlignment> {
  const CrossAxisAlignmentAttribute(super.value);

  @override
  CrossAxisAlignmentAttribute create(value) =>
      CrossAxisAlignmentAttribute(value);
}

class VerticalDirectionAttribute
    extends ScalarAttribute<VerticalDirectionAttribute, VerticalDirection> {
  const VerticalDirectionAttribute(super.value);

  @override
  VerticalDirectionAttribute create(value) => VerticalDirectionAttribute(value);
}

class TextBaselineAttribute
    extends ScalarAttribute<TextBaselineAttribute, TextBaseline> {
  const TextBaselineAttribute(super.value);

  @override
  TextBaselineAttribute create(value) => TextBaselineAttribute(value);
}

class ClipAttribute extends ScalarAttribute<ClipAttribute, Clip> {
  const ClipAttribute(super.value);

  @override
  ClipAttribute create(value) => ClipAttribute(value);
}

class ImageAlignmentAttribute
    extends ScalarAttribute<ImageAlignmentAttribute, Alignment> {
  const ImageAlignmentAttribute(super.value);

  @override
  ImageAlignmentAttribute create(value) => ImageAlignmentAttribute(value);
}

class ImageScaleAttribute extends ScalarAttribute<ImageScaleAttribute, double> {
  const ImageScaleAttribute(super.value);

  @override
  ImageScaleAttribute create(value) => ImageScaleAttribute(value);
}

class ImageFitAttribute extends ScalarAttribute<ImageFitAttribute, BoxFit> {
  const ImageFitAttribute(super.value);

  @override
  ImageFitAttribute create(value) => ImageFitAttribute(value);
}

class ImageRepeatAttribute
    extends ScalarAttribute<ImageRepeatAttribute, ImageRepeat> {
  const ImageRepeatAttribute(super.value);

  @override
  ImageRepeatAttribute create(value) => ImageRepeatAttribute(value);
}

class HeightAttribute extends ScalarAttribute<HeightAttribute, double> {
  const HeightAttribute(super.value);

  @override
  HeightAttribute create(value) => HeightAttribute(value);
}

class WidthAttribute extends ScalarAttribute<WidthAttribute, double> {
  const WidthAttribute(super.value);

  @override
  WidthAttribute create(value) => WidthAttribute(value);
}

class TextAlignAttribute
    extends ScalarAttribute<TextAlignAttribute, TextAlign> {
  const TextAlignAttribute(super.value);

  @override
  TextAlignAttribute create(value) => TextAlignAttribute(value);
}

class TextDirectionAttribute
    extends ScalarAttribute<TextDirectionAttribute, TextDirection> {
  const TextDirectionAttribute(super.value);

  @override
  TextDirectionAttribute create(value) => TextDirectionAttribute(value);
}

class SoftWrapAttribute extends ScalarAttribute<SoftWrapAttribute, bool> {
  const SoftWrapAttribute(super.value);

  @override
  SoftWrapAttribute create(value) => SoftWrapAttribute(value);
}

class TextOverflowAttribute
    extends ScalarAttribute<TextOverflowAttribute, TextOverflow> {
  const TextOverflowAttribute(super.value);

  @override
  TextOverflowAttribute create(value) => TextOverflowAttribute(value);
}

class TextScaleFactorAttribute
    extends ScalarAttribute<TextScaleFactorAttribute, double> {
  const TextScaleFactorAttribute(super.value);

  @override
  TextScaleFactorAttribute create(value) => TextScaleFactorAttribute(value);
}

class MaxLinesAttribute extends ScalarAttribute<MaxLinesAttribute, int> {
  const MaxLinesAttribute(super.value);

  @override
  MaxLinesAttribute create(value) => MaxLinesAttribute(value);
}

class TextWidthBasisAttribute
    extends ScalarAttribute<TextWidthBasisAttribute, TextWidthBasis> {
  const TextWidthBasisAttribute(super.value);

  @override
  TextWidthBasisAttribute create(value) => TextWidthBasisAttribute(value);
}

class TextHeightBehaviorAttribute
    extends ScalarAttribute<TextHeightBehaviorAttribute, TextHeightBehavior> {
  const TextHeightBehaviorAttribute(super.value);

  @override
  TextHeightBehaviorAttribute create(value) =>
      TextHeightBehaviorAttribute(value);
}

class IconColorAttribute extends ColorAttribute {
  const IconColorAttribute(super.color);

  @override
  IconColorAttribute create(value) => IconColorAttribute(value);
}

class IconSizeAttribute extends ScalarAttribute<IconSizeAttribute, double> {
  const IconSizeAttribute(super.value);

  @override
  IconSizeAttribute create(value) => IconSizeAttribute(value);
}

class BoxFitAttribute extends ScalarAttribute<BoxFitAttribute, BoxFit> {
  const BoxFitAttribute(super.value);

  @override
  BoxFitAttribute create(value) => BoxFitAttribute(value);
}

class StackFitAttribute extends ScalarAttribute<StackFitAttribute, StackFit> {
  const StackFitAttribute(super.value);

  @override
  StackFitAttribute create(value) => StackFitAttribute(value);
}

class FlexFitAttribute extends ScalarAttribute<FlexFitAttribute, FlexFit> {
  const FlexFitAttribute(super.value);

  @override
  FlexFitAttribute create(value) => FlexFitAttribute(value);
}

class TransformAttribute extends ScalarAttribute<TransformAttribute, Matrix4> {
  const TransformAttribute(super.value);

  @override
  TransformAttribute create(value) => TransformAttribute(value);
}
// class ForegroundDecorationAttribute
//     extends ScalarVisualAttribute<ForegroundDecorationAttribute, Decoration> {
//   const ForegroundDecorationAttribute(super.value);

//   @override
//   ForegroundDecorationAttribute create(value) =>
//       ForegroundDecorationAttribute(value);
// }

class BlendModeAttribute
    extends ScalarAttribute<BlendModeAttribute, BlendMode> {
  const BlendModeAttribute(super.value);

  @override
  BlendModeAttribute create(value) => BlendModeAttribute(value);
}

class BoxShapeAttribute extends ScalarAttribute<BoxShapeAttribute, BoxShape> {
  const BoxShapeAttribute(super.value);

  @override
  BoxShapeAttribute create(value) => BoxShapeAttribute(value);
}

class PaddingAttribute extends SpacingAttribute<PaddingAttribute> {
  const PaddingAttribute(super.value);

  @override
  PaddingAttribute create(value) => PaddingAttribute(value);
}

class MarginAttribute extends SpacingAttribute<MarginAttribute> {
  const MarginAttribute(super.value);

  @override
  MarginAttribute create(value) => MarginAttribute(value);
}

class GradientAttribute extends ScalarAttribute<GradientAttribute, Gradient> {
  const GradientAttribute(super.value);

  @override
  GradientAttribute create(value) => GradientAttribute(value);
}

class StrutStyleAttribute
    extends DataAttribute<StrutStyleAttribute, StrutStyleData, StrutStyle> {
  const StrutStyleAttribute(super.value);

  @override
  StrutStyleAttribute create(value) => StrutStyleAttribute(value);
}

class TextStyleAttribute
    extends DataAttribute<TextStyleAttribute, TextStyleData, TextStyle> {
  const TextStyleAttribute(super.value);

  @override
  TextStyleAttribute create(value) => TextStyleAttribute(value);
}

abstract class ColorAttribute
    extends DataAttribute<ColorAttribute, ColorData, Color> {
  const ColorAttribute(super.value);
}

class ImageColorAttribute extends ColorAttribute {
  const ImageColorAttribute(super.color);

  @override
  ImageColorAttribute create(value) => ImageColorAttribute(value);
}

class TransformAlignmentAttribute
    extends ScalarAttribute<TransformAlignmentAttribute, Alignment> {
  const TransformAlignmentAttribute(super.value);

  @override
  TransformAlignmentAttribute create(value) =>
      TransformAlignmentAttribute(value);
}

class BorderRadiusGeometryAttribute extends DataAttribute<
    BorderRadiusGeometryAttribute,
    BorderRadiusGeometryData,
    BorderRadiusGeometry> {
  const BorderRadiusGeometryAttribute(super.value);

  @override
  BorderRadiusGeometryAttribute create(value) =>
      BorderRadiusGeometryAttribute(value);
}

class BoxBorderAttribute
    extends DataAttribute<BoxBorderAttribute, BoxBorderDto, BoxBorder> {
  const BoxBorderAttribute(super.value);

  @override
  BoxBorderAttribute create(value) => BoxBorderAttribute(value);
}

class AlignmentGeometryAttribute extends DataAttribute<
    AlignmentGeometryAttribute, AlignmentGeometryDto, AlignmentGeometry> {
  const AlignmentGeometryAttribute(super.value);

  @override
  AlignmentGeometryAttribute create(value) => AlignmentGeometryAttribute(value);
}

abstract class SpacingAttribute<T extends SpacingAttribute<T>>
    extends DataAttribute<T, SpaceGeometryDto, EdgeInsetsGeometry> {
  const SpacingAttribute(super.value);
}
