import 'package:flutter/material.dart';

import '../attributes/alignment_attribute.dart';

abstract class MixUtility<Attr, Value> {
  final Attr Function(Value value) _builder;
  const MixUtility(this._builder);

  static V selfBuilder<V>(V value) => value;

  Attr as(Value value) => _builder(value);
}

abstract class EnumUtility<Return, Param> extends MixUtility<Return, Param> {
  const EnumUtility(super.builder);
}

abstract class ScalarUtility<Return, Param> extends MixUtility<Return, Param> {
  const ScalarUtility(super.builder);

  Return call(Param value) => _builder(value);
}

class AlignmentUtility<T> extends MixUtility<T, AlignmentGeometry> {
  static const selfBuilder = AlignmentUtility(AlignmentGeometryAttribute.new);
  const AlignmentUtility(super.builder);

  T _topLeft() => as(Alignment.topLeft);
  T _topCenter() => as(Alignment.topCenter);
  T _topRight() => as(Alignment.topRight);
  T _centerLeft() => as(Alignment.centerLeft);
  T _center() => as(Alignment.center);
  T _centerRight() => as(Alignment.centerRight);
  T _bottomLeft() => as(Alignment.bottomLeft);
  T _bottomCenter() => as(Alignment.bottomCenter);
  T _bottomRight() => as(Alignment.bottomRight);
  T _only(double? x, double? y, double? start) {
    return start == null
        ? as(Alignment(x ?? 0, y ?? 0))
        : as(AlignmentDirectional(start, y ?? 0));
  }

  T topLeft() => _topLeft();
  T topCenter() => _topCenter();
  T topRight() => _topRight();
  T centerLeft() => _centerLeft();
  T center() => _center();
  T centerRight() => _centerRight();
  T bottomLeft() => _bottomLeft();
  T bottomCenter() => _bottomCenter();
  T bottomRight() => _bottomRight();
  T only(double? x, double? y, double? start) => _only(x, y, start);
}

class DoubleUtility<T> extends ScalarUtility<T, double> {
  const DoubleUtility(super.builder);

  T zero() => _builder(0);
  T infinity() => _builder(double.infinity);
}

class IntUtility<T> extends ScalarUtility<T, int> {
  const IntUtility(super.builder);
}

class BoolUtility<T> extends ScalarUtility<T, bool> {
  const BoolUtility(super.builder);

  T on() => _builder(true);
  T off() => _builder(false);
}

class VerticalDirectionUtility<T> extends EnumUtility<T, VerticalDirection> {
  const VerticalDirectionUtility(super.builder);
  T up() => _builder(VerticalDirection.up);
  T down() => _builder(VerticalDirection.down);
}

class ClipUtility<T> extends EnumUtility<T, Clip> {
  const ClipUtility(super.builder);
  T antiAliasWithSaveLayer() => _builder(Clip.antiAliasWithSaveLayer);
  T none() => _builder(Clip.none);
  T hardEdge() => _builder(Clip.hardEdge);
  T antiAlias() => _builder(Clip.antiAlias);
}

class SoftWrapUtility<T> extends BoolUtility<T> {
  const SoftWrapUtility(super.builder);
}

class FlexFitUtility<T> extends EnumUtility<T, FlexFit> {
  const FlexFitUtility(super.builder);
  T tight() => _builder(FlexFit.tight);
  T loose() => _builder(FlexFit.loose);
}

class TextHeightBehaviorUtility<T>
    extends ScalarUtility<T, TextHeightBehavior> {
  const TextHeightBehaviorUtility(super.builder);
}

class AxisUtility<T> extends EnumUtility<T, Axis> {
  const AxisUtility(super.builder);
  T horizontal() => _builder(Axis.horizontal);
  T vertical() => _builder(Axis.vertical);
}

class StackFitUtility<T> extends EnumUtility<T, StackFit> {
  const StackFitUtility(super.builder);
  T loose() => _builder(StackFit.loose);
  T expand() => _builder(StackFit.expand);
  T passthrough() => _builder(StackFit.passthrough);
}

class TextDirectionUtility<T> extends EnumUtility<T, TextDirection> {
  const TextDirectionUtility(super.builder);
  T rtl() => _builder(TextDirection.rtl);
  T ltr() => _builder(TextDirection.ltr);
}

class TileModeUtility<T> extends EnumUtility<T, TileMode> {
  const TileModeUtility(super.builder);
  T clamp() => _builder(TileMode.clamp);
  T mirror() => _builder(TileMode.mirror);
  T repeat() => _builder(TileMode.repeated);
  T decal() => _builder(TileMode.decal);
}

class GradientTransformUtility<T> extends ScalarUtility<T, GradientTransform> {
  const GradientTransformUtility(super.builder);
}

class Matrix4Utility<T> extends ScalarUtility<T, Matrix4> {
  const Matrix4Utility(super.builder);
}

class MainAxisAlignmentUtility<T> extends EnumUtility<T, MainAxisAlignment> {
  const MainAxisAlignmentUtility(super.builder);
  T spaceBetween() => _builder(MainAxisAlignment.spaceBetween);
  T spaceAround() => _builder(MainAxisAlignment.spaceAround);
  T spaceEvenly() => _builder(MainAxisAlignment.spaceEvenly);

  T start() => _builder(MainAxisAlignment.start);
  T end() => _builder(MainAxisAlignment.end);
  T center() => _builder(MainAxisAlignment.center);
}

class CrossAxisAlignmentUtility<T> extends EnumUtility<T, CrossAxisAlignment> {
  const CrossAxisAlignmentUtility(super.builder);
  T start() => _builder(CrossAxisAlignment.start);
  T end() => _builder(CrossAxisAlignment.end);
  T center() => _builder(CrossAxisAlignment.center);
  T stretch() => _builder(CrossAxisAlignment.stretch);
  T baseline() => _builder(CrossAxisAlignment.baseline);
}

class MainAxisSizeUtility<T> extends EnumUtility<T, MainAxisSize> {
  const MainAxisSizeUtility(super.builder);
  T min() => _builder(MainAxisSize.min);
  T max() => _builder(MainAxisSize.max);
}

class ListUtility<T, V> extends MixUtility<T, List<V>> {
  const ListUtility(super.builder);
  T call(List<V> value) => _builder(value);
}

class ImageRepeatUtility<T> extends EnumUtility<T, ImageRepeat> {
  const ImageRepeatUtility(super.builder);
  T noRepeat() => _builder(ImageRepeat.noRepeat);
  T repeat() => _builder(ImageRepeat.repeat);
  T repeatX() => _builder(ImageRepeat.repeatX);
  T repeatY() => _builder(ImageRepeat.repeatY);
}

class OffsetUtility<T> extends MixUtility<T, Offset> {
  const OffsetUtility(super.builder);
}

class SizingUtility<T> extends DoubleUtility<T> {
  const SizingUtility(super.builder);
}

class FontSizeUtility<T> extends SizingUtility<T> {
  const FontSizeUtility(super.builder);
}

class BoxFitUtility<T> extends EnumUtility<T, BoxFit> {
  const BoxFitUtility(super.builder);
  T fill() => _builder(BoxFit.fill);
  T contain() => _builder(BoxFit.contain);
  T cover() => _builder(BoxFit.cover);
  T fitWidth() => _builder(BoxFit.fitWidth);
  T fitHeight() => _builder(BoxFit.fitHeight);
  T none() => _builder(BoxFit.none);
  T scaleDown() => _builder(BoxFit.scaleDown);
}

class BlendModeUtility<T> extends EnumUtility<T, BlendMode> {
  const BlendModeUtility(super.builder);

  T clear() => _builder(BlendMode.clear);
  T src() => _builder(BlendMode.src);
  T dst() => _builder(BlendMode.dst);
  T srcOver() => _builder(BlendMode.srcOver);
  T dstOver() => _builder(BlendMode.dstOver);
  T srcIn() => _builder(BlendMode.srcIn);
  T dstIn() => _builder(BlendMode.dstIn);
  T srcOut() => _builder(BlendMode.srcOut);
  T dstOut() => _builder(BlendMode.dstOut);
  T srcATop() => _builder(BlendMode.srcATop);
  T dstATop() => _builder(BlendMode.dstATop);
  T xor() => _builder(BlendMode.xor);
  T plus() => _builder(BlendMode.plus);
  T modulate() => _builder(BlendMode.modulate);
  T screen() => _builder(BlendMode.screen);
  T overlay() => _builder(BlendMode.overlay);
  T darken() => _builder(BlendMode.darken);
  T lighten() => _builder(BlendMode.lighten);
  T colorDodge() => _builder(BlendMode.colorDodge);
  T colorBurn() => _builder(BlendMode.colorBurn);
  T hardLight() => _builder(BlendMode.hardLight);
  T softLight() => _builder(BlendMode.softLight);
  T difference() => _builder(BlendMode.difference);
  T exclusion() => _builder(BlendMode.exclusion);
  T multiply() => _builder(BlendMode.multiply);
  T hue() => _builder(BlendMode.hue);
  T saturation() => _builder(BlendMode.saturation);
  T color() => _builder(BlendMode.color);
  T luminosity() => _builder(BlendMode.luminosity);
}

class BoxShapeUtility<T> extends EnumUtility<T, BoxShape> {
  const BoxShapeUtility(super.builder);
  T circle() => _builder(BoxShape.circle);
  T rectangle() => _builder(BoxShape.rectangle);
}

class FontWeightUtility<T> extends EnumUtility<T, FontWeight> {
  const FontWeightUtility(super.builder);
  T bold() => _builder(FontWeight.bold);
  T normal() => _builder(FontWeight.normal);
}

class TextDecorationUtility<T> extends EnumUtility<T, TextDecoration> {
  const TextDecorationUtility(super.builder);

  T underline() => _builder(TextDecoration.underline);
  T overline() => _builder(TextDecoration.overline);
  T lineThrough() => _builder(TextDecoration.lineThrough);
  T none() => _builder(TextDecoration.none);
}

class FontStyleUtility<T> extends EnumUtility<T, FontStyle> {
  const FontStyleUtility(super.builder);

  T italic() => _builder(FontStyle.italic);
  T normal() => _builder(FontStyle.normal);
}

class RadiusUtility<T> extends MixUtility<T, Radius> {
  const RadiusUtility(super.builder);

  T zero() => _builder(Radius.zero);

  T elliptical(double x, double y) => _builder(Radius.elliptical(x, y));

  T call(double radius) => _builder(Radius.circular(radius));
}

class TextDecorationStyleUtility<T>
    extends EnumUtility<T, TextDecorationStyle> {
  const TextDecorationStyleUtility(super.builder);

  T solid() => _builder(TextDecorationStyle.solid);
  T double() => _builder(TextDecorationStyle.double);
  T dotted() => _builder(TextDecorationStyle.dotted);
  T dashed() => _builder(TextDecorationStyle.dashed);
  T wavy() => _builder(TextDecorationStyle.wavy);
}

class TextBaselineUtility<T> extends EnumUtility<T, TextBaseline> {
  const TextBaselineUtility(super.builder);

  T alphabetic() => _builder(TextBaseline.alphabetic);
  T ideographic() => _builder(TextBaseline.ideographic);
}

class FontFamilyUtility<T> extends ScalarUtility<T, String> {
  const FontFamilyUtility(super.builder);
}

class TextOverflowUtility<T> extends EnumUtility<T, TextOverflow> {
  const TextOverflowUtility(super.builder);
  T clip() => _builder(TextOverflow.clip);
  T ellipsis() => _builder(TextOverflow.ellipsis);
  T fade() => _builder(TextOverflow.fade);
}

class TextWidthBasisUtility<T> extends EnumUtility<T, TextWidthBasis> {
  const TextWidthBasisUtility(super.builder);
  T parent() => _builder(TextWidthBasis.parent);
  T longestLine() => _builder(TextWidthBasis.longestLine);
}

class TextAlignUtility<T> extends EnumUtility<T, TextAlign> {
  const TextAlignUtility(super.builder);
  T left() => _builder(TextAlign.left);
  T right() => _builder(TextAlign.right);
  T center() => _builder(TextAlign.center);
  T justify() => _builder(TextAlign.justify);
  T start() => _builder(TextAlign.start);
  T end() => _builder(TextAlign.end);
}
