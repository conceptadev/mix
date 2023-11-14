import 'package:flutter/material.dart';

import '../../mix.dart';

const visible = VisibleAttribute.new;

const stackFit = StackFitUtility();

class StackFitUtility {
  final loose = const StackFitAttribute(StackFit.loose);
  final expand = const StackFitAttribute(StackFit.expand);
  final passthrough = const StackFitAttribute(StackFit.passthrough);
  const StackFitUtility();
  StackFitAttribute call(StackFit stackFit) => StackFitAttribute(stackFit);
}

const clip = ClipUtility();

class ClipUtility {
  final none = const ClipAttribute(Clip.none);
  final hardEdge = const ClipAttribute(Clip.hardEdge);
  final antiAlias = const ClipAttribute(Clip.antiAlias);
  final antiAliasWithSaveLayer =
      const ClipAttribute(Clip.antiAliasWithSaveLayer);
  const ClipUtility();
  ClipAttribute call(Clip clip) => ClipAttribute(clip);
}

const transform = TransformAttribute.new;

const verticalDirection = VerticalDirectionUtility();

class VerticalDirectionUtility {
  final up = const VerticalDirectionAttribute(VerticalDirection.up);
  final down = const VerticalDirectionAttribute(VerticalDirection.down);
  const VerticalDirectionUtility();
  VerticalDirectionAttribute call(VerticalDirection verticalDirection) =>
      VerticalDirectionAttribute(verticalDirection);
}

const textDirection = TextDirectionUtility();

class TextDirectionUtility {
  final rtl = const TextDirectionAttribute(TextDirection.rtl);
  final ltr = const TextDirectionAttribute(TextDirection.ltr);
  const TextDirectionUtility();
  TextDirectionAttribute call(TextDirection textDirection) =>
      TextDirectionAttribute(textDirection);
}

const softWrap = SoftWrapUtility();

class SoftWrapUtility {
  final on = const SoftWrapAttribute(true);
  final off = const SoftWrapAttribute(false);
  const SoftWrapUtility();
  SoftWrapAttribute call(bool value) => SoftWrapAttribute(value);
}

const textOverflow = TextOverflowUtility();

class TextOverflowUtility {
  final clip = const TextOverflowAttribute(TextOverflow.clip);
  final ellipsis = const TextOverflowAttribute(TextOverflow.ellipsis);
  final fade = const TextOverflowAttribute(TextOverflow.fade);
  const TextOverflowUtility();
  TextOverflowAttribute call(TextOverflow textOverflow) =>
      TextOverflowAttribute(textOverflow);
}

const textScaleFactor = TextScaleFactorAttribute.new;

const maxLines = MaxLinesAttribute.new;

const textWidthBasis = TextWidthBasisUtility();

class TextWidthBasisUtility {
  final parent = const TextWidthBasisAttribute(TextWidthBasis.parent);
  final longestLine = const TextWidthBasisAttribute(TextWidthBasis.longestLine);
  const TextWidthBasisUtility();
  TextWidthBasisAttribute call(TextWidthBasis textWidthBasis) =>
      TextWidthBasisAttribute(textWidthBasis);
}

const textAlign = TextAlignUtility();

class TextAlignUtility {
  final left = const TextAlignAttribute(TextAlign.left);
  final right = const TextAlignAttribute(TextAlign.right);
  final center = const TextAlignAttribute(TextAlign.center);
  final justify = const TextAlignAttribute(TextAlign.justify);
  final start = const TextAlignAttribute(TextAlign.start);
  final end = const TextAlignAttribute(TextAlign.end);
  const TextAlignUtility();
  TextAlignAttribute call(TextAlign textAlign) => TextAlignAttribute(textAlign);
}

const flexFit = FlexFitUtility();

class FlexFitUtility {
  final tight = const FlexFitAttribute(FlexFit.tight);
  final loose = const FlexFitAttribute(FlexFit.loose);
  const FlexFitUtility();
  FlexFitAttribute call(FlexFit flexFit) => FlexFitAttribute(flexFit);
}

const axisDirection = AxisUtility();

class AxisUtility {
  final horizontal = const AxisAttribute(Axis.horizontal);
  final vertical = const AxisAttribute(Axis.vertical);
  const AxisUtility();
  AxisAttribute call(Axis axis) => AxisAttribute(axis);
}

const mainAxisAlignment = MainAxisAlignmentUtility();

class MainAxisAlignmentUtility {
  final start = const MainAxisAlignmentAttribute(MainAxisAlignment.start);
  final end = const MainAxisAlignmentAttribute(MainAxisAlignment.end);
  final center = const MainAxisAlignmentAttribute(MainAxisAlignment.center);
  final spaceBetween =
      const MainAxisAlignmentAttribute(MainAxisAlignment.spaceBetween);
  final spaceAround =
      const MainAxisAlignmentAttribute(MainAxisAlignment.spaceAround);
  final spaceEvenly =
      const MainAxisAlignmentAttribute(MainAxisAlignment.spaceEvenly);

  const MainAxisAlignmentUtility();
  MainAxisAlignmentAttribute call(MainAxisAlignment mainAxisAlignment) =>
      MainAxisAlignmentAttribute(mainAxisAlignment);
}

const crossAxisAlignment = CrossAxisAlignmentUtility();

class CrossAxisAlignmentUtility {
  final start = const CrossAxisAlignmentAttribute(CrossAxisAlignment.start);
  final end = const CrossAxisAlignmentAttribute(CrossAxisAlignment.end);
  final center = const CrossAxisAlignmentAttribute(CrossAxisAlignment.center);
  final stretch = const CrossAxisAlignmentAttribute(CrossAxisAlignment.stretch);
  final baseline =
      const CrossAxisAlignmentAttribute(CrossAxisAlignment.baseline);
  const CrossAxisAlignmentUtility();
  CrossAxisAlignmentAttribute call(CrossAxisAlignment crossAxisAlignment) =>
      CrossAxisAlignmentAttribute(crossAxisAlignment);
}

const mainAxisSize = MainAxisSizeUtility();

class MainAxisSizeUtility {
  final min = const MainAxisSizeAttribute(MainAxisSize.min);
  final max = const MainAxisSizeAttribute(MainAxisSize.max);
  const MainAxisSizeUtility();
  MainAxisSizeAttribute call(MainAxisSize mainAxisSize) =>
      MainAxisSizeAttribute(mainAxisSize);
}

const iconSize = IconSizeAttribute.new;
const iconColor = IconColorAttribute.new;

const gradient = GradientAttribute.new;
const transformAlignment = TransformAlignmentAttribute.new;

const textBaseline = TextBaselineUtility();

class TextBaselineUtility {
  final alphabetic = const TextBaselineAttribute(TextBaseline.alphabetic);
  final ideographic = const TextBaselineAttribute(TextBaseline.ideographic);
  const TextBaselineUtility();
  TextBaselineAttribute call(TextBaseline textBaseline) =>
      TextBaselineAttribute(textBaseline);
}

const imageAlignment = ImageAlignmentAttribute.new;
const imageScale = ImageScaleAttribute.new;
const imageFit = ImageFitUtility();

class ImageFitUtility {
  final fill = const ImageFitAttribute(BoxFit.fill);
  final contain = const ImageFitAttribute(BoxFit.contain);
  final cover = const ImageFitAttribute(BoxFit.cover);
  final fitWidth = const ImageFitAttribute(BoxFit.fitWidth);
  final fitHeight = const ImageFitAttribute(BoxFit.fitHeight);
  final none = const ImageFitAttribute(BoxFit.none);
  final scaleDown = const ImageFitAttribute(BoxFit.scaleDown);
  const ImageFitUtility();
  ImageFitAttribute call(BoxFit boxFit) => ImageFitAttribute(boxFit);
}

const imageRepeat = ImageRepeatUtility();

class ImageRepeatUtility {
  final noRepeat = const ImageRepeatAttribute(ImageRepeat.noRepeat);
  final repeat = const ImageRepeatAttribute(ImageRepeat.repeat);
  final repeatX = const ImageRepeatAttribute(ImageRepeat.repeatX);
  final repeatY = const ImageRepeatAttribute(ImageRepeat.repeatY);
  const ImageRepeatUtility();
  ImageRepeatAttribute call(ImageRepeat imageRepeat) =>
      ImageRepeatAttribute(imageRepeat);
}

const imageWidth = ImageWidthAttribute.new;
const imageHeight = ImageHeightAttribute.new;
const textHeightBehavior = TextHeightBehaviorAttribute.new;

const boxFit = BoxFitUtility();

class BoxFitUtility {
  final fill = const BoxFitAttribute(BoxFit.fill);
  final contain = const BoxFitAttribute(BoxFit.contain);
  final cover = const BoxFitAttribute(BoxFit.cover);
  final fitWidth = const BoxFitAttribute(BoxFit.fitWidth);
  final fitHeight = const BoxFitAttribute(BoxFit.fitHeight);
  final none = const BoxFitAttribute(BoxFit.none);
  final scaleDown = const BoxFitAttribute(BoxFit.scaleDown);
  const BoxFitUtility();
  BoxFitAttribute call(BoxFit boxFit) => BoxFitAttribute(boxFit);
}

const blendMode = BlendModeUtility();

class BlendModeUtility {
  const BlendModeUtility();
  BlendModeAttribute call(BlendMode blendMode) => BlendModeAttribute(blendMode);
}

const boxShape = BoxShapeUtility();

class BoxShapeUtility {
  final circle = const BoxShapeAttribute(BoxShape.circle);
  final rectangle = const BoxShapeAttribute(BoxShape.rectangle);
  const BoxShapeUtility();
  BoxShapeAttribute call(BoxShape boxShape) => BoxShapeAttribute(boxShape);
}

const imageColor = ImageColorAttribute.new;

const gap = WithSpaceToken(GapAttribute.new);
