import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../core/dto.dart';
import '../../core/modifier.dart';
import '../../theme/tokens/radius_token.dart';

abstract base class MixUtility<Attr extends Attribute, Value> {
  @protected
  final Attr Function(Value) builder;
  const MixUtility(this.builder);

  static T selfBuilder<T>(T value) => value;
}

abstract base class WidgetModifierUtility<
    T extends Attribute,
    D extends WidgetModifierAttribute<D, Value>,
    Value extends WidgetModifierSpec<Value>> extends MixUtility<T, D> {
  const WidgetModifierUtility(super.builder);
}

abstract base class DtoUtility<Attr extends Attribute, D extends Dto<Value>,
    Value> extends MixUtility<Attr, D> {
  final D Function(Value) _fromValue;
  DtoUtility(super.builder, {required D Function(Value) valueToDto})
      : _fromValue = valueToDto;

  Attr only();

  Attr as(Value value) => builder(_fromValue(value));
}

abstract base class ScalarUtility<Return extends Attribute, Param>
    extends MixUtility<Return, Param> {
  const ScalarUtility(super.builder);

  Return call(Param value) => builder(value);
}

class ListDtoUtility<T extends Attribute, D extends Dto<Value>, Value> {
  final T Function(List<D>) builder;
  final D Function(Value) valueToDto;
  const ListDtoUtility(this.builder, this.valueToDto);

  /// Creates an [Attribute] instance from a list of [BoxShadow] objects.
  ///
  /// This method maps each [BoxShadow] object to a [ShadowDto] object and passes the
  /// resulting list to the [builder] function to create the [Attribute] instance.
// ListDtoUtility<T, ColorDto, Color>(
//     (v) => only(colors: v),
//     (v) => v.toDto(),
//   );
  T call(List<Value> values) {
    return builder(values.map(valueToDto).toList());
  }
}

abstract base class ListUtility<T extends Attribute, V>
    extends MixUtility<T, List<V>> {
  const ListUtility(super.builder);

  T call(List<V> values) => builder(values);
}

final class DoubleListUtility<T extends Attribute>
    extends ListUtility<T, double> {
  const DoubleListUtility(super.builder);
}

/// A utility class for creating [Attribute] instances from [AlignmentGeometry] values.
///
/// This class extends [ScalarUtility] and provides methods to create [Attribute] instances
/// from predefined [Alignment] values or custom [Alignment] and [AlignmentDirectional] values.
final class AlignmentUtility<T extends Attribute>
    extends ScalarUtility<T, AlignmentGeometry> {
  const AlignmentUtility(super.builder);

  /// Creates an [Attribute] instance with [Alignment.topLeft].
  T topLeft() => builder(Alignment.topLeft);

  /// Creates an [Attribute] instance with [Alignment.topCenter].
  T topCenter() => builder(Alignment.topCenter);

  /// Creates an [Attribute] instance with [Alignment.topRight].
  T topRight() => builder(Alignment.topRight);

  /// Creates an [Attribute] instance with [Alignment.centerLeft].
  T centerLeft() => builder(Alignment.centerLeft);

  /// Creates an [Attribute] instance with [Alignment.center].
  T center() => builder(Alignment.center);

  /// Creates an [Attribute] instance with [Alignment.centerRight].
  T centerRight() => builder(Alignment.centerRight);

  /// Creates an [Attribute] instance with [Alignment.bottomLeft].
  T bottomLeft() => builder(Alignment.bottomLeft);

  /// Creates an [Attribute] instance with [Alignment.bottomCenter].
  T bottomCenter() => builder(Alignment.bottomCenter);

  /// Creates an [Attribute] instance with [Alignment.bottomRight].
  T bottomRight() => builder(Alignment.bottomRight);

  /// Creates an [Attribute] instance with a custom [Alignment] or [AlignmentDirectional] value.
  ///
  /// If [start] is provided, an [AlignmentDirectional] is created. Otherwise, an [Alignment] is created.
  ///
  /// Throws an [AssertionError] if both [x] and [start] are provided.
  T only({double? x, double? y, double? start}) {
    assert(x == null || start == null,
        'Cannot provide both an x and a start parameter.');

    return start == null
        ? builder(Alignment(x ?? 0, y ?? 0))
        : builder(AlignmentDirectional(start, y ?? 0));
  }
}

/// A utility class for creating [Attribute] instances from [double] values.
///
/// This class extends [ScalarUtility] and provides methods to create [Attribute] instances
/// from predefined [double] values or custom [double] values.
final class DoubleUtility<T extends Attribute>
    extends ScalarUtility<T, double> {
  const DoubleUtility(super.builder);

  /// Creates an [Attribute] instance with a value of 0.
  T zero() => builder(0);

  /// Creates an [Attribute] instance with a value of [double.infinity].
  T infinity() => builder(double.infinity);
}

/// A utilyt class for creating [Attribute] instances from [Duration] values.
///
/// This class extends [ScalarUtility] and provides methods to create [Attribute] instances
/// from predefined [Duration] values or custom [Duration] values.
final class DurationUtility<T extends Attribute>
    extends ScalarUtility<T, Duration> {
  const DurationUtility(super.builder);

  T zero() => builder(Duration.zero);

  T microseconds(int microseconds) =>
      builder(Duration(microseconds: microseconds));

  T milliseconds(int milliseconds) =>
      builder(Duration(milliseconds: milliseconds));

  T seconds(int seconds) => builder(Duration(seconds: seconds));

  T minutes(int minutes) => builder(Duration(minutes: minutes));
}

/// An abstract utility class for creating [Attribute] instances from [double] values representing sizes.
///
/// This class extends [DoubleUtility] and serves as a base for more specific sizing utilities.
abstract base class SizingUtility<T extends Attribute>
    extends DoubleUtility<T> {
  const SizingUtility(super.builder);
}

/// A utility class for creating [Attribute] instances from [int] values.
///
/// This class extends [ScalarUtility] and provides methods to create [Attribute] instances
/// from predefined [int] values or custom [int] values.
final class IntUtility<T extends Attribute> extends ScalarUtility<T, int> {
  const IntUtility(super.builder);

  /// Creates an [Attribute] instance with a value of 0.
  T zero() => builder(0);

  /// Creates an [Attribute] instance from a custom [int] value.
  @override
  T call(int value) => builder(value);
}

/// A utility class for creating [Attribute] instances from [Curve] values.
///
/// This class extends [ScalarUtility] and provides methods to create [Attribute] instances
/// from predefined [Curve] values or custom [Curve] values.
final class CurveUtility<T extends Attribute> extends ScalarUtility<T, Curve> {
  const CurveUtility(super.builder);

  /// Creates an [Attribute] instance with [Curves.linear].
  T linear() => builder(Curves.linear);

  /// Creates an [Attribute] instance with [Curves.decelerate].
  T decelerate() => builder(Curves.decelerate);

  /// Creates an [Attribute] instance with [Curves.fastOutSlowIn].
  T fastOutSlowIn() => builder(Curves.fastOutSlowIn);

  /// Creates an [Attribute] instance with [Curves.bounceIn].
  T bounceIn() => builder(Curves.bounceIn);

  /// Creates an [Attribute] instance with [Curves.bounceOut].
  T bounceOut() => builder(Curves.bounceOut);

  /// Creates an [Attribute] instance with [Curves.bounceInOut].
  T bounceInOut() => builder(Curves.bounceInOut);

  /// Creates an [Attribute] instance with [Curves.ease].
  T ease() => builder(Curves.ease);

  /// Creates an [Attribute] instance with [Curves.easeIn].
  T easeIn() => builder(Curves.easeIn);

  /// Creates an [Attribute] instance with [Curves.easeOut].
  T easeOut() => builder(Curves.easeOut);

  /// Creates an [Attribute] instance with [Curves.easeInOut].
  T easeInOut() => builder(Curves.easeInOut);
}

/// A utility class for creating [Attribute] instances from [bool] values.
///
/// This class extends [ScalarUtility] and provides methods to create [Attribute] instances
/// from predefined [bool] values or custom [bool] values.
final class BoolUtility<T extends Attribute> extends ScalarUtility<T, bool> {
  const BoolUtility(super.builder);

  /// Creates an [Attribute] instance with a value of `true`.
  T on() => builder(true);

  /// Creates an [Attribute] instance with a value of `false`.
  T off() => builder(false);
}

/// A utility class for creating [Attribute] instances from [VerticalDirection] values.
///
/// This class extends [ScalarUtility] and provides methods to create [Attribute] instances
/// from predefined [VerticalDirection] values.
final class VerticalDirectionUtility<T extends Attribute>
    extends ScalarUtility<T, VerticalDirection> {
  const VerticalDirectionUtility(super.builder);

  /// Creates an [Attribute] instance with [VerticalDirection.up].
  T up() => builder(VerticalDirection.up);

  /// Creates an [Attribute] instance with [VerticalDirection.down].
  T down() => builder(VerticalDirection.down);
}

/// A utility class for creating [Attribute] instances from [BorderStyle] values.
///
/// This class extends [ScalarUtility] and provides methods to create [Attribute] instances
/// from predefined [BorderStyle] values.
final class BorderStyleUtility<T extends Attribute>
    extends ScalarUtility<T, BorderStyle> {
  const BorderStyleUtility(super.builder);

  /// Creates an [Attribute] instance with [BorderStyle.none].
  T none() => builder(BorderStyle.none);

  /// Creates an [Attribute] instance with [BorderStyle.solid].
  T solid() => builder(BorderStyle.solid);
}

final class ImageProviderUtility<T extends Attribute>
    extends ScalarUtility<T, ImageProvider> {
  const ImageProviderUtility(super.builder);

  /// Creates an [Attribute] instance with [ImageProvider.network].
  /// @param url The URL of the image.
  T network(String url) => builder(NetworkImage(url));
  T file(File file) => builder(FileImage(file));
  T asset(String asset) => builder(AssetImage(asset));
  T memory(Uint8List bytes) => builder(MemoryImage(bytes));
}

/// A utility class for creating [Attribute] instances from [Clip] values.
///
/// This class extends [ScalarUtility] and provides methods to create [Attribute] instances
/// from predefined [Clip] values.
final class ClipUtility<T extends Attribute> extends ScalarUtility<T, Clip> {
  const ClipUtility(super.builder);

  /// Creates an [Attribute] instance with [Clip.antiAliasWithSaveLayer].
  T antiAliasWithSaveLayer() => builder(Clip.antiAliasWithSaveLayer);

  /// Creates an [Attribute] instance with [Clip.none].
  T none() => builder(Clip.none);

  /// Creates an [Attribute] instance with [Clip.hardEdge].
  T hardEdge() => builder(Clip.hardEdge);

  /// Creates an [Attribute] instance with [Clip.antiAlias].
  T antiAlias() => builder(Clip.antiAlias);
}

/// A utility class for creating [Attribute] instances from [FlexFit] values.
///
/// This class extends [ScalarUtility] and provides methods to create [Attribute] instances
/// from predefined [FlexFit] values.
final class FlexFitUtility<T extends Attribute>
    extends ScalarUtility<T, FlexFit> {
  const FlexFitUtility(super.builder);

  /// Creates an [Attribute] instance with [FlexFit.tight].
  T tight() => builder(FlexFit.tight);

  /// Creates an [Attribute] instance with [FlexFit.loose].
  T loose() => builder(FlexFit.loose);
}

/// A utility class for creating [Attribute] instances from [TextHeightBehavior] values.
///
/// This class extends [ScalarUtility] and provides a constructor to create instances
/// of this utility class.
final class TextHeightBehaviorUtility<T extends Attribute>
    extends ScalarUtility<T, TextHeightBehavior> {
  const TextHeightBehaviorUtility(super.builder);
}

/// A utility class for creating [Attribute] instances from [Axis] values.
///
/// This class extends [ScalarUtility] and provides methods to create [Attribute] instances
/// from predefined [Axis] values.
final class AxisUtility<T extends Attribute> extends ScalarUtility<T, Axis> {
  const AxisUtility(super.builder);

  /// Creates an [Attribute] instance with [Axis.horizontal].
  T horizontal() => builder(Axis.horizontal);

  /// Creates an [Attribute] instance with [Axis.vertical].
  T vertical() => builder(Axis.vertical);
}

/// A utility class for creating [Attribute] instances from [StackFit] values.
///
/// This class extends [ScalarUtility] and provides methods to create [Attribute] instances
/// from predefined [StackFit] values.
final class StackFitUtility<T extends Attribute>
    extends ScalarUtility<T, StackFit> {
  const StackFitUtility(super.builder);

  /// Creates an [Attribute] instance with [StackFit.loose].
  T loose() => builder(StackFit.loose);

  /// Creates an [Attribute] instance with [StackFit.expand].
  T expand() => builder(StackFit.expand);

  /// Creates an [Attribute] instance with [StackFit.passthrough].
  T passthrough() => builder(StackFit.passthrough);
}

/// A utility class for creating [Attribute] instances from [TextDirection] values.
///
/// This class extends [ScalarUtility] and provides methods to create [Attribute] instances
/// from predefined [TextDirection] values.
final class TextDirectionUtility<T extends Attribute>
    extends ScalarUtility<T, TextDirection> {
  const TextDirectionUtility(super.builder);

  /// Creates an [Attribute] instance with [TextDirection.rtl].
  T rtl() => builder(TextDirection.rtl);

  /// Creates an [Attribute] instance with [TextDirection.ltr].
  T ltr() => builder(TextDirection.ltr);
}

/// A utility class for creating [Attribute] instances from [TileMode] values.
///
/// This class extends [ScalarUtility] and provides methods to create [Attribute] instances
/// from predefined [TileMode] values.
final class TileModeUtility<T extends Attribute>
    extends ScalarUtility<T, TileMode> {
  const TileModeUtility(super.builder);

  /// Creates an [Attribute] instance with [TileMode.clamp].
  T clamp() => builder(TileMode.clamp);

  /// Creates an [Attribute] instance with [TileMode.mirror].
  T mirror() => builder(TileMode.mirror);

  /// Creates an [Attribute] instance with [TileMode.repeated].
  T repeated() => builder(TileMode.repeated);

  /// Creates an [Attribute] instance with [TileMode.decal].
  T decal() => builder(TileMode.decal);
}

/// A utility class for creating [Attribute] instances from [GradientTransform] values.
///
/// This class extends [ScalarUtility] and provides a method to create [Attribute] instances
/// from [GradientRotation] values.
final class GradientTransformUtility<T extends Attribute>
    extends ScalarUtility<T, GradientTransform> {
  const GradientTransformUtility(super.builder);

  /// Creates an [Attribute] instance with a [GradientRotation] value.
  T rotate(double radians) => builder(GradientRotation(radians));
}

/// A utility class for creating [Attribute] instances from [Matrix4] values.
///
/// This class extends [ScalarUtility] and provides methods to create [Attribute] instances
/// from predefined [Matrix4] values or custom [Matrix4] values.
final class Matrix4Utility<T extends Attribute>
    extends ScalarUtility<T, Matrix4> {
  const Matrix4Utility(super.builder);

  /// Creates an [Attribute] instance with [Matrix4.identity].
  T identity() => builder(Matrix4.identity());

  /// Creates an [Attribute] instance with a [Matrix4] rotated around the x-axis.
  T rotationX(double radians) => builder(Matrix4.rotationX(radians));

  /// Creates an [Attribute] instance with a [Matrix4] rotated around the y-axis.
  T rotationY(double radians) => builder(Matrix4.rotationY(radians));

  /// Creates an [Attribute] instance with a [Matrix4] rotated around the z-axis.
  T rotationZ(double radians) => builder(Matrix4.rotationZ(radians));

  /// Creates an [Attribute] instance with a [Matrix4] translated by the given values.
  T translationValues(double x, double y, double z) =>
      builder(Matrix4.translationValues(x, y, z));
}

/// A utility class for creating [Attribute] instances from [MainAxisAlignment] values.
///
/// This class extends [ScalarUtility] and provides methods to create [Attribute] instances
/// from predefined [MainAxisAlignment] values.
final class MainAxisAlignmentUtility<T extends Attribute>
    extends ScalarUtility<T, MainAxisAlignment> {
  const MainAxisAlignmentUtility(super.builder);

  /// Creates an [Attribute] instance with [MainAxisAlignment.spaceBetween].
  T spaceBetween() => builder(MainAxisAlignment.spaceBetween);

  /// Creates an [Attribute] instance with [MainAxisAlignment.spaceAround].
  T spaceAround() => builder(MainAxisAlignment.spaceAround);

  /// Creates an [Attribute] instance with [MainAxisAlignment.spaceEvenly].
  T spaceEvenly() => builder(MainAxisAlignment.spaceEvenly);

  /// Creates an [Attribute] instance with [MainAxisAlignment.start].
  T start() => builder(MainAxisAlignment.start);

  /// Creates an [Attribute] instance with [MainAxisAlignment.end].
  T end() => builder(MainAxisAlignment.end);

  /// Creates an [Attribute] instance with [MainAxisAlignment.center].
  T center() => builder(MainAxisAlignment.center);
}

/// A utility class for creating [Attribute] instances from [CrossAxisAlignment] values.
///
/// This class extends [ScalarUtility] and provides methods to create [Attribute] instances
/// from predefined [CrossAxisAlignment] values.
final class CrossAxisAlignmentUtility<T extends Attribute>
    extends ScalarUtility<T, CrossAxisAlignment> {
  const CrossAxisAlignmentUtility(super.builder);

  /// Creates an [Attribute] instance with [CrossAxisAlignment.start].
  T start() => builder(CrossAxisAlignment.start);

  /// Creates an [Attribute] instance with [CrossAxisAlignment.end].
  T end() => builder(CrossAxisAlignment.end);

  /// Creates an [Attribute] instance with [CrossAxisAlignment.center].
  T center() => builder(CrossAxisAlignment.center);

  /// Creates an [Attribute] instance with [CrossAxisAlignment.stretch].
  T stretch() => builder(CrossAxisAlignment.stretch);

  /// Creates an [Attribute] instance with [CrossAxisAlignment.baseline].
  T baseline() => builder(CrossAxisAlignment.baseline);
}

final class MainAxisSizeUtility<T extends Attribute>
    extends ScalarUtility<T, MainAxisSize> {
  const MainAxisSizeUtility(super.builder);
  T min() => builder(MainAxisSize.min);
  T max() => builder(MainAxisSize.max);
}

final class FontFamilyUtility<T extends Attribute>
    extends ScalarUtility<T, String> {
  const FontFamilyUtility(super.builder);
}

final class ImageRepeatUtility<T extends Attribute>
    extends MixUtility<T, ImageRepeat> {
  const ImageRepeatUtility(super.builder);

  T call() => builder(ImageRepeat.repeat);

  T noRepeat() => builder(ImageRepeat.noRepeat);
  T repeatX() => builder(ImageRepeat.repeatX);
  T repeatY() => builder(ImageRepeat.repeatY);
}

final class OffsetUtility<T extends Attribute> extends MixUtility<T, Offset> {
  const OffsetUtility(super.builder);

  T infinite() => builder(Offset.infinite);

  T call(double dx, double dy) => builder(Offset(dx, dy));

  T zero() => builder(Offset.zero);
}

final class FontSizeUtility<T extends Attribute> extends SizingUtility<T> {
  const FontSizeUtility(super.builder);
}

final class BoxFitUtility<T extends Attribute>
    extends ScalarUtility<T, BoxFit> {
  const BoxFitUtility(super.builder);
  T fill() => builder(BoxFit.fill);
  T contain() => builder(BoxFit.contain);
  T cover() => builder(BoxFit.cover);
  T fitWidth() => builder(BoxFit.fitWidth);
  T fitHeight() => builder(BoxFit.fitHeight);
  T none() => builder(BoxFit.none);
  T scaleDown() => builder(BoxFit.scaleDown);
}

final class BlendModeUtility<T extends Attribute>
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

final class BoxShapeUtility<T extends Attribute>
    extends ScalarUtility<T, BoxShape> {
  const BoxShapeUtility(super.builder);
  T circle() => builder(BoxShape.circle);
  T rectangle() => builder(BoxShape.rectangle);
}

final class FontWeightUtility<T extends Attribute>
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

final class TextDecorationUtility<T extends Attribute>
    extends ScalarUtility<T, TextDecoration> {
  const TextDecorationUtility(super.builder);

  T underline() => builder(TextDecoration.underline);
  T overline() => builder(TextDecoration.overline);
  T lineThrough() => builder(TextDecoration.lineThrough);
  T none() => builder(TextDecoration.none);
}

final class FontStyleUtility<T extends Attribute>
    extends ScalarUtility<T, FontStyle> {
  const FontStyleUtility(super.builder);

  T italic() => builder(FontStyle.italic);
  T normal() => builder(FontStyle.normal);
}

final class RadiusUtility<T extends Attribute> extends MixUtility<T, Radius> {
  const RadiusUtility(super.builder);

  T zero() => builder(Radius.zero);

  T elliptical(double x, double y) => builder(Radius.elliptical(x, y));

  T circular(double radius) => builder(Radius.circular(radius));

  T call(double radius) => builder(Radius.circular(radius));

  T ref(RadiusToken ref) => builder(ref());
}

final class TextDecorationStyleUtility<T extends Attribute>
    extends ScalarUtility<T, TextDecorationStyle> {
  const TextDecorationStyleUtility(super.builder);

  T solid() => builder(TextDecorationStyle.solid);
  T double() => builder(TextDecorationStyle.double);
  T dotted() => builder(TextDecorationStyle.dotted);
  T dashed() => builder(TextDecorationStyle.dashed);
  T wavy() => builder(TextDecorationStyle.wavy);
}

final class TextBaselineUtility<T extends Attribute>
    extends ScalarUtility<T, TextBaseline> {
  const TextBaselineUtility(super.builder);

  T alphabetic() => builder(TextBaseline.alphabetic);
  T ideographic() => builder(TextBaseline.ideographic);
}

final class TextOverflowUtility<T extends Attribute>
    extends ScalarUtility<T, TextOverflow> {
  const TextOverflowUtility(super.builder);
  T clip() => builder(TextOverflow.clip);
  T ellipsis() => builder(TextOverflow.ellipsis);
  T fade() => builder(TextOverflow.fade);
}

final class TextWidthBasisUtility<T extends Attribute>
    extends ScalarUtility<T, TextWidthBasis> {
  const TextWidthBasisUtility(super.builder);
  T parent() => builder(TextWidthBasis.parent);
  T longestLine() => builder(TextWidthBasis.longestLine);
}

final class TextAlignUtility<T extends Attribute>
    extends ScalarUtility<T, TextAlign> {
  const TextAlignUtility(super.builder);
  T left() => builder(TextAlign.left);
  T right() => builder(TextAlign.right);
  T center() => builder(TextAlign.center);
  T justify() => builder(TextAlign.justify);
  T start() => builder(TextAlign.start);
  T end() => builder(TextAlign.end);
}

final class RectUtility<T extends Attribute> extends ScalarUtility<T, Rect> {
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

final class FilterQualityUtility<T extends Attribute>
    extends ScalarUtility<T, FilterQuality> {
  const FilterQualityUtility(super.builder);

  T none() => builder(FilterQuality.none);
  T low() => builder(FilterQuality.low);
  T medium() => builder(FilterQuality.medium);
  T high() => builder(FilterQuality.high);
}
