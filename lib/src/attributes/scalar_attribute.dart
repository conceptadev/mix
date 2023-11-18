import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'attribute.dart';

abstract class DoubleAttribute<T extends DoubleAttribute<T>>
    extends ScalarAttribute<T, double> {
  const DoubleAttribute(super.value);
}

class AxisAttribute extends ScalarAttribute<AxisAttribute, Axis> {
  const AxisAttribute(super.value);

  static AxisAttribute? maybe(Axis? value) =>
      value == null ? null : AxisAttribute(value);

  @override
  final create = AxisAttribute.new;
}

class GradientAttribute extends ScalarAttribute<GradientAttribute, Gradient> {
  const GradientAttribute(super.value);

  static GradientAttribute? maybe(Gradient? value) =>
      value == null ? null : GradientAttribute(value);

  @override
  final create = GradientAttribute.new;
}

class GapAttribute extends DoubleAttribute<GapAttribute> {
  const GapAttribute(super.value);

  static GapAttribute? maybe(double? value) =>
      value == null ? null : GapAttribute(value);

  @override
  final create = GapAttribute.new;
}

class MainAxisAlignmentAttribute
    extends ScalarAttribute<MainAxisAlignmentAttribute, MainAxisAlignment> {
  const MainAxisAlignmentAttribute(super.value);

  static MainAxisAlignmentAttribute? maybe(MainAxisAlignment? value) =>
      value == null ? null : MainAxisAlignmentAttribute(value);

  @override
  final create = MainAxisAlignmentAttribute.new;
}

class TransformAlignmentAttribute
    extends ScalarAttribute<TransformAlignmentAttribute, Alignment> {
  const TransformAlignmentAttribute(super.value);

  static TransformAlignmentAttribute? maybe(Alignment? value) =>
      value == null ? null : TransformAlignmentAttribute(value);

  @override
  final create = TransformAlignmentAttribute.new;
}

class MainAxisSizeAttribute
    extends ScalarAttribute<MainAxisSizeAttribute, MainAxisSize> {
  const MainAxisSizeAttribute(super.value);

  static MainAxisSizeAttribute? maybe(MainAxisSize? value) =>
      value == null ? null : MainAxisSizeAttribute(value);

  @override
  final create = MainAxisSizeAttribute.new;
}

class CrossAxisAlignmentAttribute
    extends ScalarAttribute<CrossAxisAlignmentAttribute, CrossAxisAlignment> {
  const CrossAxisAlignmentAttribute(super.value);

  static CrossAxisAlignmentAttribute? maybe(CrossAxisAlignment? value) =>
      value == null ? null : CrossAxisAlignmentAttribute(value);

  @override
  final create = CrossAxisAlignmentAttribute.new;
}

class VerticalDirectionAttribute
    extends ScalarAttribute<VerticalDirectionAttribute, VerticalDirection> {
  const VerticalDirectionAttribute(super.value);

  static VerticalDirectionAttribute? maybe(VerticalDirection? value) =>
      value == null ? null : VerticalDirectionAttribute(value);

  @override
  final create = VerticalDirectionAttribute.new;
}

class TextBaselineAttribute
    extends ScalarAttribute<TextBaselineAttribute, TextBaseline> {
  const TextBaselineAttribute(super.value);

  static TextBaselineAttribute? maybe(TextBaseline? value) =>
      value == null ? null : TextBaselineAttribute(value);

  @override
  final create = TextBaselineAttribute.new;
}

class ClipAttribute extends ScalarAttribute<ClipAttribute, Clip> {
  const ClipAttribute(super.value);

  static ClipAttribute? maybe(Clip? value) =>
      value == null ? null : ClipAttribute(value);

  @override
  final create = ClipAttribute.new;
}

class TextDecorationAttribute
    extends ScalarAttribute<TextDecorationAttribute, TextDecoration> {
  const TextDecorationAttribute(super.value);

  static TextDecorationAttribute? maybe(TextDecoration? value) =>
      value == null ? null : TextDecorationAttribute(value);

  @override
  final create = TextDecorationAttribute.new;
}

class TextDecorationStyleAttribute
    extends ScalarAttribute<TextDecorationStyleAttribute, TextDecorationStyle> {
  const TextDecorationStyleAttribute(super.value);

  static TextDecorationStyleAttribute? maybe(TextDecorationStyle? value) =>
      value == null ? null : TextDecorationStyleAttribute(value);

  @override
  final create = TextDecorationStyleAttribute.new;
}

class FontStyleAttribute
    extends ScalarAttribute<FontStyleAttribute, FontStyle> {
  const FontStyleAttribute(super.value);

  static FontStyleAttribute? maybe(FontStyle? value) =>
      value == null ? null : FontStyleAttribute(value);

  @override
  final create = FontStyleAttribute.new;
}

class FontWeightAttribute
    extends ScalarAttribute<FontWeightAttribute, FontWeight> {
  const FontWeightAttribute(super.value);

  static FontWeightAttribute? maybe(FontWeight? value) =>
      value == null ? null : FontWeightAttribute(value);

  @override
  final create = FontWeightAttribute.new;
}

class FontFeatureAttribute
    extends ScalarAttribute<FontFeatureAttribute, FontFeature> {
  const FontFeatureAttribute(super.value);

  static FontFeatureAttribute? maybe(FontFeature? value) =>
      value == null ? null : FontFeatureAttribute(value);

  @override
  final create = FontFeatureAttribute.new;
}

class FontFamilyAttribute extends ScalarAttribute<FontFamilyAttribute, String> {
  const FontFamilyAttribute(super.value);

  static FontFamilyAttribute? maybe(String? value) =>
      value == null ? null : FontFamilyAttribute(value);

  @override
  final create = FontFamilyAttribute.new;
}

class FontSizeAttribute extends DoubleAttribute<FontSizeAttribute> {
  const FontSizeAttribute(super.value);

  static FontSizeAttribute? maybe(double? value) =>
      value == null ? null : FontSizeAttribute(value);

  @override
  final create = FontSizeAttribute.new;
}

class LetterSpacingAttribute extends DoubleAttribute<LetterSpacingAttribute> {
  const LetterSpacingAttribute(super.value);

  static LetterSpacingAttribute? maybe(double? value) =>
      value == null ? null : LetterSpacingAttribute(value);

  @override
  final create = LetterSpacingAttribute.new;
}

class WordSpacingAttribute extends DoubleAttribute<WordSpacingAttribute> {
  const WordSpacingAttribute(super.value);

  static WordSpacingAttribute? maybe(double? value) =>
      value == null ? null : WordSpacingAttribute(value);

  @override
  final create = WordSpacingAttribute.new;
}

class LineHeightAttribute extends DoubleAttribute<LineHeightAttribute> {
  const LineHeightAttribute(super.value);

  static LineHeightAttribute? maybe(double? value) =>
      value == null ? null : LineHeightAttribute(value);

  @override
  final create = LineHeightAttribute.new;
}

class ImageAlignmentAttribute
    extends ScalarAttribute<ImageAlignmentAttribute, Alignment> {
  const ImageAlignmentAttribute(super.value);

  static ImageAlignmentAttribute? maybe(Alignment? value) =>
      value == null ? null : ImageAlignmentAttribute(value);

  @override
  final create = ImageAlignmentAttribute.new;
}

class PaintAttribute extends ScalarAttribute<PaintAttribute, Paint> {
  const PaintAttribute(super.value);

  static PaintAttribute? maybe(Paint? value) =>
      value == null ? null : PaintAttribute(value);

  @override
  final create = PaintAttribute.new;
}

class ImageScaleAttribute extends DoubleAttribute<ImageScaleAttribute> {
  const ImageScaleAttribute(super.value);

  static ImageScaleAttribute? maybe(double? value) =>
      value == null ? null : ImageScaleAttribute(value);

  @override
  final create = ImageScaleAttribute.new;
}

class ImageFitAttribute extends ScalarAttribute<ImageFitAttribute, BoxFit> {
  const ImageFitAttribute(super.value);

  static ImageFitAttribute? maybe(BoxFit? value) =>
      value == null ? null : ImageFitAttribute(value);

  @override
  final create = ImageFitAttribute.new;
}

class ImageRepeatAttribute
    extends ScalarAttribute<ImageRepeatAttribute, ImageRepeat> {
  const ImageRepeatAttribute(super.value);

  static ImageRepeatAttribute? maybe(ImageRepeat? value) =>
      value == null ? null : ImageRepeatAttribute(value);

  @override
  final create = ImageRepeatAttribute.new;
}

class ImageWidthAttribute extends DoubleAttribute<ImageWidthAttribute> {
  const ImageWidthAttribute(super.value);

  static ImageWidthAttribute? maybe(double? value) =>
      value == null ? null : ImageWidthAttribute(value);

  @override
  final create = ImageWidthAttribute.new;
}

class ImageHeightAttribute extends DoubleAttribute<ImageHeightAttribute> {
  const ImageHeightAttribute(super.value);

  static ImageHeightAttribute? maybe(double? value) =>
      value == null ? null : ImageHeightAttribute(value);

  @override
  final create = ImageHeightAttribute.new;
}

class TextAlignAttribute
    extends ScalarAttribute<TextAlignAttribute, TextAlign> {
  const TextAlignAttribute(super.value);

  static TextAlignAttribute? maybe(TextAlign? value) =>
      value == null ? null : TextAlignAttribute(value);

  @override
  final create = TextAlignAttribute.new;
}

class TextDirectionAttribute
    extends ScalarAttribute<TextDirectionAttribute, TextDirection> {
  const TextDirectionAttribute(super.value);

  static TextDirectionAttribute? maybe(TextDirection? value) =>
      value == null ? null : TextDirectionAttribute(value);

  @override
  final create = TextDirectionAttribute.new;
}

class SoftWrapAttribute extends ScalarAttribute<SoftWrapAttribute, bool> {
  const SoftWrapAttribute(super.value);

  static SoftWrapAttribute? maybe(bool? value) =>
      value == null ? null : SoftWrapAttribute(value);

  @override
  final create = SoftWrapAttribute.new;
}

class TextOverflowAttribute
    extends ScalarAttribute<TextOverflowAttribute, TextOverflow> {
  const TextOverflowAttribute(super.value);

  static TextOverflowAttribute? maybe(TextOverflow? value) =>
      value == null ? null : TextOverflowAttribute(value);

  @override
  final create = TextOverflowAttribute.new;
}

class TextScaleFactorAttribute
    extends DoubleAttribute<TextScaleFactorAttribute> {
  const TextScaleFactorAttribute(super.value);

  static TextScaleFactorAttribute? maybe(double? value) =>
      value == null ? null : TextScaleFactorAttribute(value);

  @override
  final create = TextScaleFactorAttribute.new;
}

class MaxLinesAttribute extends ScalarAttribute<MaxLinesAttribute, int> {
  const MaxLinesAttribute(super.value);

  static MaxLinesAttribute? maybe(int? value) =>
      value == null ? null : MaxLinesAttribute(value);

  @override
  final create = MaxLinesAttribute.new;
}

class TextWidthBasisAttribute
    extends ScalarAttribute<TextWidthBasisAttribute, TextWidthBasis> {
  const TextWidthBasisAttribute(super.value);

  static TextWidthBasisAttribute? maybe(TextWidthBasis? value) =>
      value == null ? null : TextWidthBasisAttribute(value);

  @override
  final create = TextWidthBasisAttribute.new;
}

class TextHeightBehaviorAttribute
    extends ScalarAttribute<TextHeightBehaviorAttribute, TextHeightBehavior> {
  const TextHeightBehaviorAttribute(super.value);

  static TextHeightBehaviorAttribute? maybe(TextHeightBehavior? value) =>
      value == null ? null : TextHeightBehaviorAttribute(value);

  @override
  final create = TextHeightBehaviorAttribute.new;
}

class IconSizeAttribute extends DoubleAttribute<IconSizeAttribute> {
  const IconSizeAttribute(super.value);

  static IconSizeAttribute? maybe(double? value) =>
      value == null ? null : IconSizeAttribute(value);

  @override
  final create = IconSizeAttribute.new;
}

class BoxFitAttribute extends ScalarAttribute<BoxFitAttribute, BoxFit> {
  const BoxFitAttribute(super.value);

  static BoxFitAttribute? maybe(BoxFit? value) =>
      value == null ? null : BoxFitAttribute(value);

  @override
  final create = BoxFitAttribute.new;
}

class StackFitAttribute extends ScalarAttribute<StackFitAttribute, StackFit> {
  const StackFitAttribute(super.value);

  static StackFitAttribute? maybe(StackFit? value) =>
      value == null ? null : StackFitAttribute(value);

  @override
  final create = StackFitAttribute.new;
}

class FlexFitAttribute extends ScalarAttribute<FlexFitAttribute, FlexFit> {
  const FlexFitAttribute(super.value);

  static FlexFitAttribute? maybe(FlexFit? value) =>
      value == null ? null : FlexFitAttribute(value);

  @override
  final create = FlexFitAttribute.new;
}

class TransformAttribute extends ScalarAttribute<TransformAttribute, Matrix4> {
  const TransformAttribute(super.value);

  static TransformAttribute? maybe(Matrix4? value) =>
      value == null ? null : TransformAttribute(value);

  @override
  final create = TransformAttribute.new;
}

class BlendModeAttribute
    extends ScalarAttribute<BlendModeAttribute, BlendMode> {
  const BlendModeAttribute(super.value);

  static BlendModeAttribute? maybe(BlendMode? value) =>
      value == null ? null : BlendModeAttribute(value);

  @override
  final create = BlendModeAttribute.new;
}

class BoxShapeAttribute extends ScalarAttribute<BoxShapeAttribute, BoxShape> {
  const BoxShapeAttribute(super.value);

  static BoxShapeAttribute? maybe(BoxShape? value) =>
      value == null ? null : BoxShapeAttribute(value);

  @override
  final create = BoxShapeAttribute.new;
}

class VisibleAttribute extends ScalarAttribute<VisibleAttribute, bool> {
  const VisibleAttribute(super.value);

  static VisibleAttribute? maybe(bool? value) =>
      value == null ? null : VisibleAttribute(value);

  @override
  final create = VisibleAttribute.new;
}
