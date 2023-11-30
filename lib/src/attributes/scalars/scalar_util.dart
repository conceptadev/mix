import 'package:flutter/material.dart';

import '../../core/attribute.dart';

typedef UtilityBuilder<ReturnType, ParamType> = ReturnType Function(
  ParamType value,
);

abstract class MixUtility<Attr, Value> {
  final UtilityBuilder<Attr, Value> _builder;
  const MixUtility(this._builder);

  static V selfBuilder<V>(V value) => value;

  @protected
  UtilityBuilder<Attr, Value> get builder => _builder;
}

abstract class DtoUtility<Attr, D extends Dto<D, Value>, Value>
    extends MixUtility<Attr, D> {
  @protected
  final UtilityBuilder<D, Value> dtoBuilder;

  const DtoUtility(super.builder, {required this.dtoBuilder});

  Attr as(Value value) => _builder(dtoBuilder(value));
}

mixin CallableUtilityMixin<Attr, Value> on MixUtility<Attr, Value> {
  Attr call(Value value) => _builder(value);
}

abstract class ScalarUtility<Return, Param> extends MixUtility<Return, Param> {
  const ScalarUtility(super.builder);
}

class AlignmentUtility<T> extends ScalarUtility<T, AlignmentGeometry> {
  const AlignmentUtility(super.builder);

  T _topLeft() => builder(Alignment.topLeft);
  T _topCenter() => builder(Alignment.topCenter);
  T _topRight() => builder(Alignment.topRight);
  T _centerLeft() => builder(Alignment.centerLeft);
  T _center() => builder(Alignment.center);
  T _centerRight() => builder(Alignment.centerRight);
  T _bottomLeft() => builder(Alignment.bottomLeft);
  T _bottomCenter() => builder(Alignment.bottomCenter);
  T _bottomRight() => builder(Alignment.bottomRight);
  T _only(double? x, double? y, double? start) {
    return start == null
        ? builder(Alignment(x ?? 0, y ?? 0))
        : builder(AlignmentDirectional(start, y ?? 0));
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

  T zero() => builder(0);
  T infinity() => builder(double.infinity);
}

class IntUtility<T> extends ScalarUtility<T, int> {
  const IntUtility(super.builder);

  T zero() => builder(0);
}

class BoolUtility<T> extends ScalarUtility<T, bool> {
  const BoolUtility(super.builder);

  T on() => builder(true);
  T off() => builder(false);
}

class VerticalDirectionUtility<T> extends ScalarUtility<T, VerticalDirection> {
  const VerticalDirectionUtility(super.builder);
  T up() => builder(VerticalDirection.up);
  T down() => builder(VerticalDirection.down);
}

class ClipUtility<T> extends ScalarUtility<T, Clip> {
  const ClipUtility(super.builder);
  T antiAliasWithSaveLayer() => builder(Clip.antiAliasWithSaveLayer);
  T none() => builder(Clip.none);
  T hardEdge() => builder(Clip.hardEdge);
  T antiAlias() => builder(Clip.antiAlias);
}

class SoftWrapUtility<T> extends BoolUtility<T> {
  const SoftWrapUtility(super.builder);
}

class FlexFitUtility<T> extends ScalarUtility<T, FlexFit> {
  const FlexFitUtility(super.builder);
  T tight() => builder(FlexFit.tight);
  T loose() => builder(FlexFit.loose);
}

class TextHeightBehaviorUtility<T>
    extends ScalarUtility<T, TextHeightBehavior> {
  const TextHeightBehaviorUtility(super.builder);
}

class AxisUtility<T> extends ScalarUtility<T, Axis> {
  const AxisUtility(super.builder);
  T horizontal() => builder(Axis.horizontal);
  T vertical() => builder(Axis.vertical);
}

class StackFitUtility<T> extends ScalarUtility<T, StackFit> {
  const StackFitUtility(super.builder);
  T loose() => builder(StackFit.loose);
  T expand() => builder(StackFit.expand);
  T passthrough() => builder(StackFit.passthrough);
}

class TextDirectionUtility<T> extends ScalarUtility<T, TextDirection> {
  const TextDirectionUtility(super.builder);
  T rtl() => builder(TextDirection.rtl);
  T ltr() => builder(TextDirection.ltr);
}

class TileModeUtility<T> extends ScalarUtility<T, TileMode> {
  const TileModeUtility(super.builder);
  T clamp() => builder(TileMode.clamp);
  T mirror() => builder(TileMode.mirror);
  T repeat() => builder(TileMode.repeated);
  T decal() => builder(TileMode.decal);
}

class GradientTransformUtility<T> extends ScalarUtility<T, GradientTransform> {
  const GradientTransformUtility(super.builder);
}

class Matrix4Utility<T> extends ScalarUtility<T, Matrix4> {
  const Matrix4Utility(super.builder);
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

class ListUtility<T, V> extends MixUtility<T, List<V>> {
  const ListUtility(super.builder);
}

class FontFamilyUtility<T> extends ScalarUtility<T, String> {
  const FontFamilyUtility(super.builder);
}

class ImageRepeatUtility<T> extends ScalarUtility<T, ImageRepeat> {
  const ImageRepeatUtility(super.builder);
  T noRepeat() => builder(ImageRepeat.noRepeat);
  T repeat() => builder(ImageRepeat.repeat);
  T repeatX() => builder(ImageRepeat.repeatX);
  T repeatY() => builder(ImageRepeat.repeatY);
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

  T clear() => builder(BlendMode.clear);
  T src() => builder(BlendMode.src);
  T dst() => builder(BlendMode.dst);
  T srcOver() => builder(BlendMode.srcOver);
  T dstOver() => builder(BlendMode.dstOver);
  T srcIn() => builder(BlendMode.srcIn);
  T dstIn() => builder(BlendMode.dstIn);
  T srcOut() => builder(BlendMode.srcOut);
  T dstOut() => builder(BlendMode.dstOut);
  T srcATop() => builder(BlendMode.srcATop);
  T dstATop() => builder(BlendMode.dstATop);
  T xor() => builder(BlendMode.xor);
  T plus() => builder(BlendMode.plus);
  T modulate() => builder(BlendMode.modulate);
  T screen() => builder(BlendMode.screen);
  T overlay() => builder(BlendMode.overlay);
  T darken() => builder(BlendMode.darken);
  T lighten() => builder(BlendMode.lighten);
  T colorDodge() => builder(BlendMode.colorDodge);
  T colorBurn() => builder(BlendMode.colorBurn);
  T hardLight() => builder(BlendMode.hardLight);
  T softLight() => builder(BlendMode.softLight);
  T difference() => builder(BlendMode.difference);
  T exclusion() => builder(BlendMode.exclusion);
  T multiply() => builder(BlendMode.multiply);
  T hue() => builder(BlendMode.hue);
  T saturation() => builder(BlendMode.saturation);
  T color() => builder(BlendMode.color);
  T luminosity() => builder(BlendMode.luminosity);
}

class BoxShapeUtility<T> extends ScalarUtility<T, BoxShape> {
  const BoxShapeUtility(super.builder);
  T circle() => _builder(BoxShape.circle);
  T rectangle() => _builder(BoxShape.rectangle);
}

class FontWeightUtility<T> extends ScalarUtility<T, FontWeight> {
  const FontWeightUtility(super.builder);
  T bold() => _builder(FontWeight.bold);
  T normal() => _builder(FontWeight.normal);
}

class TextDecorationUtility<T> extends ScalarUtility<T, TextDecoration> {
  const TextDecorationUtility(super.builder);

  T underline() => _builder(TextDecoration.underline);
  T overline() => _builder(TextDecoration.overline);
  T lineThrough() => _builder(TextDecoration.lineThrough);
  T none() => _builder(TextDecoration.none);
}

class FontStyleUtility<T> extends ScalarUtility<T, FontStyle> {
  const FontStyleUtility(super.builder);

  T italic() => _builder(FontStyle.italic);
  T normal() => _builder(FontStyle.normal);
}

class RadiusUtility<T> extends MixUtility<T, Radius> {
  const RadiusUtility(super.builder);

  T zero() => _builder(Radius.zero);

  T elliptical(double x, double y) => _builder(Radius.elliptical(x, y));

  T circular(double radius) => _builder(Radius.circular(radius));
}

class TextDecorationStyleUtility<T>
    extends ScalarUtility<T, TextDecorationStyle> {
  const TextDecorationStyleUtility(super.builder);

  T solid() => _builder(TextDecorationStyle.solid);
  T double() => _builder(TextDecorationStyle.double);
  T dotted() => _builder(TextDecorationStyle.dotted);
  T dashed() => _builder(TextDecorationStyle.dashed);
  T wavy() => _builder(TextDecorationStyle.wavy);
}

class TextBaselineUtility<T> extends ScalarUtility<T, TextBaseline> {
  const TextBaselineUtility(super.builder);

  T alphabetic() => _builder(TextBaseline.alphabetic);
  T ideographic() => _builder(TextBaseline.ideographic);
}

class TextOverflowUtility<T> extends ScalarUtility<T, TextOverflow> {
  const TextOverflowUtility(super.builder);
  T clip() => _builder(TextOverflow.clip);
  T ellipsis() => _builder(TextOverflow.ellipsis);
  T fade() => _builder(TextOverflow.fade);
}

class TextWidthBasisUtility<T> extends ScalarUtility<T, TextWidthBasis> {
  const TextWidthBasisUtility(super.builder);
  T parent() => _builder(TextWidthBasis.parent);
  T longestLine() => _builder(TextWidthBasis.longestLine);
}

class TextAlignUtility<T> extends ScalarUtility<T, TextAlign> {
  const TextAlignUtility(super.builder);
  T left() => _builder(TextAlign.left);
  T right() => _builder(TextAlign.right);
  T center() => _builder(TextAlign.center);
  T justify() => _builder(TextAlign.justify);
  T start() => _builder(TextAlign.start);
  T end() => _builder(TextAlign.end);
}
