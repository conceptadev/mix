import 'package:flutter/material.dart';

import '../../mix.dart';

class StackFitUtility<T> extends ScalarUtility<T, StackFit> {
  const StackFitUtility(super.builder);
  T loose() => builder(StackFit.loose);
  T expand() => builder(StackFit.expand);
  T passthrough() => builder(StackFit.passthrough);
}

class AlignmentUtility<T> extends ScalarUtility<T, AlignmentGeometry> {
  const AlignmentUtility(super.builder);

  T topLeft() => builder(Alignment.topLeft);
  T topCenter() => builder(Alignment.topCenter);
  T topRight() => builder(Alignment.topRight);
  T centerLeft() => builder(Alignment.centerLeft);
  T center() => builder(Alignment.center);
  T centerRight() => builder(Alignment.centerRight);
  T bottomLeft() => builder(Alignment.bottomLeft);
  T bottomCenter() => builder(Alignment.bottomCenter);
  T bottomRight() => builder(Alignment.bottomRight);
  T only(double? x, double? y, double? start) {
    return start == null
        ? builder(Alignment(x ?? 0, y ?? 0))
        : builder(AlignmentDirectional(start, y ?? 0));
  }
}

class ClipUtility<T> extends ScalarUtility<T, Clip> {
  const ClipUtility(super.builder);
  T antiAliasWithSaveLayer() => builder(Clip.antiAliasWithSaveLayer);
  T none() => builder(Clip.none);
  T hardEdge() => builder(Clip.hardEdge);
  T antiAlias() => builder(Clip.antiAlias);
}

class VerticalDirectionUtility<T> extends ScalarUtility<T, VerticalDirection> {
  const VerticalDirectionUtility(super.builder);
  T up() => builder(VerticalDirection.up);
  T down() => builder(VerticalDirection.down);
}

class TextDirectionUtility<T> extends ScalarUtility<T, TextDirection> {
  const TextDirectionUtility(super.builder);
  T rtl() => builder(TextDirection.rtl);
  T ltr() => builder(TextDirection.ltr);
}

class SoftWrapUtility<T> extends ScalarUtility<T, bool> {
  const SoftWrapUtility(super.builder);
  T on() => builder(true);
  T off() => builder(false);
}

class FlexFitUtility<T> extends ScalarUtility<T, FlexFit> {
  const FlexFitUtility(super.builder);
  T tight() => builder(FlexFit.tight);
  T loose() => builder(FlexFit.loose);
}

class AxisUtility<T> extends ScalarUtility<T, Axis> {
  const AxisUtility(super.builder);
  T horizontal() => builder(Axis.horizontal);
  T vertical() => builder(Axis.vertical);
}

class MainAxisAlignmentUtility<T> extends ScalarUtility<T, MainAxisAlignment> {
  const MainAxisAlignmentUtility(super.builder);
  T spaceBetween() => builder(MainAxisAlignment.spaceBetween);
  T spaceAround() => builder(MainAxisAlignment.spaceAround);
  T spaceEvenly() => builder(MainAxisAlignment.spaceEvenly);

  T start() => builder(MainAxisAlignment.start);
  T end() => builder(MainAxisAlignment.end);
  T center() => builder(MainAxisAlignment.center);
}

class CrossAxisAlignmentUtility<T>
    extends ScalarUtility<T, CrossAxisAlignment> {
  const CrossAxisAlignmentUtility(super.builder);
  T start() => builder(CrossAxisAlignment.start);
  T end() => builder(CrossAxisAlignment.end);
  T center() => builder(CrossAxisAlignment.center);
  T stretch() => builder(CrossAxisAlignment.stretch);
  T baseline() => builder(CrossAxisAlignment.baseline);
}

class MainAxisSizeUtility<T> extends ScalarUtility<T, MainAxisSize> {
  const MainAxisSizeUtility(super.builder);
  T min() => builder(MainAxisSize.min);
  T max() => builder(MainAxisSize.max);
}

abstract class MixUtility<Attr, Value> {
  final Attr Function(Value value) builder;
  const MixUtility(this.builder);
}

abstract class ScalarUtility<Return, Param> extends MixUtility<Return, Param> {
  const ScalarUtility(super.builder);

  Return call(Param value) => builder(value);
}

class DoubleUtility<T> extends ScalarUtility<T, double> {
  const DoubleUtility(super.builder);
}

class ImageRepeatUtility<T> extends ScalarUtility<T, ImageRepeat> {
  const ImageRepeatUtility(super.builder);
  T noRepeat() => builder(ImageRepeat.noRepeat);
  T repeat() => builder(ImageRepeat.repeat);
  T repeatX() => builder(ImageRepeat.repeatX);
  T repeatY() => builder(ImageRepeat.repeatY);
}

class SizeUtility<T> extends DoubleUtility<T> {
  const SizeUtility(super.builder);
}

class FontSizeUtility<T> extends SizeUtility<T> {
  const FontSizeUtility(super.builder);
}

class BoxFitUtility<T> extends ScalarUtility<T, BoxFit> {
  const BoxFitUtility(super.builder);
  T fill() => builder(BoxFit.fill);
  T contain() => builder(BoxFit.contain);
  T cover() => builder(BoxFit.cover);
  T fitWidth() => builder(BoxFit.fitWidth);
  T fitHeight() => builder(BoxFit.fitHeight);
  T none() => builder(BoxFit.none);
  T scaleDown() => builder(BoxFit.scaleDown);
}

class BlendModeUtility<T> extends ScalarUtility<T, BlendMode> {
  const BlendModeUtility(super.builder);
}

class BoxShapeUtility<T> extends ScalarUtility<T, BoxShape> {
  const BoxShapeUtility(super.builder);
  T circle() => builder(BoxShape.circle);
  T rectangle() => builder(BoxShape.rectangle);
}

class FontWeightUtility<T> extends ScalarUtility<T, FontWeight> {
  const FontWeightUtility(super.builder);
  T bold() => builder(FontWeight.bold);
  T normal() => builder(FontWeight.normal);
}

class TextDecorationUtility<T> extends ScalarUtility<T, TextDecoration> {
  const TextDecorationUtility(super.builder);

  T underline() => builder(TextDecoration.underline);
  T overline() => builder(TextDecoration.overline);
  T lineThrough() => builder(TextDecoration.lineThrough);
  T none() => builder(TextDecoration.none);
}

class FontStyleUtility<T> extends ScalarUtility<T, FontStyle> {
  const FontStyleUtility(super.builder);

  T italic() => builder(FontStyle.italic);
  T normal() => builder(FontStyle.normal);
}

class RadiusUtility<T> extends MixUtility<T, Radius> {
  const RadiusUtility(super.builder);

  T zero() => builder(Radius.zero);

  T elliptical(double x, double y) => builder(Radius.elliptical(x, y));

  T call(double radius) => builder(Radius.circular(radius));
}

class TextDecorationStyleUtility<T>
    extends ScalarUtility<T, TextDecorationStyle> {
  const TextDecorationStyleUtility(super.builder);

  T solid() => builder(TextDecorationStyle.solid);
  T double() => builder(TextDecorationStyle.double);
  T dotted() => builder(TextDecorationStyle.dotted);
  T dashed() => builder(TextDecorationStyle.dashed);
  T wavy() => builder(TextDecorationStyle.wavy);
}

class TextBaselineUtility<T> extends ScalarUtility<T, TextBaseline> {
  const TextBaselineUtility(super.builder);

  T alphabetic() => builder(TextBaseline.alphabetic);
  T ideographic() => builder(TextBaseline.ideographic);
}

class FontFamilyUtility<T> extends ScalarUtility<T, String> {
  const FontFamilyUtility(super.builder);
}

class TextOverflowUtility<T> extends ScalarUtility<T, TextOverflow> {
  const TextOverflowUtility(super.builder);
  T clip() => builder(TextOverflow.clip);
  T ellipsis() => builder(TextOverflow.ellipsis);
  T fade() => builder(TextOverflow.fade);
}

class TextWidthBasisUtility<T> extends ScalarUtility<T, TextWidthBasis> {
  const TextWidthBasisUtility(super.builder);
  T parent() => builder(TextWidthBasis.parent);
  T longestLine() => builder(TextWidthBasis.longestLine);
}

const textAlign = TextAlignUtility(TextAlignAttribute.new);

class TextAlignUtility<T> extends ScalarUtility<T, TextAlign> {
  const TextAlignUtility(super.builder);
  T left() => builder(TextAlign.left);
  T right() => builder(TextAlign.right);
  T center() => builder(TextAlign.center);
  T justify() => builder(TextAlign.justify);
  T start() => builder(TextAlign.start);
  T end() => builder(TextAlign.end);
}
