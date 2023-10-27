import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../core/dto/border_dto.dart';
import '../core/dto/dtos.dart';
import '../core/style_attribute.dart';

abstract class DoubleAttribute
    extends ModifiableDtoAttribute<DoubleAttribute, DoubleDto, double> {
  const DoubleAttribute(super.value);
}

abstract class ColorAttribute
    extends ModifiableDtoAttribute<ColorAttribute, ColorDto, Color> {
  const ColorAttribute(super.value);
}

class AxisAttribute extends ValueAttribute<AxisAttribute, Axis> {
  const AxisAttribute(super.value);

  @override
  AxisAttribute create(value) => AxisAttribute(value);
}

class MainAxisAlignmentAttribute
    extends ValueAttribute<MainAxisAlignmentAttribute, MainAxisAlignment> {
  const MainAxisAlignmentAttribute(super.value);

  @override
  MainAxisAlignmentAttribute create(value) => MainAxisAlignmentAttribute(value);
}

class MainAxisSizeAttribute
    extends ValueAttribute<MainAxisSizeAttribute, MainAxisSize> {
  const MainAxisSizeAttribute(super.value);

  @override
  MainAxisSizeAttribute create(value) => MainAxisSizeAttribute(value);
}

class CrossAxisAlignmentAttribute
    extends ValueAttribute<CrossAxisAlignmentAttribute, CrossAxisAlignment> {
  const CrossAxisAlignmentAttribute(super.value);

  @override
  CrossAxisAlignmentAttribute create(value) =>
      CrossAxisAlignmentAttribute(value);
}

class VerticalDirectionAttribute
    extends ValueAttribute<VerticalDirectionAttribute, VerticalDirection> {
  const VerticalDirectionAttribute(super.value);

  @override
  VerticalDirectionAttribute create(value) => VerticalDirectionAttribute(value);
}

class TextBaselineAttribute
    extends ValueAttribute<TextBaselineAttribute, TextBaseline> {
  const TextBaselineAttribute(super.value);

  @override
  TextBaselineAttribute create(value) => TextBaselineAttribute(value);
}

class ClipAttribute extends ValueAttribute<ClipAttribute, Clip> {
  const ClipAttribute(super.value);

  @override
  ClipAttribute create(value) => ClipAttribute(value);
}

class ImageColorAttribute extends ColorAttribute {
  const ImageColorAttribute(super.color);

  @override
  ImageColorAttribute create(value) => ImageColorAttribute(value);
}

class ImageAlignmentAttribute
    extends ValueAttribute<ImageAlignmentAttribute, Alignment> {
  const ImageAlignmentAttribute(super.value);

  @override
  ImageAlignmentAttribute create(value) => ImageAlignmentAttribute(value);
}

class ImageScaleAttribute extends DoubleAttribute {
  const ImageScaleAttribute(super.value);

  @override
  ImageScaleAttribute create(value) => ImageScaleAttribute(value);
}

class ImageFitAttribute extends ValueAttribute<ImageFitAttribute, BoxFit> {
  const ImageFitAttribute(super.value);

  @override
  ImageFitAttribute create(value) => ImageFitAttribute(value);
}

class ImageRepeatAttribute
    extends ValueAttribute<ImageRepeatAttribute, ImageRepeat> {
  const ImageRepeatAttribute(super.value);

  @override
  ImageRepeatAttribute create(value) => ImageRepeatAttribute(value);
}

class HeightAttribute extends DoubleAttribute {
  const HeightAttribute(super.value);

  @override
  HeightAttribute create(value) => HeightAttribute(value);
}

class WidthAttribute extends DoubleAttribute {
  const WidthAttribute(super.value);

  @override
  WidthAttribute create(value) => WidthAttribute(value);
}

class GradientAttribute extends ValueAttribute<GradientAttribute, Gradient> {
  const GradientAttribute(super.value);

  @override
  GradientAttribute create(value) => GradientAttribute(value);
}

class TextStrutStyleAttribute
    extends ValueAttribute<TextStrutStyleAttribute, StrutStyle> {
  const TextStrutStyleAttribute(super.value);

  @override
  TextStrutStyleAttribute create(value) => TextStrutStyleAttribute(value);
}

class TextAlignAttribute extends ValueAttribute<TextAlignAttribute, TextAlign> {
  const TextAlignAttribute(super.value);

  @override
  TextAlignAttribute create(value) => TextAlignAttribute(value);
}

class TextDirectionAttribute
    extends ValueAttribute<TextDirectionAttribute, TextDirection> {
  const TextDirectionAttribute(super.value);

  @override
  TextDirectionAttribute create(value) => TextDirectionAttribute(value);
}

class TextSoftWrapAttribute
    extends ValueAttribute<TextSoftWrapAttribute, bool> {
  const TextSoftWrapAttribute(super.value);

  @override
  TextSoftWrapAttribute create(value) => TextSoftWrapAttribute(value);
}

class TextOverflowAttribute
    extends ValueAttribute<TextOverflowAttribute, TextOverflow> {
  const TextOverflowAttribute(super.value);

  @override
  TextOverflowAttribute create(value) => TextOverflowAttribute(value);
}

class TextScaleFactorAttribute extends DoubleAttribute {
  const TextScaleFactorAttribute(super.value);

  @override
  TextScaleFactorAttribute create(value) => TextScaleFactorAttribute(value);
}

class TextMaxLinesAttribute extends ValueAttribute<TextMaxLinesAttribute, int> {
  const TextMaxLinesAttribute(super.value);

  @override
  TextMaxLinesAttribute create(value) => TextMaxLinesAttribute(value);
}

class TextWidthBasisAttribute
    extends ValueAttribute<TextWidthBasisAttribute, TextWidthBasis> {
  const TextWidthBasisAttribute(super.value);

  @override
  TextWidthBasisAttribute create(value) => TextWidthBasisAttribute(value);
}

class TextHeightBehaviorAttribute
    extends ValueAttribute<TextHeightBehaviorAttribute, TextHeightBehavior> {
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

class IconSizeAttribute extends DoubleAttribute {
  const IconSizeAttribute(super.value);

  @override
  IconSizeAttribute create(value) => IconSizeAttribute(value);
}

class BoxFitAttribute extends ValueAttribute<BoxFitAttribute, BoxFit> {
  const BoxFitAttribute(super.value);

  @override
  BoxFitAttribute create(value) => BoxFitAttribute(value);
}

class StackFitAttribute extends ValueAttribute<StackFitAttribute, StackFit> {
  const StackFitAttribute(super.value);

  @override
  StackFitAttribute create(value) => StackFitAttribute(value);
}

class AlignmentAttribute extends ValueAttribute<AlignmentAttribute, Alignment> {
  const AlignmentAttribute(super.value);

  @override
  AlignmentAttribute create(value) => AlignmentAttribute(value);
}

class FlexFitAttribute extends ValueAttribute<FlexFitAttribute, FlexFit> {
  const FlexFitAttribute(super.value);

  @override
  FlexFitAttribute create(value) => FlexFitAttribute(value);
}

class ForegroundDecorationAttribute
    extends ValueAttribute<ForegroundDecorationAttribute, Decoration> {
  const ForegroundDecorationAttribute(super.value);

  @override
  ForegroundDecorationAttribute create(value) =>
      ForegroundDecorationAttribute(value);
}

class ConstraintsAttribute
    extends ValueAttribute<ConstraintsAttribute, BoxConstraints> {
  const ConstraintsAttribute(super.value);

  @override
  ConstraintsAttribute create(value) => ConstraintsAttribute(value);
}

class MarginAttribute extends SpacingAttribute<MarginAttribute> {
  const MarginAttribute(super.value);

  @override
  MarginAttribute create(value) => MarginAttribute(value);
}

class PaddingAttribute extends SpacingAttribute<PaddingAttribute> {
  const PaddingAttribute(super.value);

  @override
  PaddingAttribute create(value) => PaddingAttribute(value);
}

class TransformAttribute extends ValueAttribute<TransformAttribute, Matrix4> {
  const TransformAttribute(super.value);

  @override
  TransformAttribute create(value) => TransformAttribute(value);
}

class TransformAlignmentAttribute
    extends ValueAttribute<TransformAlignmentAttribute, Alignment> {
  const TransformAlignmentAttribute(super.value);

  @override
  TransformAlignmentAttribute create(value) =>
      TransformAlignmentAttribute(value);
}

class BlendModeAttribute extends ValueAttribute<BlendModeAttribute, BlendMode> {
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
