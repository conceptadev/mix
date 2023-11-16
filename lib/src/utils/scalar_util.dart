import 'package:flutter/material.dart';

import '../attributes/color_attribute.dart';
import '../attributes/scalar_attribute.dart';

const visible = VisibleAttribute.new;

const stackFit = StackFitUtility();

class StackFitUtility {
  const StackFitUtility();
  StackFitAttribute loose() => const StackFitAttribute(StackFit.loose);
  StackFitAttribute expand() => const StackFitAttribute(StackFit.expand);
  StackFitAttribute passthrough() =>
      const StackFitAttribute(StackFit.passthrough);
  StackFitAttribute call(StackFit stackFit) => StackFitAttribute(stackFit);
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

const textOverflow = TextOverflowUtility();

class TextOverflowUtility {
  const TextOverflowUtility();
  TextOverflowAttribute clip() =>
      const TextOverflowAttribute(TextOverflow.clip);
  TextOverflowAttribute ellipsis() =>
      const TextOverflowAttribute(TextOverflow.ellipsis);
  TextOverflowAttribute fade() =>
      const TextOverflowAttribute(TextOverflow.fade);
  TextOverflowAttribute call(TextOverflow textOverflow) =>
      TextOverflowAttribute(textOverflow);
}

const textScaleFactor = TextScaleFactorAttribute.new;

const maxLines = MaxLinesAttribute.new;

const textWidthBasis = TextWidthBasisUtility();

class TextWidthBasisUtility {
  const TextWidthBasisUtility();
  TextWidthBasisAttribute parent() =>
      const TextWidthBasisAttribute(TextWidthBasis.parent);
  TextWidthBasisAttribute longestLine() =>
      const TextWidthBasisAttribute(TextWidthBasis.longestLine);
  TextWidthBasisAttribute call(TextWidthBasis textWidthBasis) =>
      TextWidthBasisAttribute(textWidthBasis);
}

const textAlign = TextAlignUtility();

class TextAlignUtility {
  const TextAlignUtility();
  TextAlignAttribute left() => const TextAlignAttribute(TextAlign.left);
  TextAlignAttribute right() => const TextAlignAttribute(TextAlign.right);
  TextAlignAttribute center() => const TextAlignAttribute(TextAlign.center);
  TextAlignAttribute justify() => const TextAlignAttribute(TextAlign.justify);
  TextAlignAttribute start() => const TextAlignAttribute(TextAlign.start);
  TextAlignAttribute end() => const TextAlignAttribute(TextAlign.end);
  TextAlignAttribute call(TextAlign textAlign) => TextAlignAttribute(textAlign);
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

const mainAxisAlignment = MainAxisAlignmentUtility();

class MainAxisAlignmentUtility {
  const MainAxisAlignmentUtility();
  MainAxisAlignmentAttribute spaceBetween() =>
      const MainAxisAlignmentAttribute(MainAxisAlignment.spaceBetween);
  MainAxisAlignmentAttribute spaceAround() =>
      const MainAxisAlignmentAttribute(MainAxisAlignment.spaceAround);
  MainAxisAlignmentAttribute spaceEvenly() =>
      const MainAxisAlignmentAttribute(MainAxisAlignment.spaceEvenly);

  MainAxisAlignmentAttribute start() =>
      const MainAxisAlignmentAttribute(MainAxisAlignment.start);
  MainAxisAlignmentAttribute end() =>
      const MainAxisAlignmentAttribute(MainAxisAlignment.end);
  MainAxisAlignmentAttribute center() =>
      const MainAxisAlignmentAttribute(MainAxisAlignment.center);
  MainAxisAlignmentAttribute call(MainAxisAlignment mainAxisAlignment) =>
      MainAxisAlignmentAttribute(mainAxisAlignment);
}

const crossAxisAlignment = CrossAxisAlignmentUtility();

class CrossAxisAlignmentUtility {
  const CrossAxisAlignmentUtility();
  CrossAxisAlignmentAttribute start() =>
      const CrossAxisAlignmentAttribute(CrossAxisAlignment.start);
  CrossAxisAlignmentAttribute end() =>
      const CrossAxisAlignmentAttribute(CrossAxisAlignment.end);
  CrossAxisAlignmentAttribute center() =>
      const CrossAxisAlignmentAttribute(CrossAxisAlignment.center);
  CrossAxisAlignmentAttribute stretch() =>
      const CrossAxisAlignmentAttribute(CrossAxisAlignment.stretch);
  CrossAxisAlignmentAttribute baseline() =>
      const CrossAxisAlignmentAttribute(CrossAxisAlignment.baseline);
  CrossAxisAlignmentAttribute call(CrossAxisAlignment crossAxisAlignment) =>
      CrossAxisAlignmentAttribute(crossAxisAlignment);
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

const textBaseline = TextBaselineUtility();

class TextBaselineUtility {
  const TextBaselineUtility();
  TextBaselineAttribute alphabetic() =>
      const TextBaselineAttribute(TextBaseline.alphabetic);
  TextBaselineAttribute ideographic() =>
      const TextBaselineAttribute(TextBaseline.ideographic);
  TextBaselineAttribute call(TextBaseline textBaseline) =>
      TextBaselineAttribute(textBaseline);
}

const imageAlignment = ImageAlignmentAttribute.new;
const imageScale = ImageScaleAttribute.new;
const imageFit = ImageFitUtility();

class ImageFitUtility {
  const ImageFitUtility();
  ImageFitAttribute fill() => const ImageFitAttribute(BoxFit.fill);
  ImageFitAttribute contain() => const ImageFitAttribute(BoxFit.contain);
  ImageFitAttribute cover() => const ImageFitAttribute(BoxFit.cover);
  ImageFitAttribute fitWidth() => const ImageFitAttribute(BoxFit.fitWidth);
  ImageFitAttribute fitHeight() => const ImageFitAttribute(BoxFit.fitHeight);
  ImageFitAttribute none() => const ImageFitAttribute(BoxFit.none);
  ImageFitAttribute scaleDown() => const ImageFitAttribute(BoxFit.scaleDown);
  ImageFitAttribute call(BoxFit boxFit) => ImageFitAttribute(boxFit);
}

const imageRepeat = ImageRepeatUtility();

class ImageRepeatUtility {
  const ImageRepeatUtility();
  ImageRepeatAttribute noRepeat() =>
      const ImageRepeatAttribute(ImageRepeat.noRepeat);
  ImageRepeatAttribute repeat() =>
      const ImageRepeatAttribute(ImageRepeat.repeat);
  ImageRepeatAttribute repeatX() =>
      const ImageRepeatAttribute(ImageRepeat.repeatX);
  ImageRepeatAttribute repeatY() =>
      const ImageRepeatAttribute(ImageRepeat.repeatY);
  ImageRepeatAttribute call(ImageRepeat imageRepeat) =>
      ImageRepeatAttribute(imageRepeat);
}

const imageWidth = ImageWidthAttribute.new;
const imageHeight = ImageHeightAttribute.new;
const textHeightBehavior = TextHeightBehaviorAttribute.new;

const boxFit = BoxFitUtility();

class BoxFitUtility {
  const BoxFitUtility();
  BoxFitAttribute fill() => const BoxFitAttribute(BoxFit.fill);
  BoxFitAttribute contain() => const BoxFitAttribute(BoxFit.contain);
  BoxFitAttribute cover() => const BoxFitAttribute(BoxFit.cover);
  BoxFitAttribute fitWidth() => const BoxFitAttribute(BoxFit.fitWidth);
  BoxFitAttribute fitHeight() => const BoxFitAttribute(BoxFit.fitHeight);
  BoxFitAttribute none() => const BoxFitAttribute(BoxFit.none);
  BoxFitAttribute scaleDown() => const BoxFitAttribute(BoxFit.scaleDown);
  BoxFitAttribute call(BoxFit boxFit) => BoxFitAttribute(boxFit);
}

const blendMode = BlendModeUtility();

class BlendModeUtility {
  const BlendModeUtility();
  BlendModeAttribute call(BlendMode blendMode) => BlendModeAttribute(blendMode);
}

const boxShape = BoxShapeUtility();

class BoxShapeUtility {
  const BoxShapeUtility();
  BoxShapeAttribute circle() => const BoxShapeAttribute(BoxShape.circle);
  BoxShapeAttribute rectangle() => const BoxShapeAttribute(BoxShape.rectangle);
  BoxShapeAttribute call(BoxShape boxShape) => BoxShapeAttribute(boxShape);
}

const imageColor = ImageColorAttribute.new;
