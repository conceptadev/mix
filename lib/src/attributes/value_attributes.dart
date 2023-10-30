import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../core/attribute.dart';
import '../core/dto/border_dto.dart';
import '../core/dto/dtos.dart';

abstract class DoubleAttribute
    extends ModifiableDtoAttribute<DoubleAttribute, DoubleDto, double> {
  const DoubleAttribute(super.value);
}

abstract class ColorAttribute
    extends ModifiableDtoAttribute<ColorAttribute, ColorDto, Color> {
  const ColorAttribute(super.value);
}

class AxisAttribute extends SingleValueAttribute<AxisAttribute, Axis> {
  const AxisAttribute(super.value);

  @override
  AxisAttribute create(value) => AxisAttribute(value);
}

class MainAxisAlignmentAttribute extends SingleValueAttribute<
    MainAxisAlignmentAttribute, MainAxisAlignment> {
  const MainAxisAlignmentAttribute(super.value);

  @override
  MainAxisAlignmentAttribute create(value) => MainAxisAlignmentAttribute(value);
}

class MainAxisSizeAttribute
    extends SingleValueAttribute<MainAxisSizeAttribute, MainAxisSize> {
  const MainAxisSizeAttribute(super.value);

  @override
  MainAxisSizeAttribute create(value) => MainAxisSizeAttribute(value);
}

class CrossAxisAlignmentAttribute extends SingleValueAttribute<
    CrossAxisAlignmentAttribute, CrossAxisAlignment> {
  const CrossAxisAlignmentAttribute(super.value);

  @override
  CrossAxisAlignmentAttribute create(value) =>
      CrossAxisAlignmentAttribute(value);
}

class VerticalDirectionAttribute extends SingleValueAttribute<
    VerticalDirectionAttribute, VerticalDirection> {
  const VerticalDirectionAttribute(super.value);

  @override
  VerticalDirectionAttribute create(value) => VerticalDirectionAttribute(value);
}

class TextBaselineAttribute
    extends SingleValueAttribute<TextBaselineAttribute, TextBaseline> {
  const TextBaselineAttribute(super.value);

  @override
  TextBaselineAttribute create(value) => TextBaselineAttribute(value);
}

class ClipAttribute extends SingleValueAttribute<ClipAttribute, Clip> {
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
    extends SingleValueAttribute<ImageAlignmentAttribute, Alignment> {
  const ImageAlignmentAttribute(super.value);

  @override
  ImageAlignmentAttribute create(value) => ImageAlignmentAttribute(value);
}

class ImageScaleAttribute extends DoubleAttribute {
  const ImageScaleAttribute(super.value);

  @override
  ImageScaleAttribute create(value) => ImageScaleAttribute(value);
}

class ImageFitAttribute
    extends SingleValueAttribute<ImageFitAttribute, BoxFit> {
  const ImageFitAttribute(super.value);

  @override
  ImageFitAttribute create(value) => ImageFitAttribute(value);
}

class ImageRepeatAttribute
    extends SingleValueAttribute<ImageRepeatAttribute, ImageRepeat> {
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

class GradientAttribute
    extends SingleValueAttribute<GradientAttribute, Gradient> {
  const GradientAttribute(super.value);

  @override
  GradientAttribute create(value) => GradientAttribute(value);
}

class TextStrutStyleAttribute
    extends SingleValueAttribute<TextStrutStyleAttribute, StrutStyle> {
  const TextStrutStyleAttribute(super.value);

  @override
  TextStrutStyleAttribute create(value) => TextStrutStyleAttribute(value);
}

class TextAlignAttribute
    extends SingleValueAttribute<TextAlignAttribute, TextAlign> {
  const TextAlignAttribute(super.value);

  @override
  TextAlignAttribute create(value) => TextAlignAttribute(value);
}

class TextDirectionAttribute
    extends SingleValueAttribute<TextDirectionAttribute, TextDirection> {
  const TextDirectionAttribute(super.value);

  @override
  TextDirectionAttribute create(value) => TextDirectionAttribute(value);
}

class SoftWrapAttribute extends SingleValueAttribute<SoftWrapAttribute, bool> {
  const SoftWrapAttribute(super.value);

  @override
  SoftWrapAttribute create(value) => SoftWrapAttribute(value);
}

class TextOverflowAttribute
    extends SingleValueAttribute<TextOverflowAttribute, TextOverflow> {
  const TextOverflowAttribute(super.value);

  @override
  TextOverflowAttribute create(value) => TextOverflowAttribute(value);
}

class TextScaleFactorAttribute extends DoubleAttribute {
  const TextScaleFactorAttribute(super.value);

  @override
  TextScaleFactorAttribute create(value) => TextScaleFactorAttribute(value);
}

class MaxLinesAttribute extends SingleValueAttribute<MaxLinesAttribute, int> {
  const MaxLinesAttribute(super.value);

  @override
  MaxLinesAttribute create(value) => MaxLinesAttribute(value);
}

class TextWidthBasisAttribute
    extends SingleValueAttribute<TextWidthBasisAttribute, TextWidthBasis> {
  const TextWidthBasisAttribute(super.value);

  @override
  TextWidthBasisAttribute create(value) => TextWidthBasisAttribute(value);
}

class TextHeightBehaviorAttribute extends SingleValueAttribute<
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

class IconSizeAttribute extends DoubleAttribute {
  const IconSizeAttribute(super.value);

  @override
  IconSizeAttribute create(value) => IconSizeAttribute(value);
}

class BoxFitAttribute extends SingleValueAttribute<BoxFitAttribute, BoxFit> {
  const BoxFitAttribute(super.value);

  @override
  BoxFitAttribute create(value) => BoxFitAttribute(value);
}

class StackFitAttribute
    extends SingleValueAttribute<StackFitAttribute, StackFit> {
  const StackFitAttribute(super.value);

  @override
  StackFitAttribute create(value) => StackFitAttribute(value);
}

class FlexFitAttribute extends SingleValueAttribute<FlexFitAttribute, FlexFit> {
  const FlexFitAttribute(super.value);

  @override
  FlexFitAttribute create(value) => FlexFitAttribute(value);
}

class ForegroundDecorationAttribute
    extends SingleValueAttribute<ForegroundDecorationAttribute, Decoration> {
  const ForegroundDecorationAttribute(super.value);

  @override
  ForegroundDecorationAttribute create(value) =>
      ForegroundDecorationAttribute(value);
}

class ConstraintsAttribute
    extends SingleValueAttribute<ConstraintsAttribute, BoxConstraints> {
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

class TransformAttribute
    extends SingleValueAttribute<TransformAttribute, Matrix4> {
  const TransformAttribute(super.value);

  @override
  TransformAttribute create(value) => TransformAttribute(value);
}

class TransformAlignmentAttribute
    extends SingleValueAttribute<TransformAlignmentAttribute, Alignment> {
  const TransformAlignmentAttribute(super.value);

  @override
  TransformAlignmentAttribute create(value) =>
      TransformAlignmentAttribute(value);
}

class BlendModeAttribute
    extends SingleValueAttribute<BlendModeAttribute, BlendMode> {
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
