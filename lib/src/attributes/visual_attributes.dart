import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../core/attribute.dart';
import '../core/dto/border_dto.dart';
import '../core/dto/color_dto.dart';
import '../core/dto/dtos.dart';
import '../core/dto/strut_style_dto.dart';
import '../core/dto/text_style_dto.dart';

// abstract class DoubleAttribute
//     extends ModifiableDtoAttribute<DoubleAttribute, DoubleDto, double> {
//   const DoubleAttribute(super.value);
// }

abstract class ColorAttribute
    extends DtoAttribute<ColorAttribute, ColorDto, Color> {
  const ColorAttribute(super.value);
}

class AxisAttribute extends ScalarVisualAttribute<AxisAttribute, Axis> {
  const AxisAttribute(super.value);

  @override
  AxisAttribute create(value) => AxisAttribute(value);
}

class MainAxisAlignmentAttribute extends ScalarVisualAttribute<
    MainAxisAlignmentAttribute, MainAxisAlignment> {
  const MainAxisAlignmentAttribute(super.value);

  @override
  MainAxisAlignmentAttribute create(value) => MainAxisAlignmentAttribute(value);
}

class MainAxisSizeAttribute
    extends ScalarVisualAttribute<MainAxisSizeAttribute, MainAxisSize> {
  const MainAxisSizeAttribute(super.value);

  @override
  MainAxisSizeAttribute create(value) => MainAxisSizeAttribute(value);
}

class TextStyleAttribute
    extends DtoAttribute<TextStyleAttribute, TextStyleDto, TextStyle> {
  const TextStyleAttribute(super.value);

  @override
  TextStyleAttribute create(value) => TextStyleAttribute(value);
}

class CrossAxisAlignmentAttribute extends ScalarVisualAttribute<
    CrossAxisAlignmentAttribute, CrossAxisAlignment> {
  const CrossAxisAlignmentAttribute(super.value);

  @override
  CrossAxisAlignmentAttribute create(value) =>
      CrossAxisAlignmentAttribute(value);
}

class VerticalDirectionAttribute extends ScalarVisualAttribute<
    VerticalDirectionAttribute, VerticalDirection> {
  const VerticalDirectionAttribute(super.value);

  @override
  VerticalDirectionAttribute create(value) => VerticalDirectionAttribute(value);
}

class TextBaselineAttribute
    extends ScalarVisualAttribute<TextBaselineAttribute, TextBaseline> {
  const TextBaselineAttribute(super.value);

  @override
  TextBaselineAttribute create(value) => TextBaselineAttribute(value);
}

class ClipAttribute extends ScalarVisualAttribute<ClipAttribute, Clip> {
  const ClipAttribute(super.value);

  @override
  ClipAttribute create(value) => ClipAttribute(value);
}

class StrutStyleAttribute
    extends DtoAttribute<StrutStyleAttribute, StrutStyleDto, StrutStyle> {
  const StrutStyleAttribute(super.value);

  @override
  StrutStyleAttribute create(value) => StrutStyleAttribute(value);
}

class ImageColorAttribute extends ColorAttribute {
  const ImageColorAttribute(super.color);

  @override
  ImageColorAttribute create(value) => ImageColorAttribute(value);
}

class ImageAlignmentAttribute
    extends ScalarVisualAttribute<ImageAlignmentAttribute, Alignment> {
  const ImageAlignmentAttribute(super.value);

  @override
  ImageAlignmentAttribute create(value) => ImageAlignmentAttribute(value);
}

class ImageScaleAttribute
    extends ScalarVisualAttribute<ImageScaleAttribute, double> {
  const ImageScaleAttribute(super.value);

  @override
  ImageScaleAttribute create(value) => ImageScaleAttribute(value);
}

class ImageFitAttribute
    extends ScalarVisualAttribute<ImageFitAttribute, BoxFit> {
  const ImageFitAttribute(super.value);

  @override
  ImageFitAttribute create(value) => ImageFitAttribute(value);
}

class ImageRepeatAttribute
    extends ScalarVisualAttribute<ImageRepeatAttribute, ImageRepeat> {
  const ImageRepeatAttribute(super.value);

  @override
  ImageRepeatAttribute create(value) => ImageRepeatAttribute(value);
}

class HeightAttribute extends ScalarVisualAttribute<HeightAttribute, double> {
  const HeightAttribute(super.value);

  @override
  HeightAttribute create(value) => HeightAttribute(value);
}

class WidthAttribute extends ScalarVisualAttribute<WidthAttribute, double> {
  const WidthAttribute(super.value);

  @override
  WidthAttribute create(value) => WidthAttribute(value);
}

class GradientAttribute
    extends ScalarVisualAttribute<GradientAttribute, Gradient> {
  const GradientAttribute(super.value);

  @override
  GradientAttribute create(value) => GradientAttribute(value);
}

class TextStrutStyleAttribute
    extends ScalarVisualAttribute<TextStrutStyleAttribute, StrutStyle> {
  const TextStrutStyleAttribute(super.value);

  @override
  TextStrutStyleAttribute create(value) => TextStrutStyleAttribute(value);
}

class TextAlignAttribute
    extends ScalarVisualAttribute<TextAlignAttribute, TextAlign> {
  const TextAlignAttribute(super.value);

  @override
  TextAlignAttribute create(value) => TextAlignAttribute(value);
}

class TextDirectionAttribute
    extends ScalarVisualAttribute<TextDirectionAttribute, TextDirection> {
  const TextDirectionAttribute(super.value);

  @override
  TextDirectionAttribute create(value) => TextDirectionAttribute(value);
}

class SoftWrapAttribute extends ScalarVisualAttribute<SoftWrapAttribute, bool> {
  const SoftWrapAttribute(super.value);

  @override
  SoftWrapAttribute create(value) => SoftWrapAttribute(value);
}

class TextOverflowAttribute
    extends ScalarVisualAttribute<TextOverflowAttribute, TextOverflow> {
  const TextOverflowAttribute(super.value);

  @override
  TextOverflowAttribute create(value) => TextOverflowAttribute(value);
}

class TextScaleFactorAttribute
    extends ScalarVisualAttribute<TextScaleFactorAttribute, double> {
  const TextScaleFactorAttribute(super.value);

  @override
  TextScaleFactorAttribute create(value) => TextScaleFactorAttribute(value);
}

class MaxLinesAttribute extends ScalarVisualAttribute<MaxLinesAttribute, int> {
  const MaxLinesAttribute(super.value);

  @override
  MaxLinesAttribute create(value) => MaxLinesAttribute(value);
}

class TextWidthBasisAttribute
    extends ScalarVisualAttribute<TextWidthBasisAttribute, TextWidthBasis> {
  const TextWidthBasisAttribute(super.value);

  @override
  TextWidthBasisAttribute create(value) => TextWidthBasisAttribute(value);
}

class TextHeightBehaviorAttribute extends ScalarVisualAttribute<
    TextHeightBehaviorAttribute, TextHeightBehavior> {
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

class IconSizeAttribute
    extends ScalarVisualAttribute<IconSizeAttribute, double> {
  const IconSizeAttribute(super.value);

  @override
  IconSizeAttribute create(value) => IconSizeAttribute(value);
}

class BoxFitAttribute extends ScalarVisualAttribute<BoxFitAttribute, BoxFit> {
  const BoxFitAttribute(super.value);

  @override
  BoxFitAttribute create(value) => BoxFitAttribute(value);
}

class StackFitAttribute
    extends ScalarVisualAttribute<StackFitAttribute, StackFit> {
  const StackFitAttribute(super.value);

  @override
  StackFitAttribute create(value) => StackFitAttribute(value);
}

class FlexFitAttribute
    extends ScalarVisualAttribute<FlexFitAttribute, FlexFit> {
  const FlexFitAttribute(super.value);

  @override
  FlexFitAttribute create(value) => FlexFitAttribute(value);
}

class ForegroundDecorationAttribute
    extends ScalarVisualAttribute<ForegroundDecorationAttribute, Decoration> {
  const ForegroundDecorationAttribute(super.value);

  @override
  ForegroundDecorationAttribute create(value) =>
      ForegroundDecorationAttribute(value);
}

class MarginAttribute extends SpacingAttribute<MarginAttribute> {
  const MarginAttribute(super.value);

  @override
  MarginAttribute create(value) => MarginAttribute(value);
}

class BoxShapeAttribute
    extends ScalarVisualAttribute<BoxShapeAttribute, BoxShape> {
  const BoxShapeAttribute(super.value);

  @override
  BoxShapeAttribute create(value) => BoxShapeAttribute(value);
}

class PaddingAttribute extends SpacingAttribute<PaddingAttribute> {
  const PaddingAttribute(super.value);

  @override
  PaddingAttribute create(value) => PaddingAttribute(value);
}

class TransformAttribute
    extends ScalarVisualAttribute<TransformAttribute, Matrix4> {
  const TransformAttribute(super.value);

  @override
  TransformAttribute create(value) => TransformAttribute(value);
}

class TransformAlignmentAttribute
    extends ScalarVisualAttribute<TransformAlignmentAttribute, Alignment> {
  const TransformAlignmentAttribute(super.value);

  @override
  TransformAlignmentAttribute create(value) =>
      TransformAlignmentAttribute(value);
}

class BlendModeAttribute
    extends ScalarVisualAttribute<BlendModeAttribute, BlendMode> {
  const BlendModeAttribute(super.value);

  @override
  BlendModeAttribute create(value) => BlendModeAttribute(value);
}

class BorderRadiusGeometryAttribute extends DtoAttribute<
    BorderRadiusGeometryAttribute,
    BorderRadiusGeometryDto,
    BorderRadiusGeometry> {
  const BorderRadiusGeometryAttribute(super.value);

  @override
  BorderRadiusGeometryAttribute create(value) =>
      BorderRadiusGeometryAttribute(value);
}

class BoxBorderAttribute
    extends DtoAttribute<BoxBorderAttribute, BoxBorderDto, BoxBorder> {
  const BoxBorderAttribute(super.value);

  @override
  BoxBorderAttribute create(value) => BoxBorderAttribute(value);
}

class AlignmentGeometryAttribute extends DtoAttribute<
    AlignmentGeometryAttribute, AlignmentGeometryDto, AlignmentGeometry> {
  const AlignmentGeometryAttribute(super.value);

  @override
  AlignmentGeometryAttribute create(value) => AlignmentGeometryAttribute(value);
}

abstract class SpacingAttribute<T extends SpacingAttribute<T>>
    extends DtoAttribute<T, SpaceGeometryDto, EdgeInsetsGeometry> {
  const SpacingAttribute(super.value);
}
