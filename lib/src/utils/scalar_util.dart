import 'dart:ui';

import 'package:flutter/material.dart';

import '../attributes/color_attribute.dart';
import '../attributes/scalar_attribute.dart';

const visible = VisibleAttribute.new;

const stackFit = StackFitUtility(StackFitAttribute.new);

class StackFitUtility<T> extends ScalarUtility<StackFit, T> {
  const StackFitUtility(super.builder);
  T loose() => builder(StackFit.loose);
  T expand() => builder(StackFit.expand);
  T passthrough() => builder(StackFit.passthrough);
}

const clip = ClipUtility();

class ClipUtility {
  const ClipUtility();
  ClipAttribute antiAliasWithSaveLayer() =>
      const ClipAttribute(Clip.antiAliasWithSaveLayer);
  ClipAttribute none() => const ClipAttribute(Clip.none);
  ClipAttribute hardEdge() => const ClipAttribute(Clip.hardEdge);
  ClipAttribute antiAlias() => const ClipAttribute(Clip.antiAlias);
  ClipAttribute call(Clip clip) => ClipAttribute(clip);
}

const transform = TransformAttribute.new;

const verticalDirection = VerticalDirectionUtility();

class VerticalDirectionUtility {
  const VerticalDirectionUtility();
  VerticalDirectionAttribute up() =>
      const VerticalDirectionAttribute(VerticalDirection.up);
  VerticalDirectionAttribute down() =>
      const VerticalDirectionAttribute(VerticalDirection.down);
  VerticalDirectionAttribute call(VerticalDirection verticalDirection) =>
      VerticalDirectionAttribute(verticalDirection);
}

const textDirection = TextDirectionUtility();

class TextDirectionUtility {
  const TextDirectionUtility();
  TextDirectionAttribute rtl() =>
      const TextDirectionAttribute(TextDirection.rtl);
  TextDirectionAttribute ltr() =>
      const TextDirectionAttribute(TextDirection.ltr);
  TextDirectionAttribute call(TextDirection textDirection) =>
      TextDirectionAttribute(textDirection);
}

const softWrap = SoftWrapUtility();

class SoftWrapUtility {
  const SoftWrapUtility();
  SoftWrapAttribute on() => const SoftWrapAttribute(true);
  SoftWrapAttribute off() => const SoftWrapAttribute(false);
  SoftWrapAttribute call(bool value) => SoftWrapAttribute(value);
}

const flexFit = FlexFitUtility();

class FlexFitUtility {
  const FlexFitUtility();
  FlexFitAttribute tight() => const FlexFitAttribute(FlexFit.tight);
  FlexFitAttribute loose() => const FlexFitAttribute(FlexFit.loose);
  FlexFitAttribute call(FlexFit flexFit) => FlexFitAttribute(flexFit);
}

const axisDirection = AxisUtility();

class AxisUtility {
  const AxisUtility();
  AxisAttribute horizontal() => const AxisAttribute(Axis.horizontal);
  AxisAttribute vertical() => const AxisAttribute(Axis.vertical);
  AxisAttribute call(Axis axis) => AxisAttribute(axis);
}

const mainAxisAlignment =
    MainAxisAlignmentUtility(MainAxisAlignmentAttribute.new);

class MainAxisAlignmentUtility<T> extends ScalarUtility<MainAxisAlignment, T> {
  const MainAxisAlignmentUtility(super.builder);
  T spaceBetween() => builder(MainAxisAlignment.spaceBetween);
  T spaceAround() => builder(MainAxisAlignment.spaceAround);
  T spaceEvenly() => builder(MainAxisAlignment.spaceEvenly);

  T start() => builder(MainAxisAlignment.start);
  T end() => builder(MainAxisAlignment.end);
  T center() => builder(MainAxisAlignment.center);
}

const crossAxisAlignment =
    CrossAxisAlignmentUtility(CrossAxisAlignmentAttribute.new);

class CrossAxisAlignmentUtility<T>
    extends ScalarUtility<CrossAxisAlignment, T> {
  const CrossAxisAlignmentUtility(super.builder);
  T start() => builder(CrossAxisAlignment.start);
  T end() => builder(CrossAxisAlignment.end);
  T center() => builder(CrossAxisAlignment.center);
  T stretch() => builder(CrossAxisAlignment.stretch);
  T baseline() => builder(CrossAxisAlignment.baseline);
}

const mainAxisSize = MainAxisSizeUtility();

class MainAxisSizeUtility {
  const MainAxisSizeUtility();
  MainAxisSizeAttribute min() => const MainAxisSizeAttribute(MainAxisSize.min);
  MainAxisSizeAttribute max() => const MainAxisSizeAttribute(MainAxisSize.max);
  MainAxisSizeAttribute call(MainAxisSize mainAxisSize) =>
      MainAxisSizeAttribute(mainAxisSize);
}

const iconSize = IconSizeAttribute.new;
const iconColor = IconColorAttribute.new;

const gradient = GradientAttribute.new;
const transformAlignment = TransformAlignmentAttribute.new;

abstract class ScalarUtility<V, A> {
  final A Function(V value) builder;
  const ScalarUtility(this.builder);

  A call(V value) => builder(value);
  A? nullable(V? value) => value == null ? null : builder(value);
}

abstract class DoubleUtility<T> extends ScalarUtility<double, T> {
  const DoubleUtility(super.builder);
}

const imageAlignment = ImageAlignmentAttribute.new;
const imageScale = ImageScaleAttribute.new;
const imageFit = BoxFitUtility(ImageFitAttribute.new);

const imageRepeat = ImageRepeatUtility(ImageRepeatAttribute.new);

class ImageRepeatUtility<T> extends ScalarUtility<ImageRepeat, T> {
  const ImageRepeatUtility(super.builder);
  T noRepeat() => builder(ImageRepeat.noRepeat);
  T repeat() => builder(ImageRepeat.repeat);
  T repeatX() => builder(ImageRepeat.repeatX);
  T repeatY() => builder(ImageRepeat.repeatY);
}

const imageWidth = ImageWidthAttribute.new;
const imageHeight = ImageHeightAttribute.new;
const textHeightBehavior = TextHeightBehaviorAttribute.new;

const boxFit = BoxFitUtility(BoxFitAttribute.new);

class BoxFitUtility<T> extends ScalarUtility<BoxFit, T> {
  const BoxFitUtility(super.builder);
  BoxFitAttribute fill() => const BoxFitAttribute(BoxFit.fill);
  BoxFitAttribute contain() => const BoxFitAttribute(BoxFit.contain);
  BoxFitAttribute cover() => const BoxFitAttribute(BoxFit.cover);
  BoxFitAttribute fitWidth() => const BoxFitAttribute(BoxFit.fitWidth);
  BoxFitAttribute fitHeight() => const BoxFitAttribute(BoxFit.fitHeight);
  BoxFitAttribute none() => const BoxFitAttribute(BoxFit.none);
  BoxFitAttribute scaleDown() => const BoxFitAttribute(BoxFit.scaleDown);
}

const blendMode = BlendModeUtility(BlendModeAttribute.new);

class BlendModeUtility<T> extends ScalarUtility<BlendMode, T> {
  const BlendModeUtility(super.builder);
}

const boxShape = BoxShapeUtility(BoxShapeAttribute.new);

class BoxShapeUtility<T> extends ScalarUtility<BoxShape, T> {
  const BoxShapeUtility(super.builder);
  T circle() => builder(BoxShape.circle);
  T rectangle() => builder(BoxShape.rectangle);
}

const imageColor = ImageColorAttribute.new;

const fontWeight = FontWeightUtility(FontWeightAttribute.new);

class FontWeightUtility<T> extends ScalarUtility<FontWeight, T> {
  const FontWeightUtility(super.builder);
  T bold() => builder(FontWeight.bold);
  T normal() => builder(FontWeight.normal);
}

const textDecoration = TextDecorationUtility(TextDecorationAttribute.new);

class TextDecorationUtility<T> extends ScalarUtility<TextDecoration, T> {
  const TextDecorationUtility(super.builder);

  T underline() => builder(TextDecoration.underline);
  T overline() => builder(TextDecoration.overline);
  T lineThrough() => builder(TextDecoration.lineThrough);
  T none() => builder(TextDecoration.none);
}

const fontStyle = FontStyleUtility(FontStyleAttribute.new);

class FontStyleUtility<T> extends ScalarUtility<FontStyle, T> {
  const FontStyleUtility(super.builder);

  T italic() => builder(FontStyle.italic);
  T normal() => builder(FontStyle.normal);
}

const textDecorationStyle =
    TextDecorationStyleUtility(TextDecorationStyleAttribute.new);

class TextDecorationStyleUtility<T>
    extends ScalarUtility<TextDecorationStyle, T> {
  const TextDecorationStyleUtility(super.builder);

  T solid() => builder(TextDecorationStyle.solid);
  T double() => builder(TextDecorationStyle.double);
  T dotted() => builder(TextDecorationStyle.dotted);
  T dashed() => builder(TextDecorationStyle.dashed);
  T wavy() => builder(TextDecorationStyle.wavy);
}

const fontFeature = FontFeatureUtility(FontFeatureAttribute.new);

class FontFeatureUtility<T> extends ScalarUtility<FontFeature, T> {
  const FontFeatureUtility(super.builder);

  T enable(String feature) => builder(FontFeature.enable(feature));
  T disable(String feature) => builder(FontFeature.disable(feature));
}

const textBaseline = TextBaselineUtility(TextBaselineAttribute.new);

class TextBaselineUtility<A> extends ScalarUtility<TextBaseline, A> {
  const TextBaselineUtility(super.builder);

  A alphabetic() => builder(TextBaseline.alphabetic);
  A ideographic() => builder(TextBaseline.ideographic);
}

const fontFamily = FontFamilyUtility(FontFamilyAttribute.new);

class FontFamilyUtility<T> extends ScalarUtility<String, T> {
  const FontFamilyUtility(super.builder);
}

const textOverflow = TextOverflowUtility(TextOverflowAttribute.new);

class TextOverflowUtility<T> extends ScalarUtility<TextOverflow, T> {
  const TextOverflowUtility(super.builder);
  T clip() => builder(TextOverflow.clip);
  T ellipsis() => builder(TextOverflow.ellipsis);
  T fade() => builder(TextOverflow.fade);
}

const textWidthBasis = TextWidthBasisUtility(TextWidthBasisAttribute.new);

class TextWidthBasisUtility<T> extends ScalarUtility<TextWidthBasis, T> {
  const TextWidthBasisUtility(super.builder);
  T parent() => builder(TextWidthBasis.parent);
  T longestLine() => builder(TextWidthBasis.longestLine);
}

const textAlign = TextAlignUtility(TextAlignAttribute.new);

class TextAlignUtility<T> extends ScalarUtility<TextAlign, T> {
  const TextAlignUtility(super.builder);
  T left() => builder(TextAlign.left);
  T right() => builder(TextAlign.right);
  T center() => builder(TextAlign.center);
  T justify() => builder(TextAlign.justify);
  T start() => builder(TextAlign.start);
  T end() => builder(TextAlign.end);
}
