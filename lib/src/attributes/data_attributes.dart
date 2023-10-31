import 'package:flutter/rendering.dart';

import '../core/attribute.dart';
import '../core/dto/alignment_dto.dart';
import '../core/dto/border_dto.dart';
import '../core/dto/color_dto.dart';
import '../core/dto/constraints_dto.dart';
import '../core/dto/decoration_dto.dart';
import '../core/dto/edge_insets_dto.dart';
import '../core/dto/strut_style_dto.dart';
import '../core/dto/text_style_dto.dart';

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
    AlignmentGeometryAttribute, AlignmentGeometryData, AlignmentGeometry> {
  const AlignmentGeometryAttribute(super.value);

  @override
  AlignmentGeometryAttribute create(value) => AlignmentGeometryAttribute(value);
}

class ConstraintsAttribute<T extends Data<R>, R extends Constraints>
    extends DataAttribute<ConstraintsAttribute<T, R>, T, R> {
  const ConstraintsAttribute(super.value);

  @override
  ConstraintsAttribute<T, R> create(T value) => ConstraintsAttribute(value);
}

class BoxConstraintsAttribute
    extends ConstraintsAttribute<BoxConstraintsData, BoxConstraints> {
  const BoxConstraintsAttribute(super.value);

  @override
  BoxConstraintsAttribute create(value) => BoxConstraintsAttribute(value);
}

class DecorationAttribute
    extends DataAttribute<DecorationAttribute, DecorationData, Decoration> {
  const DecorationAttribute(super.value);

  @override
  DecorationAttribute create(value) => DecorationAttribute(value);
}

abstract class SpacingGeometryAttribute<T extends SpacingGeometryAttribute<T>>
    extends DataAttribute<T, SpacingGeometryData, EdgeInsetsGeometry> {
  const SpacingGeometryAttribute(super.value);
}

class PaddingAttribute extends SpacingGeometryAttribute<PaddingAttribute> {
  const PaddingAttribute(super.value);

  @override
  PaddingAttribute create(value) => PaddingAttribute(value);
}

class MarginAttribute extends SpacingGeometryAttribute<MarginAttribute> {
  const MarginAttribute(super.value);

  @override
  MarginAttribute create(value) => MarginAttribute(value);
}

abstract class ColorAttribute
    extends DataAttribute<ColorAttribute, ColorData, Color> {
  const ColorAttribute(super.value);
}

class IconColorAttribute extends ColorAttribute {
  const IconColorAttribute(super.color);

  @override
  IconColorAttribute create(value) => IconColorAttribute(value);
}

class ImageColorAttribute extends ColorAttribute {
  const ImageColorAttribute(super.color);

  @override
  ImageColorAttribute create(value) => ImageColorAttribute(value);
}
