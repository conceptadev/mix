// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../core/attribute.dart';
import '../../core/utility.dart';

part 'enum_util.g.dart';

/// {@macro vertical_direction_utility}
@MixableScalarUtility()
final class VerticalDirectionUtility<T extends Attribute>
    extends ScalarUtility<T, VerticalDirection>
    with _$VerticalDirectionUtility {
  const VerticalDirectionUtility(super.builder);
}

/// {@macro border_style_utility}
@MixableScalarUtility()
final class BorderStyleUtility<T extends Attribute>
    extends ScalarUtility<T, BorderStyle> with _$BorderStyleUtility {
  const BorderStyleUtility(super.builder);
}

/// {@macro clip_utility}
@MixableScalarUtility()
final class ClipUtility<T extends Attribute> extends ScalarUtility<T, Clip>
    with _$ClipUtility {
  const ClipUtility(super.builder);
}

/// {@macro axis_utility}
@MixableScalarUtility()
final class AxisUtility<T extends Attribute> extends ScalarUtility<T, Axis>
    with _$AxisUtility {
  const AxisUtility(super.builder);
}

/// {@macro flex_fit_utility}
@MixableScalarUtility()
final class FlexFitUtility<T extends Attribute>
    extends ScalarUtility<T, FlexFit> with _$FlexFitUtility {
  const FlexFitUtility(super.builder);
}

/// {@macro stack_fit_utility}
@MixableScalarUtility()
final class StackFitUtility<T extends Attribute>
    extends ScalarUtility<T, StackFit> with _$StackFitUtility {
  const StackFitUtility(super.builder);
}

/// {@macro image_repeat_utility}
@MixableScalarUtility()
final class ImageRepeatUtility<T extends Attribute>
    extends MixUtility<T, ImageRepeat> with _$ImageRepeatUtility {
  const ImageRepeatUtility(super.builder);

  T call([ImageRepeat value = ImageRepeat.repeat]) => builder(value);
}

/// {@macro text_direction_utility}
@MixableScalarUtility()
final class TextDirectionUtility<T extends Attribute>
    extends ScalarUtility<T, TextDirection> with _$TextDirectionUtility {
  const TextDirectionUtility(super.builder);
}

/// {@macro tile_mode_utility}
@MixableScalarUtility()
final class TileModeUtility<T extends Attribute>
    extends ScalarUtility<T, TileMode> with _$TileModeUtility {
  const TileModeUtility(super.builder);
}

/// {@macro main_axis_alignment_utility}
@MixableScalarUtility()
final class MainAxisAlignmentUtility<T extends Attribute>
    extends ScalarUtility<T, MainAxisAlignment>
    with _$MainAxisAlignmentUtility {
  const MainAxisAlignmentUtility(super.builder);
}

/// {@macro cross_axis_alignment_utility}
@MixableScalarUtility()
final class CrossAxisAlignmentUtility<T extends Attribute>
    extends ScalarUtility<T, CrossAxisAlignment>
    with _$CrossAxisAlignmentUtility {
  const CrossAxisAlignmentUtility(super.builder);
}

/// {@macro main_axis_size_utility}
@MixableScalarUtility()
final class MainAxisSizeUtility<T extends Attribute>
    extends ScalarUtility<T, MainAxisSize> with _$MainAxisSizeUtility {
  const MainAxisSizeUtility(super.builder);
}

/// {@macro box_fit_utility}
@MixableScalarUtility()
final class BoxFitUtility<T extends Attribute> extends ScalarUtility<T, BoxFit>
    with _$BoxFitUtility {
  const BoxFitUtility(super.builder);
}

/// {@macro blend_mode_utility}
@MixableScalarUtility()
final class BlendModeUtility<T extends Attribute>
    extends ScalarUtility<T, BlendMode> with _$BlendModeUtility {
  const BlendModeUtility(super.builder);
}

/// {@macro box_shape_utility}
@MixableScalarUtility()
final class BoxShapeUtility<T extends Attribute>
    extends ScalarUtility<T, BoxShape> with _$BoxShapeUtility {
  const BoxShapeUtility(super.builder);
}

/// {@macro font_style_utility}
@MixableScalarUtility()
final class FontStyleUtility<T extends Attribute>
    extends ScalarUtility<T, FontStyle> with _$FontStyleUtility {
  const FontStyleUtility(super.builder);
}

/// {@macro text_decoration_style_utility}
@MixableScalarUtility()
final class TextDecorationStyleUtility<T extends Attribute>
    extends ScalarUtility<T, TextDecorationStyle>
    with _$TextDecorationStyleUtility {
  const TextDecorationStyleUtility(super.builder);
}

/// {@macro text_baseline_utility}
@MixableScalarUtility()
final class TextBaselineUtility<T extends Attribute>
    extends ScalarUtility<T, TextBaseline> with _$TextBaselineUtility {
  const TextBaselineUtility(super.builder);
}

/// {@macro text_overflow_utility}
@MixableScalarUtility()
final class TextOverflowUtility<T extends Attribute>
    extends ScalarUtility<T, TextOverflow> with _$TextOverflowUtility {
  const TextOverflowUtility(super.builder);
}

/// {@macro text_width_basis_utility}
@MixableScalarUtility()
final class TextWidthBasisUtility<T extends Attribute>
    extends ScalarUtility<T, TextWidthBasis> with _$TextWidthBasisUtility {
  const TextWidthBasisUtility(super.builder);
}

/// {@macro text_align_utility}
@MixableScalarUtility()
final class TextAlignUtility<T extends Attribute>
    extends ScalarUtility<T, TextAlign> with _$TextAlignUtility {
  const TextAlignUtility(super.builder);
}

/// {@macro filter_quality_utility}
@MixableScalarUtility()
final class FilterQualityUtility<T extends Attribute>
    extends ScalarUtility<T, FilterQuality> with _$FilterQualityUtility<T> {
  const FilterQualityUtility(super.builder);
}
