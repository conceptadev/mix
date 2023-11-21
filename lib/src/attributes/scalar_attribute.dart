import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'attribute.dart';

class AxisAttribute extends ScalarAttribute<Axis> {
  const AxisAttribute(super.value);

  static AxisAttribute? maybe(Axis? value) =>
      value == null ? null : AxisAttribute(value);
  @override
  AxisAttribute merge(AxisAttribute? other) => other ?? this;
}

class GradientAttribute extends ScalarAttribute<Gradient> {
  const GradientAttribute(super.value);

  static GradientAttribute? maybe(Gradient? value) =>
      value == null ? null : GradientAttribute(value);
  @override
  GradientAttribute merge(GradientAttribute? other) => other ?? this;
}

class GapAttribute extends ScalarAttribute<double> {
  const GapAttribute(super.value);

  static GapAttribute? maybe(double? value) =>
      value == null ? null : GapAttribute(value);
  @override
  GapAttribute merge(GapAttribute? other) => other ?? this;
}

class MainAxisAlignmentAttribute extends ScalarAttribute<MainAxisAlignment> {
  const MainAxisAlignmentAttribute(super.value);

  static MainAxisAlignmentAttribute? maybe(MainAxisAlignment? value) =>
      value == null ? null : MainAxisAlignmentAttribute(value);

  @override
  MainAxisAlignmentAttribute merge(MainAxisAlignmentAttribute? other) =>
      other ?? this;
}

class TransformAlignmentAttribute extends ScalarAttribute<Alignment> {
  const TransformAlignmentAttribute(super.value);

  static TransformAlignmentAttribute? maybe(Alignment? value) =>
      value == null ? null : TransformAlignmentAttribute(value);
  @override
  TransformAlignmentAttribute merge(TransformAlignmentAttribute? other) =>
      other ?? this;
}

class MainAxisSizeAttribute extends ScalarAttribute<MainAxisSize> {
  const MainAxisSizeAttribute(super.value);

  static MainAxisSizeAttribute? maybe(MainAxisSize? value) =>
      value == null ? null : MainAxisSizeAttribute(value);
  @override
  MainAxisSizeAttribute merge(MainAxisSizeAttribute? other) => other ?? this;
}

class CrossAxisAlignmentAttribute extends ScalarAttribute<CrossAxisAlignment> {
  const CrossAxisAlignmentAttribute(super.value);

  static CrossAxisAlignmentAttribute? maybe(CrossAxisAlignment? value) =>
      value == null ? null : CrossAxisAlignmentAttribute(value);
  @override
  CrossAxisAlignmentAttribute merge(CrossAxisAlignmentAttribute? other) =>
      other ?? this;
}

class VerticalDirectionAttribute extends ScalarAttribute<VerticalDirection> {
  const VerticalDirectionAttribute(super.value);

  static VerticalDirectionAttribute? maybe(VerticalDirection? value) =>
      value == null ? null : VerticalDirectionAttribute(value);
  @override
  VerticalDirectionAttribute merge(VerticalDirectionAttribute? other) =>
      other ?? this;
}

class TextBaselineAttribute extends ScalarAttribute<TextBaseline> {
  const TextBaselineAttribute(super.value);

  static TextBaselineAttribute? maybe(TextBaseline? value) =>
      value == null ? null : TextBaselineAttribute(value);
  @override
  TextBaselineAttribute merge(TextBaselineAttribute? other) => other ?? this;
}

class ClipAttribute extends ScalarAttribute<Clip> {
  const ClipAttribute(super.value);

  static ClipAttribute? maybe(Clip? value) =>
      value == null ? null : ClipAttribute(value);
  @override
  ClipAttribute merge(ClipAttribute? other) => other ?? this;
}

class TextDecorationAttribute extends ScalarAttribute<TextDecoration> {
  const TextDecorationAttribute(super.value);

  static TextDecorationAttribute? maybe(TextDecoration? value) =>
      value == null ? null : TextDecorationAttribute(value);
  @override
  TextDecorationAttribute merge(TextDecorationAttribute? other) =>
      other ?? this;
}

class TextDecorationStyleAttribute
    extends ScalarAttribute<TextDecorationStyle> {
  const TextDecorationStyleAttribute(super.value);

  static TextDecorationStyleAttribute? maybe(TextDecorationStyle? value) =>
      value == null ? null : TextDecorationStyleAttribute(value);
  @override
  TextDecorationStyleAttribute merge(TextDecorationStyleAttribute? other) =>
      other ?? this;
}

class FontStyleAttribute extends ScalarAttribute<FontStyle> {
  const FontStyleAttribute(super.value);

  static FontStyleAttribute? maybe(FontStyle? value) =>
      value == null ? null : FontStyleAttribute(value);
  @override
  FontStyleAttribute merge(FontStyleAttribute? other) => other ?? this;
}

class FontFeatureAttribute extends ScalarAttribute<FontFeature> {
  const FontFeatureAttribute(super.value);

  static FontFeatureAttribute? maybe(FontFeature? value) =>
      value == null ? null : FontFeatureAttribute(value);
  @override
  FontFeatureAttribute merge(FontFeatureAttribute? other) => other ?? this;
}

class FontFamilyAttribute extends ScalarAttribute<String> {
  const FontFamilyAttribute(super.value);

  static FontFamilyAttribute? maybe(String? value) =>
      value == null ? null : FontFamilyAttribute(value);
  @override
  FontFamilyAttribute merge(FontFamilyAttribute? other) => other ?? this;
}

class FontSizeAttribute extends ScalarAttribute<double> {
  const FontSizeAttribute(super.value);

  static FontSizeAttribute? maybe(double? value) =>
      value == null ? null : FontSizeAttribute(value);
  @override
  FontSizeAttribute merge(FontSizeAttribute? other) => other ?? this;
}

class ImageAlignmentAttribute extends ScalarAttribute<Alignment> {
  const ImageAlignmentAttribute(super.value);

  static ImageAlignmentAttribute? maybe(Alignment? value) =>
      value == null ? null : ImageAlignmentAttribute(value);
  @override
  ImageAlignmentAttribute merge(ImageAlignmentAttribute? other) =>
      other ?? this;
}

class PaintAttribute extends ScalarAttribute<Paint> {
  const PaintAttribute(super.value);

  static PaintAttribute? maybe(Paint? value) =>
      value == null ? null : PaintAttribute(value);
  @override
  PaintAttribute merge(PaintAttribute? other) => other ?? this;
}

class ImageFitAttribute extends ScalarAttribute<BoxFit> {
  const ImageFitAttribute(super.value);

  static ImageFitAttribute? maybe(BoxFit? value) =>
      value == null ? null : ImageFitAttribute(value);
  @override
  ImageFitAttribute merge(ImageFitAttribute? other) => other ?? this;
}

class ImageRepeatAttribute extends ScalarAttribute<ImageRepeat> {
  const ImageRepeatAttribute(super.value);

  static ImageRepeatAttribute? maybe(ImageRepeat? value) =>
      value == null ? null : ImageRepeatAttribute(value);
  @override
  ImageRepeatAttribute merge(ImageRepeatAttribute? other) => other ?? this;
}

class ImageWidthAttribute extends ScalarAttribute<double> {
  const ImageWidthAttribute(super.value);

  static ImageWidthAttribute? maybe(double? value) =>
      value == null ? null : ImageWidthAttribute(value);
  @override
  ImageWidthAttribute merge(ImageWidthAttribute? other) => other ?? this;
}

class ImageHeightAttribute extends ScalarAttribute<double> {
  const ImageHeightAttribute(super.value);

  static ImageHeightAttribute? maybe(double? value) =>
      value == null ? null : ImageHeightAttribute(value);
  @override
  ImageHeightAttribute merge(ImageHeightAttribute? other) => other ?? this;
}

class TextAlignAttribute extends ScalarAttribute<TextAlign> {
  const TextAlignAttribute(super.value);

  static TextAlignAttribute? maybe(TextAlign? value) =>
      value == null ? null : TextAlignAttribute(value);
  @override
  TextAlignAttribute merge(TextAlignAttribute? other) => other ?? this;
}

class TextScaleFactorAttribute extends ScalarAttribute<double> {
  const TextScaleFactorAttribute(super.value);

  static TextScaleFactorAttribute? maybe(double? value) =>
      value == null ? null : TextScaleFactorAttribute(value);
  @override
  TextScaleFactorAttribute merge(TextScaleFactorAttribute? other) =>
      other ?? this;
}

class TextDirectionAttribute extends ScalarAttribute<TextDirection> {
  const TextDirectionAttribute(super.value);

  static TextDirectionAttribute? maybe(TextDirection? value) =>
      value == null ? null : TextDirectionAttribute(value);
  @override
  TextDirectionAttribute merge(TextDirectionAttribute? other) => other ?? this;
}

class SoftWrapAttribute extends ScalarAttribute<bool> {
  const SoftWrapAttribute(super.value);

  static SoftWrapAttribute? maybe(bool? value) =>
      value == null ? null : SoftWrapAttribute(value);
  @override
  SoftWrapAttribute merge(SoftWrapAttribute? other) => other ?? this;
}

class TextOverflowAttribute extends ScalarAttribute<TextOverflow> {
  const TextOverflowAttribute(super.value);

  static TextOverflowAttribute? maybe(TextOverflow? value) =>
      value == null ? null : TextOverflowAttribute(value);
  @override
  TextOverflowAttribute merge(TextOverflowAttribute? other) => other ?? this;
}

class MaxLinesAttribute extends ScalarAttribute<int> {
  const MaxLinesAttribute(super.value);

  static MaxLinesAttribute? maybe(int? value) =>
      value == null ? null : MaxLinesAttribute(value);
  @override
  MaxLinesAttribute merge(MaxLinesAttribute? other) => other ?? this;
}

class TextWidthBasisAttribute extends ScalarAttribute<TextWidthBasis> {
  const TextWidthBasisAttribute(super.value);

  static TextWidthBasisAttribute? maybe(TextWidthBasis? value) =>
      value == null ? null : TextWidthBasisAttribute(value);

  @override
  TextWidthBasisAttribute merge(TextWidthBasisAttribute? other) =>
      other ?? this;
}

class TextHeightBehaviorAttribute extends ScalarAttribute<TextHeightBehavior> {
  const TextHeightBehaviorAttribute(super.value);

  static TextHeightBehaviorAttribute? maybe(TextHeightBehavior? value) =>
      value == null ? null : TextHeightBehaviorAttribute(value);

  @override
  TextHeightBehaviorAttribute merge(TextHeightBehaviorAttribute? other) =>
      other ?? this;
}

class BoxFitAttribute extends ScalarAttribute<BoxFit> {
  const BoxFitAttribute(super.value);

  static BoxFitAttribute? maybe(BoxFit? value) =>
      value == null ? null : BoxFitAttribute(value);

  @override
  BoxFitAttribute merge(BoxFitAttribute? other) => other ?? this;
}

class StackFitAttribute extends ScalarAttribute<StackFit> {
  const StackFitAttribute(super.value);

  static StackFitAttribute? maybe(StackFit? value) =>
      value == null ? null : StackFitAttribute(value);

  @override
  StackFitAttribute merge(StackFitAttribute? other) => other ?? this;
}

class FlexFitAttribute extends ScalarAttribute<FlexFit> {
  const FlexFitAttribute(super.value);

  static FlexFitAttribute? maybe(FlexFit? value) =>
      value == null ? null : FlexFitAttribute(value);

  @override
  FlexFitAttribute merge(FlexFitAttribute? other) => other ?? this;
}

class TransformAttribute extends ScalarAttribute<Matrix4> {
  const TransformAttribute(super.value);

  static TransformAttribute? maybe(Matrix4? value) =>
      value == null ? null : TransformAttribute(value);

  @override
  TransformAttribute merge(TransformAttribute? other) => other ?? this;
}

class BlendModeAttribute extends ScalarAttribute<BlendMode> {
  const BlendModeAttribute(super.value);

  static BlendModeAttribute? maybe(BlendMode? value) =>
      value == null ? null : BlendModeAttribute(value);

  @override
  BlendModeAttribute merge(BlendModeAttribute? other) => other ?? this;
}

class BoxShapeAttribute extends ScalarAttribute<BoxShape> {
  const BoxShapeAttribute(super.value);

  static BoxShapeAttribute? maybe(BoxShape? value) =>
      value == null ? null : BoxShapeAttribute(value);

  @override
  BoxShapeAttribute merge(BoxShapeAttribute? other) => other ?? this;
}

class VisibleAttribute extends ScalarAttribute<bool> {
  const VisibleAttribute(super.value);

  static VisibleAttribute? maybe(bool? value) =>
      value == null ? null : VisibleAttribute(value);

  @override
  VisibleAttribute merge(VisibleAttribute? other) => other ?? this;
}
