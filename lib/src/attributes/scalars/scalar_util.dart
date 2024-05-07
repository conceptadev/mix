import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../core/decorator.dart';
import '../../theme/tokens/radius_token.dart';

abstract class MixUtility<Attr extends Attribute, Value> {
  @protected
  final Attr Function(Value) builder;
  const MixUtility(this.builder);

  static T selfBuilder<T>(T value) => value;
}

abstract class SpecUtility<Attr extends Attribute, Value extends SpecAttribute>
    extends MixUtility<Attr, Value> {
  const SpecUtility(super.builder);

  Attr only();

  // SpecUtility<VariantAttribute, Value> call(Variant variant);
}

abstract class DecoratorUtility<
    T extends Attribute,
    D extends DecoratorAttribute<D, Value>,
    Value extends DecoratorSpec<Value>> extends MixUtility<T, D> {
  const DecoratorUtility(super.builder);
}

abstract class DtoUtility<Attr extends Attribute, D extends Dto<Value>, Value>
    extends MixUtility<Attr, D> {
  final D Function(Value) _fromValue;
  const DtoUtility(super.builder, {required D Function(Value) valueToDto})
      : _fromValue = valueToDto;

  /// Should contain all the named parameters of a [Dto] class
  /// to build the [StyleAttribute].
  Attr only();

  /// Returns a new [StyleAttribute] with the given [value].
  Attr as(Value value) => builder(_fromValue(value));
}

abstract class ScalarUtility<Return extends Attribute, Param>
    extends MixUtility<Return, Param> {
  const ScalarUtility(super.builder);

  Return as(Param value) => builder(value);

  Return call(Param value) => builder(value);
}

/// AlignmentUtility - A utility class for defining alignment attributes for widgets.
///
/// This class extends `ScalarUtility<T, AlignmentGeometry>`, allowing it to handle alignment attributes
/// using generic types. It provides methods to set various predefined alignments as well as custom alignments.
class AlignmentUtility<T extends Attribute>
    extends ScalarUtility<T, AlignmentGeometry> {
  // Constructor accepting a builder function to create instances of T.
  const AlignmentUtility(super.builder);

  /// Sets the alignment to top left.
  T topLeft() => builder(Alignment.topLeft);

  /// Sets the alignment to top center.
  T topCenter() => builder(Alignment.topCenter);

  /// Sets the alignment to top right.
  T topRight() => builder(Alignment.topRight);

  /// Sets the alignment to center left.
  T centerLeft() => builder(Alignment.centerLeft);

  /// Sets the alignment to center.
  T center() => builder(Alignment.center);

  /// Sets the alignment to center right.
  T centerRight() => builder(Alignment.centerRight);

  /// Sets the alignment to bottom left.
  T bottomLeft() => builder(Alignment.bottomLeft);

  /// Sets the alignment to bottom center.
  T bottomCenter() => builder(Alignment.bottomCenter);

  /// Sets the alignment to bottom right.
  T bottomRight() => builder(Alignment.bottomRight);

  /// Sets a custom alignment based on the provided x, y, or start values.
  ///
  /// The `x` and `start` parameters are mutually exclusive to avoid conflicts.
  /// The `x` parameter sets a specific horizontal alignment, while `start` aligns based on text direction (LTR/RTL).
  /// The `y` parameter sets the vertical alignment.
  ///
  /// - `x`: Horizontal alignment value, ignored if `start` is provided.
  /// - `y`: Vertical alignment value.
  /// - `start`: Horizontal alignment based on text direction, overrides `x` if provided.
  T only({double? x, double? y, double? start}) {
    assert(x == null || start == null,
        'Cannot provide both an x and a start parameter.');

    // If `start` is provided, it creates an AlignmentDirectional, otherwise a regular Alignment.
    return start == null
        ? builder(Alignment(x ?? 0, y ?? 0))
        : builder(AlignmentDirectional(start, y ?? 0));
  }
}

/// Utility for creating `double` values.
///
/// Includes predefined values such as zero and infinity.
///
/// Example:
/// ```dart
/// final utility = DoubleUtility(builder);
/// final tenValue = utility(10);
/// ```
class DoubleUtility<T extends Attribute> extends ScalarUtility<T, double> {
  const DoubleUtility(super.builder);

  T zero() => builder(0);

  T infinity() => builder(double.infinity);

  @override
  T call(double value) => builder(value);
}

/// Utility for Size values. Includes predefined values such as zero and infinity.
///
/// Example:
/// ```dart
/// final utility = SizeUtility(builder);
/// final oneHundred = utility(100);
/// ```
/// See also:
/// * [DoubleUtility]
abstract class SizingUtility<T extends Attribute> extends DoubleUtility<T> {
  const SizingUtility(super.builder);
}

/// Utility for creating `int` values.
///
/// Includes a predefined value for zero.
///
/// Example:
/// ```dart
/// final utility = IntUtility(builder);
/// final zeroValue = utility.zero();
/// final tenValue = utility(10);
/// // zeroValue is 0
/// ```
class IntUtility<T extends Attribute> extends ScalarUtility<T, int> {
  const IntUtility(super.builder);

  T zero() => builder(0);

  @override
  T call(int value) => builder(value);
}

/// Utility for creating `bool` values.
///
/// Simplifies setting boolean values to true or false.
///
/// Example:
/// ```dart
/// final boolUtility = BoolUtility(builder);
/// final enabled = boolUtility.on();
/// final disabled = boolUtility.off();
/// final boolValue = boolUtility(true);
/// ```
class BoolUtility<T extends Attribute> extends ScalarUtility<T, bool> {
  const BoolUtility(super.builder);

  T on() => builder(true);
  T off() => builder(false);

  @override
  T call(bool value) => builder(value);
}

/// Utility for setting `VerticalDirection` values.
///
/// Useful for defining the direction of vertical arrangements.
///
/// Example:
/// ```dart
/// final verticalDirection = VerticalDirectionUtility(builder);
///
/// VerticalDirection.up:
/// final up = verticalDirection.up();
///
/// VerticalDirection.down:
/// final down = verticalDirection.down();
/// ```
/// See [VerticalDirection] for more information.
class VerticalDirectionUtility<T extends Attribute>
    extends ScalarUtility<T, VerticalDirection> {
  const VerticalDirectionUtility(super.builder);
  T up() => builder(VerticalDirection.up);
  T down() => builder(VerticalDirection.down);
}

class BorderStyleUtility<T extends Attribute>
    extends ScalarUtility<T, BorderStyle> {
  const BorderStyleUtility(super.builder);
  T none() => builder(BorderStyle.none);
  T solid() => builder(BorderStyle.solid);
}

/// Utility for setting Clip`values.
///
/// Useful for defining the clipping behavior of widgets.
/// Includes predefined values of `Clip` such as `none`, `hardEdge`, and `antiAlias`.
/// Example:
/// ```dart
/// final clip = ClipUtility(builder);
/// final noneClip = clip.none();
/// final hardEdge = clip.hardEdge();
/// final antiAlias = clip.antiAlias();
/// ```
/// See [Clip] for more information.
class ClipUtility<T extends Attribute> extends ScalarUtility<T, Clip> {
  const ClipUtility(super.builder);
  T antiAliasWithSaveLayer() => builder(Clip.antiAliasWithSaveLayer);
  T none() => builder(Clip.none);
  T hardEdge() => builder(Clip.hardEdge);
  T antiAlias() => builder(Clip.antiAlias);
}

/// Utility for setting `FlexFit` values.
///
/// Useful for defining the fit of a widget within a flex layout.
/// Includes predefined values of `FlexFit` such as `tight` and `loose`.
/// Example:
/// ```dart
/// final flexFit = FlexFitUtility(builder);
/// final tight = flexFit.tight();
/// final loose = flexFit.loose();
/// ```
/// See [FlexFit] for more information.
class FlexFitUtility<T extends Attribute> extends ScalarUtility<T, FlexFit> {
  const FlexFitUtility(super.builder);
  T tight() => builder(FlexFit.tight);
  T loose() => builder(FlexFit.loose);
}

/// Utility for setting `TextHeightBehavior` values.

class TextHeightBehaviorUtility<T extends Attribute>
    extends ScalarUtility<T, TextHeightBehavior> {
  const TextHeightBehaviorUtility(super.builder);
}

/// Utility for setting `Axis` values.
///
/// Useful for defining the direction of flex layouts.
/// Includes predefined values of `Axis` such as `horizontal` and `vertical`.
/// Example:
/// ```dart
/// final axis = AxisUtility(builder);
/// final horizontal = axis.horizontal();
/// final vertical = axis.vertical();
/// ```
/// See [Axis] for more information.
class AxisUtility<T extends Attribute> extends ScalarUtility<T, Axis> {
  const AxisUtility(super.builder);
  T horizontal() => builder(Axis.horizontal);
  T vertical() => builder(Axis.vertical);
}

/// Utility for setting `StackFit` values.
///
/// Useful for defining the fit of a widget within a stack layout.
/// Includes predefined values of `StackFit` such as `loose` and `expand`.
/// Example:
/// ```dart
/// final stackFit = StackFitUtility(builder);
/// final loose = stackFit.loose();
/// final expand = stackFit.expand();
/// ```
/// See [StackFit] for more information.
class StackFitUtility<T extends Attribute> extends ScalarUtility<T, StackFit> {
  const StackFitUtility(super.builder);
  T loose() => builder(StackFit.loose);
  T expand() => builder(StackFit.expand);
  T passthrough() => builder(StackFit.passthrough);
}

/// Utility for setting `TextDirection` values.
///
/// Useful for defining the direction of text.
/// Includes predefined values of `TextDirection` such as `ltr` and `rtl`.
/// Example:
/// ```dart
/// final textDirection = TextDirectionUtility(builder);
/// final ltr = textDirection.ltr();
/// final rtl = textDirection.rtl();
/// ```
/// See [TextDirection] for more information.
class TextDirectionUtility<T extends Attribute>
    extends ScalarUtility<T, TextDirection> {
  const TextDirectionUtility(super.builder);
  T rtl() => builder(TextDirection.rtl);
  T ltr() => builder(TextDirection.ltr);
}

/// Utility for setting `TileMode` values.
///
/// Useful for defining the tiling behavior of images.
/// Includes predefined values of `TileMode` such as `clamp` and `mirror`.
/// Example:
/// ```dart
/// final tileMode = TileModeUtility(builder);
/// final clamp = tileMode.clamp();
/// final mirror = tileMode.mirror();
/// ```
/// See [TileMode] for more information.
class TileModeUtility<T extends Attribute> extends ScalarUtility<T, TileMode> {
  const TileModeUtility(super.builder);
  T clamp() => builder(TileMode.clamp);
  T mirror() => builder(TileMode.mirror);
  T repeated() => builder(TileMode.repeated);
  T decal() => builder(TileMode.decal);
}

/// Utility for setting `GradientTransform` values.
///
/// Useful for defining the transformation of gradients.
/// Includes subclasses of `GradientTransform` such `GradientRotation`.
/// Example:
/// ```dart
/// final gradientTransform = GradientTransformUtility(builder);
/// final rotate90 = gradientTransform.rotate(90);
/// ```
/// See [GradientTransform] for more information.
class GradientTransformUtility<T extends Attribute>
    extends ScalarUtility<T, GradientTransform> {
  const GradientTransformUtility(super.builder);

  T rotate(double radians) => builder(GradientRotation(radians));
}

/// Utility for setting `Matrix4` values.
///
/// Useful for defining the transformation of widgets.
/// Example:
/// ```dart
/// final matrix4 = Matrix4Utility(builder);
/// final identity = matrix4.identity();
/// final rotateX = matrix4.rotationX(0.5);
/// final rotateY = matrix4.rotationY(0.5);
/// final rotateZ = matrix4.rotationZ(0.5);
/// final translation = matrix4.translationValues(10, 10, 10);
/// final scale = matrix4.scale(2, 2, 2);
/// ```
/// See [Matrix4] for more information.
class Matrix4Utility<T extends Attribute> extends ScalarUtility<T, Matrix4> {
  const Matrix4Utility(super.builder);

  T identity() => builder(Matrix4.identity());
  T rotationX(double radians) => builder(Matrix4.rotationX(radians));
  T rotationY(double radians) => builder(Matrix4.rotationY(radians));
  T rotationZ(double radians) => builder(Matrix4.rotationZ(radians));
  T translationValues(double x, double y, double z) =>
      builder(Matrix4.translationValues(x, y, z));
}

/// Utility for setting `MainAxisAlignment` values.
///
/// Useful for defining the alignment of widgets within a flex layout.
/// Includes predefined values of `MainAxisAlignment` such as `start` and `end`.
/// Example:
/// ```dart
/// final mainAxisAlignment = MainAxisAlignmentUtility(builder);
/// final start = mainAxisAlignment.start();
/// final end = mainAxisAlignment.end();
/// ```
/// See [MainAxisAlignment] for more information.
class MainAxisAlignmentUtility<T extends Attribute>
    extends ScalarUtility<T, MainAxisAlignment> {
  const MainAxisAlignmentUtility(super.builder);
  T spaceBetween() => builder(MainAxisAlignment.spaceBetween);
  T spaceAround() => builder(MainAxisAlignment.spaceAround);
  T spaceEvenly() => builder(MainAxisAlignment.spaceEvenly);

  T start() => builder(MainAxisAlignment.start);
  T end() => builder(MainAxisAlignment.end);
  T center() => builder(MainAxisAlignment.center);
}

/// Utility for setting `CrossAxisAlignment` values.
///
/// Useful for defining the alignment of widgets within a flex layout.
/// Includes predefined values of `CrossAxisAlignment` such as `start` and `end`.
/// Example:
/// ```dart
/// final crossAxisAlignment = CrossAxisAlignmentUtility(builder);
/// final start = crossAxisAlignment.start();
/// final end = crossAxisAlignment.end();
/// ```
/// See [CrossAxisAlignment] for more information.
class CrossAxisAlignmentUtility<T extends Attribute>
    extends ScalarUtility<T, CrossAxisAlignment> {
  const CrossAxisAlignmentUtility(super.builder);
  T start() => builder(CrossAxisAlignment.start);
  T end() => builder(CrossAxisAlignment.end);
  T center() => builder(CrossAxisAlignment.center);
  T stretch() => builder(CrossAxisAlignment.stretch);
  T baseline() => builder(CrossAxisAlignment.baseline);
}

/// Utility for setting `MainAxisSize` values.
///
/// Useful for defining the size of widgets within a flex layout.
/// Includes predefined values of `MainAxisSize` such as `min` and `max`.
/// Example:
/// ```dart
/// final mainAxisSize = MainAxisSizeUtility(builder);
/// final min = mainAxisSize.min();
/// final max = mainAxisSize.max();
/// ```
/// See [MainAxisSize] for more information.
class MainAxisSizeUtility<T extends Attribute>
    extends ScalarUtility<T, MainAxisSize> {
  const MainAxisSizeUtility(super.builder);
  T min() => builder(MainAxisSize.min);
  T max() => builder(MainAxisSize.max);
}

/// Utility for setting FontFamily names in other attributes
///
/// Example:
/// ```dart
/// final fontFamily = FontFamilyUtility(builder);
/// final fontFamilyValue = fontFamily("Roboto");
/// ```
class FontFamilyUtility<T extends Attribute> extends ScalarUtility<T, String> {
  const FontFamilyUtility(super.builder);
}

/// Utility for setting `ImageRepeat` values.
///
/// Useful for defining the tiling behavior of images.
/// Includes predefined values of `ImageRepeat` such as `repeat` and `repeatX`.
/// Example:
/// ```dart
/// final imageRepeat = ImageRepeatUtility(builder);
/// final repeat = imageRepeat.repeat();
/// final repeatX = imageRepeat.repeatX();
/// final repeatY = imageRepeat.repeatY();
/// final noRepeat = imageRepeat.noRepeat();
/// ```
/// See [ImageRepeat] for more information.
class ImageRepeatUtility<T extends Attribute>
    extends MixUtility<T, ImageRepeat> {
  const ImageRepeatUtility(super.builder);

  T call() => builder(ImageRepeat.repeat);

  T noRepeat() => builder(ImageRepeat.noRepeat);
  T repeatX() => builder(ImageRepeat.repeatX);
  T repeatY() => builder(ImageRepeat.repeatY);
}

/// Utility for setting `Offset` values.
///
/// Useful for defining the offset of widgets.
/// Example:
/// ```dart
/// final offset = OffsetUtility(builder);
/// final offsetValue = offset(10, 10);
/// ```
class OffsetUtility<T extends Attribute> extends MixUtility<T, Offset> {
  const OffsetUtility(super.builder);

  T call(double dx, double dy) => builder(Offset(dx, dy));

  T zero() => builder(Offset.zero);
}

class FontSizeUtility<T extends Attribute> extends SizingUtility<T> {
  const FontSizeUtility(super.builder);
}

/// Utility for setting `BoxFit` values.
///
/// Useful for defining BoxFit values for widgets
/// Example:
/// ```dart
/// final boxFit = BoxFitUtility(builder);
/// final fill = boxFit.fill();
/// final contain = boxFit.contain();
/// final cover = boxFit.cover();
/// final fitWidth = boxFit.fitWidth();
/// final fitHeight = boxFit.fitHeight();
/// final none = boxFit.none();
/// final scaleDown = boxFit.scaleDown();
/// ```
/// See [BoxFit] for more information.
class BoxFitUtility<T extends Attribute> extends ScalarUtility<T, BoxFit> {
  const BoxFitUtility(super.builder);
  T fill() => builder(BoxFit.fill);
  T contain() => builder(BoxFit.contain);
  T cover() => builder(BoxFit.cover);
  T fitWidth() => builder(BoxFit.fitWidth);
  T fitHeight() => builder(BoxFit.fitHeight);
  T none() => builder(BoxFit.none);
  T scaleDown() => builder(BoxFit.scaleDown);
}

/// Utility for setting `BlendMode` values.
///
/// Useful for defining BlendMode values for widgets
/// Example:
/// ```dart
/// final blendMode = BlendModeUtility(builder);
/// final clear = blendMode.clear();
/// final src = blendMode.src();
/// ```
///
class BlendModeUtility<T extends Attribute>
    extends ScalarUtility<T, BlendMode> {
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

/// Utility for setting `BoxShape` values.
///
/// Useful for defining BoxShape values for widgets
///
/// Example:
///
/// ```dart
/// final boxShape = BoxShapeUtility(builder);
/// final circle = boxShape.circle();
/// final rectangle = boxShape.rectangle();
/// ```
///
/// See [BoxShape] for more information.
class BoxShapeUtility<T extends Attribute> extends ScalarUtility<T, BoxShape> {
  const BoxShapeUtility(super.builder);
  T circle() => builder(BoxShape.circle);
  T rectangle() => builder(BoxShape.rectangle);
}

/// Utility for setting `FontWeight` values.
///
/// Useful for defining FontWeight values for widgets
///
/// Example:
///
/// ```dart
/// final fontWeight = FontWeightUtility(builder);
/// final bold = fontWeight.bold();
/// final normal = fontWeight.normal();
/// final w100 = fontWeight.w100();
/// ```
///
/// See [FontWeight] for more information.
class FontWeightUtility<T extends Attribute>
    extends ScalarUtility<T, FontWeight> {
  const FontWeightUtility(super.builder);
  T bold() => builder(FontWeight.bold);
  T normal() => builder(FontWeight.normal);
  T w100() => builder(FontWeight.w100);
  T w200() => builder(FontWeight.w200);
  T w300() => builder(FontWeight.w300);
  T w400() => builder(FontWeight.w400);
  T w500() => builder(FontWeight.w500);
  T w600() => builder(FontWeight.w600);
  T w700() => builder(FontWeight.w700);
  T w800() => builder(FontWeight.w800);
  T w900() => builder(FontWeight.w900);
}

/// Utility for setting `TextDecoration` values.
///
/// Useful for defining TextDecoration values for widgets
///
/// Example:
///
/// ```dart
/// final textDecoration = TextDecorationUtility(builder);
/// final underline = textDecoration.underline();
/// final overline = textDecoration.overline();
/// final lineThrough = textDecoration.lineThrough();
/// final none = textDecoration.none();
/// ```
///
/// See [TextDecoration] for more information.
class TextDecorationUtility<T extends Attribute>
    extends ScalarUtility<T, TextDecoration> {
  const TextDecorationUtility(super.builder);

  T underline() => builder(TextDecoration.underline);
  T overline() => builder(TextDecoration.overline);
  T lineThrough() => builder(TextDecoration.lineThrough);
  T none() => builder(TextDecoration.none);
}

/// Utility for setting `FontStyle` values.
///
/// Useful for defining FontStyle values for widgets
///
/// Example:
///
/// ```dart
/// final fontStyle = FontStyleUtility(builder);
/// final italic = fontStyle.italic();
/// final normal = fontStyle.normal();
/// ```
///
/// See [FontStyle] for more information.
class FontStyleUtility<T extends Attribute>
    extends ScalarUtility<T, FontStyle> {
  const FontStyleUtility(super.builder);

  T italic() => builder(FontStyle.italic);
  T normal() => builder(FontStyle.normal);
}

/// Utility for setting `Radius` values.
///
/// Useful for defining Radius values for widgets
///
/// Example:
///
/// ```dart
/// final radius = RadiusUtility(builder);
/// final zero = radius.zero();
/// final circular = radius.circular(10);
/// final elliptical = radius.elliptical(10, 10);
/// final circular = radius(10);
/// ```
///
/// See [Radius] for more information.
class RadiusUtility<T extends Attribute> extends MixUtility<T, Radius> {
  const RadiusUtility(super.builder);

  T zero() => builder(Radius.zero);

  T elliptical(double x, double y) => builder(Radius.elliptical(x, y));

  T circular(double radius) => builder(Radius.circular(radius));

  T call(double radius) => builder(Radius.circular(radius));

  T ref(RadiusToken ref) => builder(ref());
}

/// Utility for setting `TextDecorationStyle` values.
///
/// Useful for defining TextDecorationStyle values for widgets
///
/// Example:
///
/// ```dart
/// final textDecorationStyle = TextDecorationStyleUtility(builder);
/// final solid = textDecorationStyle.solid();
/// final double = textDecorationStyle.double();
/// final dotted = textDecorationStyle.dotted();
/// final dashed = textDecorationStyle.dashed();
/// final wavy = textDecorationStyle.wavy();
/// ```
///
/// See [TextDecorationStyle] for more information.
class TextDecorationStyleUtility<T extends Attribute>
    extends ScalarUtility<T, TextDecorationStyle> {
  const TextDecorationStyleUtility(super.builder);

  T solid() => builder(TextDecorationStyle.solid);
  T double() => builder(TextDecorationStyle.double);
  T dotted() => builder(TextDecorationStyle.dotted);
  T dashed() => builder(TextDecorationStyle.dashed);
  T wavy() => builder(TextDecorationStyle.wavy);
}

/// Utility for setting `TextBaseline` values.
///
/// Useful for defining TextBaseline values for widgets
///
/// Example:
///
/// ```dart
/// final textBaseline = TextBaselineUtility(builder);
/// final alphabetic = textBaseline.alphabetic();
/// final ideographic = textBaseline.ideographic();
/// ```
///
/// See [TextBaseline] for more information.
class TextBaselineUtility<T extends Attribute>
    extends ScalarUtility<T, TextBaseline> {
  const TextBaselineUtility(super.builder);

  T alphabetic() => builder(TextBaseline.alphabetic);
  T ideographic() => builder(TextBaseline.ideographic);
}

/// Utility for setting `TextOverflow` values.
///
/// Useful for defining TextOverflow values for widgets
///
/// Example:
///
/// ```dart
/// final textOverflow = TextOverflowUtility(builder);
/// final clip = textOverflow.clip();
/// final ellipsis = textOverflow.ellipsis();
/// final fade = textOverflow.fade();
/// ```
///
/// See [TextOverflow] for more information.
class TextOverflowUtility<T extends Attribute>
    extends ScalarUtility<T, TextOverflow> {
  const TextOverflowUtility(super.builder);
  T clip() => builder(TextOverflow.clip);
  T ellipsis() => builder(TextOverflow.ellipsis);
  T fade() => builder(TextOverflow.fade);
}

/// Utility for setting `TextWidthBasis` values.
///
/// Useful for defining TextWidthBasis values for widgets
///
/// Example:
///
/// ```dart
/// final textWidthBasis = TextWidthBasisUtility(builder);
/// final parent = textWidthBasis.parent();
/// final longestLine = textWidthBasis.longestLine();
/// ```
///
/// See [TextWidthBasis] for more information.
class TextWidthBasisUtility<T extends Attribute>
    extends ScalarUtility<T, TextWidthBasis> {
  const TextWidthBasisUtility(super.builder);
  T parent() => builder(TextWidthBasis.parent);
  T longestLine() => builder(TextWidthBasis.longestLine);
}

/// Utility for setting `TextAlign` values.
///
/// Useful for defining TextAlign values for widgets
///
/// Example:
///
/// ```dart
/// final textAlign = TextAlignUtility(builder);
/// final left = textAlign.left();
/// final right = textAlign.right();
/// final center = textAlign.center();
/// final justify = textAlign.justify();
/// final start = textAlign.start();
/// final end = textAlign.end();
/// ```
///
/// See [TextAlign] for more information.
class TextAlignUtility<T extends Attribute>
    extends ScalarUtility<T, TextAlign> {
  const TextAlignUtility(super.builder);
  T left() => builder(TextAlign.left);
  T right() => builder(TextAlign.right);
  T center() => builder(TextAlign.center);
  T justify() => builder(TextAlign.justify);
  T start() => builder(TextAlign.start);
  T end() => builder(TextAlign.end);
}

class RectUtility<T extends Attribute> extends ScalarUtility<T, Rect> {
  const RectUtility(super.builder);
  T largest() => builder(Rect.largest);
  T zero() => builder(Rect.zero);

  T fromCenter({
    required Offset center,
    required double width,
    required double height,
  }) =>
      builder(Rect.fromCenter(center: center, width: width, height: height));

  T fromLTRB(double left, double top, double right, double bottom) =>
      builder(Rect.fromLTRB(left, top, right, bottom));

  T fromLTWH(double left, double top, double width, double height) =>
      builder(Rect.fromLTWH(left, top, width, height));

  T fromCircle({required Offset center, required double radius}) =>
      builder(Rect.fromCircle(center: center, radius: radius));

  T fromPoints({required Offset a, required Offset b}) =>
      builder(Rect.fromPoints(a, b));
}

class FilterQualityUtility<T extends Attribute>
    extends ScalarUtility<T, FilterQuality> {
  const FilterQualityUtility(super.builder);

  T none() => builder(FilterQuality.none);
  T low() => builder(FilterQuality.low);
  T medium() => builder(FilterQuality.medium);
  T high() => builder(FilterQuality.high);
}
