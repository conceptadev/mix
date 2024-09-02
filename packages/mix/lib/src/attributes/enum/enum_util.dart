// ignore_for_file: unused_element

import 'package:flutter/widgets.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../core/attribute.dart';
import '../../core/utility.dart';

part 'enum_util.g.dart';

/// {@macro vertical_direction_utility}
@MixableEnumUtility()
final class VerticalDirectionUtility<T extends Attribute>
    extends MixUtility<T, VerticalDirection> with _$VerticalDirectionUtility {
  const VerticalDirectionUtility(super.build);
}

/// {@macro border_style_utility}
@MixableEnumUtility()
final class BorderStyleUtility<T extends Attribute>
    extends MixUtility<T, BorderStyle> with _$BorderStyleUtility {
  const BorderStyleUtility(super.build);
}

/// {@macro clip_utility}
@MixableEnumUtility()
final class ClipUtility<T extends Attribute> extends MixUtility<T, Clip>
    with _$ClipUtility {
  const ClipUtility(super.build);
}

/// {@macro axis_utility}
@MixableEnumUtility()
final class AxisUtility<T extends Attribute> extends MixUtility<T, Axis>
    with _$AxisUtility {
  const AxisUtility(super.build);
}

/// {@macro flex_fit_utility}
@MixableEnumUtility()
final class FlexFitUtility<T extends Attribute> extends MixUtility<T, FlexFit>
    with _$FlexFitUtility {
  const FlexFitUtility(super.build);
}

/// {@macro stack_fit_utility}
@MixableEnumUtility()
final class StackFitUtility<T extends Attribute> extends MixUtility<T, StackFit>
    with _$StackFitUtility {
  const StackFitUtility(super.build);
}

/// {@macro image_repeat_utility}
@MixableEnumUtility(generateCallMethod: false)
final class ImageRepeatUtility<T extends Attribute>
    extends MixUtility<T, ImageRepeat> with _$ImageRepeatUtility {
  const ImageRepeatUtility(super.build);

  T call([ImageRepeat value = ImageRepeat.repeat]) => build(value);
}

/// {@macro text_direction_utility}
@MixableEnumUtility()
final class TextDirectionUtility<T extends Attribute>
    extends MixUtility<T, TextDirection> with _$TextDirectionUtility {
  const TextDirectionUtility(super.build);
}

/// {@macro tile_mode_utility}
@MixableEnumUtility()
final class TileModeUtility<T extends Attribute> extends MixUtility<T, TileMode>
    with _$TileModeUtility {
  const TileModeUtility(super.build);
}

/// {@macro main_axis_alignment_utility}
@MixableEnumUtility()
final class MainAxisAlignmentUtility<T extends Attribute>
    extends MixUtility<T, MainAxisAlignment> with _$MainAxisAlignmentUtility {
  const MainAxisAlignmentUtility(super.build);
}

/// {@macro cross_axis_alignment_utility}
@MixableEnumUtility()
final class CrossAxisAlignmentUtility<T extends Attribute>
    extends MixUtility<T, CrossAxisAlignment> with _$CrossAxisAlignmentUtility {
  const CrossAxisAlignmentUtility(super.build);
}

/// {@macro main_axis_size_utility}
@MixableEnumUtility()
final class MainAxisSizeUtility<T extends Attribute>
    extends MixUtility<T, MainAxisSize> with _$MainAxisSizeUtility {
  const MainAxisSizeUtility(super.build);
}

/// {@macro box_fit_utility}
@MixableEnumUtility()
final class BoxFitUtility<T extends Attribute> extends MixUtility<T, BoxFit>
    with _$BoxFitUtility {
  const BoxFitUtility(super.build);
}

/// {@macro blend_mode_utility}
@MixableEnumUtility()
final class BlendModeUtility<T extends Attribute>
    extends MixUtility<T, BlendMode> with _$BlendModeUtility {
  const BlendModeUtility(super.build);
}

/// {@macro box_shape_utility}
@MixableEnumUtility()
final class BoxShapeUtility<T extends Attribute> extends MixUtility<T, BoxShape>
    with _$BoxShapeUtility {
  const BoxShapeUtility(super.build);
}

/// {@macro font_style_utility}
@MixableEnumUtility()
final class FontStyleUtility<T extends Attribute>
    extends MixUtility<T, FontStyle> with _$FontStyleUtility {
  const FontStyleUtility(super.build);
}

/// {@macro text_decoration_style_utility}
@MixableEnumUtility()
final class TextDecorationStyleUtility<T extends Attribute>
    extends MixUtility<T, TextDecorationStyle>
    with _$TextDecorationStyleUtility {
  const TextDecorationStyleUtility(super.build);
}

/// {@macro text_baseline_utility}
@MixableEnumUtility()
final class TextBaselineUtility<T extends Attribute>
    extends MixUtility<T, TextBaseline> with _$TextBaselineUtility {
  const TextBaselineUtility(super.build);
}

/// {@macro text_overflow_utility}
@MixableEnumUtility()
final class TextOverflowUtility<T extends Attribute>
    extends MixUtility<T, TextOverflow> with _$TextOverflowUtility {
  const TextOverflowUtility(super.build);
}

/// {@macro text_width_basis_utility}
@MixableEnumUtility()
final class TextWidthBasisUtility<T extends Attribute>
    extends MixUtility<T, TextWidthBasis> with _$TextWidthBasisUtility {
  const TextWidthBasisUtility(super.build);
}

/// {@macro text_align_utility}
@MixableEnumUtility()
final class TextAlignUtility<T extends Attribute>
    extends MixUtility<T, TextAlign> with _$TextAlignUtility {
  const TextAlignUtility(super.build);
}

/// {@macro filter_quality_utility}
@MixableEnumUtility()
final class FilterQualityUtility<T extends Attribute>
    extends MixUtility<T, FilterQuality> with _$FilterQualityUtility<T> {
  const FilterQualityUtility(super.build);
}

/// {@macro wrap_alignment_utility}
@MixableEnumUtility()
final class WrapAlignmentUtility<T extends Attribute>
    extends MixUtility<T, WrapAlignment> with _$WrapAlignmentUtility {
  const WrapAlignmentUtility(super.build);
}

@MixableEnumUtility()
class TableCellVerticalAlignmentUtility<T extends Attribute>
    extends MixUtility<T, TableCellVerticalAlignment>
    with _$TableCellVerticalAlignmentUtility<T> {
  const TableCellVerticalAlignmentUtility(super.build);
}
