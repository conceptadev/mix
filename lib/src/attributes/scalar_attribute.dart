import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'attribute.dart';

class DoubleAttribute extends ValueAttribute<double> {
  const DoubleAttribute(super.value);
}

class AxisAttribute extends ValueAttribute<Axis> {
  const AxisAttribute(super.value);

  static AxisAttribute? maybe(Axis? value) =>
      value == null ? null : AxisAttribute(value);
}

class GradientAttribute extends ValueAttribute<Gradient> {
  const GradientAttribute(super.value);

  static GradientAttribute? maybe(Gradient? value) =>
      value == null ? null : GradientAttribute(value);
}

class GapAttribute extends ValueAttribute<double> {
  const GapAttribute(super.value);

  static GapAttribute? maybe(double? value) =>
      value == null ? null : GapAttribute(value);
}

class MainAxisAlignmentAttribute extends ValueAttribute<MainAxisAlignment> {
  const MainAxisAlignmentAttribute(super.value);

  static MainAxisAlignmentAttribute? maybe(MainAxisAlignment? value) =>
      value == null ? null : MainAxisAlignmentAttribute(value);
}

class TransformAlignmentAttribute extends ValueAttribute<Alignment> {
  const TransformAlignmentAttribute(super.value);

  static TransformAlignmentAttribute? maybe(Alignment? value) =>
      value == null ? null : TransformAlignmentAttribute(value);
}

class MainAxisSizeAttribute extends ValueAttribute<MainAxisSize> {
  const MainAxisSizeAttribute(super.value);

  static MainAxisSizeAttribute? maybe(MainAxisSize? value) =>
      value == null ? null : MainAxisSizeAttribute(value);
}

class CrossAxisAlignmentAttribute extends ValueAttribute<CrossAxisAlignment> {
  const CrossAxisAlignmentAttribute(super.value);

  static CrossAxisAlignmentAttribute? maybe(CrossAxisAlignment? value) =>
      value == null ? null : CrossAxisAlignmentAttribute(value);
}

class VerticalDirectionAttribute extends ValueAttribute<VerticalDirection> {
  const VerticalDirectionAttribute(super.value);

  static VerticalDirectionAttribute? maybe(VerticalDirection? value) =>
      value == null ? null : VerticalDirectionAttribute(value);
}

class TextBaselineAttribute extends ValueAttribute<TextBaseline> {
  const TextBaselineAttribute(super.value);

  static TextBaselineAttribute? maybe(TextBaseline? value) =>
      value == null ? null : TextBaselineAttribute(value);
}

class ClipAttribute extends ValueAttribute<Clip> {
  const ClipAttribute(super.value);

  static ClipAttribute? maybe(Clip? value) =>
      value == null ? null : ClipAttribute(value);
}

class TextDecorationAttribute extends ValueAttribute<TextDecoration> {
  const TextDecorationAttribute(super.value);

  static TextDecorationAttribute? maybe(TextDecoration? value) =>
      value == null ? null : TextDecorationAttribute(value);
}

class TextDecorationStyleAttribute extends ValueAttribute<TextDecorationStyle> {
  const TextDecorationStyleAttribute(super.value);

  static TextDecorationStyleAttribute? maybe(TextDecorationStyle? value) =>
      value == null ? null : TextDecorationStyleAttribute(value);
}

class FontStyleAttribute extends ValueAttribute<FontStyle> {
  const FontStyleAttribute(super.value);

  static FontStyleAttribute? maybe(FontStyle? value) =>
      value == null ? null : FontStyleAttribute(value);
}

class FontFeatureAttribute extends ValueAttribute<FontFeature> {
  const FontFeatureAttribute(super.value);

  static FontFeatureAttribute? maybe(FontFeature? value) =>
      value == null ? null : FontFeatureAttribute(value);
}

class FontFamilyAttribute extends ValueAttribute<String> {
  const FontFamilyAttribute(super.value);

  static FontFamilyAttribute? maybe(String? value) =>
      value == null ? null : FontFamilyAttribute(value);
}

class FontSizeAttribute extends ValueAttribute<double> {
  const FontSizeAttribute(super.value);

  static FontSizeAttribute? maybe(double? value) =>
      value == null ? null : FontSizeAttribute(value);
}

class ImageAlignmentAttribute extends ValueAttribute<Alignment> {
  const ImageAlignmentAttribute(super.value);

  static ImageAlignmentAttribute? maybe(Alignment? value) =>
      value == null ? null : ImageAlignmentAttribute(value);
}

class PaintAttribute extends ValueAttribute<Paint> {
  const PaintAttribute(super.value);

  static PaintAttribute? maybe(Paint? value) =>
      value == null ? null : PaintAttribute(value);
}

class ImageFitAttribute extends ValueAttribute<BoxFit> {
  const ImageFitAttribute(super.value);

  static ImageFitAttribute? maybe(BoxFit? value) =>
      value == null ? null : ImageFitAttribute(value);
}

class ImageRepeatAttribute extends ValueAttribute<ImageRepeat> {
  const ImageRepeatAttribute(super.value);

  static ImageRepeatAttribute? maybe(ImageRepeat? value) =>
      value == null ? null : ImageRepeatAttribute(value);
}

class ImageWidthAttribute extends ValueAttribute<double> {
  const ImageWidthAttribute(super.value);

  static ImageWidthAttribute? maybe(double? value) =>
      value == null ? null : ImageWidthAttribute(value);
}

class ImageHeightAttribute extends ValueAttribute<double> {
  const ImageHeightAttribute(super.value);

  static ImageHeightAttribute? maybe(double? value) =>
      value == null ? null : ImageHeightAttribute(value);
}

class TextAlignAttribute extends ValueAttribute<TextAlign> {
  const TextAlignAttribute(super.value);

  static TextAlignAttribute? maybe(TextAlign? value) =>
      value == null ? null : TextAlignAttribute(value);
}

class TextScaleFactorAttribute extends ValueAttribute<double> {
  const TextScaleFactorAttribute(super.value);

  static TextScaleFactorAttribute? maybe(double? value) =>
      value == null ? null : TextScaleFactorAttribute(value);
}

class TextDirectionAttribute extends ValueAttribute<TextDirection> {
  const TextDirectionAttribute(super.value);

  static TextDirectionAttribute? maybe(TextDirection? value) =>
      value == null ? null : TextDirectionAttribute(value);
}

class SoftWrapAttribute extends ValueAttribute<bool> {
  const SoftWrapAttribute(super.value);

  static SoftWrapAttribute? maybe(bool? value) =>
      value == null ? null : SoftWrapAttribute(value);
}

class TextOverflowAttribute extends ValueAttribute<TextOverflow> {
  const TextOverflowAttribute(super.value);

  static TextOverflowAttribute? maybe(TextOverflow? value) =>
      value == null ? null : TextOverflowAttribute(value);
}

class MaxLinesAttribute extends ValueAttribute<int> {
  const MaxLinesAttribute(super.value);

  static MaxLinesAttribute? maybe(int? value) =>
      value == null ? null : MaxLinesAttribute(value);
}

class TextWidthBasisAttribute extends ValueAttribute<TextWidthBasis> {
  const TextWidthBasisAttribute(super.value);

  static TextWidthBasisAttribute? maybe(TextWidthBasis? value) =>
      value == null ? null : TextWidthBasisAttribute(value);
}

class TextHeightBehaviorAttribute extends ValueAttribute<TextHeightBehavior> {
  const TextHeightBehaviorAttribute(super.value);

  static TextHeightBehaviorAttribute? maybe(TextHeightBehavior? value) =>
      value == null ? null : TextHeightBehaviorAttribute(value);
}

class BoxFitAttribute extends ValueAttribute<BoxFit> {
  const BoxFitAttribute(super.value);

  static BoxFitAttribute? maybe(BoxFit? value) =>
      value == null ? null : BoxFitAttribute(value);
}

class StackFitAttribute extends ValueAttribute<StackFit> {
  const StackFitAttribute(super.value);

  static StackFitAttribute? maybe(StackFit? value) =>
      value == null ? null : StackFitAttribute(value);
}

class FlexFitAttribute extends ValueAttribute<FlexFit> {
  const FlexFitAttribute(super.value);

  static FlexFitAttribute? maybe(FlexFit? value) =>
      value == null ? null : FlexFitAttribute(value);
}

class TransformAttribute extends ValueAttribute<Matrix4> {
  const TransformAttribute(super.value);

  static TransformAttribute? maybe(Matrix4? value) =>
      value == null ? null : TransformAttribute(value);
}

class BlendModeAttribute extends ValueAttribute<BlendMode> {
  const BlendModeAttribute(super.value);

  static BlendModeAttribute? maybe(BlendMode? value) =>
      value == null ? null : BlendModeAttribute(value);
}

class BoxShapeAttribute extends ValueAttribute<BoxShape> {
  const BoxShapeAttribute(super.value);

  static BoxShapeAttribute? maybe(BoxShape? value) =>
      value == null ? null : BoxShapeAttribute(value);
}

class VisibleAttribute extends ValueAttribute<bool> {
  const VisibleAttribute(super.value);

  static VisibleAttribute? maybe(bool? value) =>
      value == null ? null : VisibleAttribute(value);
}
