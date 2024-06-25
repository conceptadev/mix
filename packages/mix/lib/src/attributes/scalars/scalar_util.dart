// ignore_for_file: unused_element

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mix_annotations/mix_annotations.dart';

import '../../core/attribute.dart';
import '../../core/utility.dart';
import '../../theme/tokens/radius_token.dart';

part 'scalar_util.g.dart';

@MixableScalarUtility(type: Alignment)
final class AlignmentUtility<T extends Attribute>
    extends ScalarUtility<T, AlignmentGeometry> with _$AlignmentUtility {
  const AlignmentUtility(super.builder);

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

final class AlignmentGeometryUtility<T extends Attribute>
    extends AlignmentUtility<T> {
  late final directional = AlignmentDirectionalUtility(builder);
  AlignmentGeometryUtility(super.builder);
}

@MixableScalarUtility()
final class AlignmentDirectionalUtility<T extends Attribute>
    extends ScalarUtility<T, AlignmentDirectional>
    with _$AlignmentDirectionalUtility {
  const AlignmentDirectionalUtility(super.builder);
  T only({double? y, double? start}) {
    return builder(AlignmentDirectional(start ?? 0, y ?? 0));
  }
}

final class FontFeatureUtility<T extends Attribute>
    extends ScalarUtility<T, FontFeature> {
  const FontFeatureUtility(super.builder);
}

final class FontFeatureListUtility<T extends Attribute>
    extends ListUtility<T, FontFeature> {
  const FontFeatureListUtility(super.builder);

  T enable(String feature) => builder([FontFeature.enable(feature)]);
  T disable(String feature) => builder([FontFeature.disable(feature)]);
}

@MixableScalarUtility()
final class DurationUtility<T extends Attribute>
    extends ScalarUtility<T, Duration> with _$DurationUtility {
  const DurationUtility(super.builder);

  T microseconds(int microseconds) =>
      builder(Duration(microseconds: microseconds));

  T milliseconds(int milliseconds) =>
      builder(Duration(milliseconds: milliseconds));

  T seconds(int seconds) => builder(Duration(seconds: seconds));

  T minutes(int minutes) => builder(Duration(minutes: minutes));
}

final class FontSizeUtility<T extends Attribute> extends SizingUtility<T> {
  FontSizeUtility(super.builder);
}

@MixableScalarUtility()
final class FontWeightUtility<T extends Attribute>
    extends ScalarUtility<T, FontWeight> with _$FontWeightUtility {
  const FontWeightUtility(super.builder);
}

@MixableScalarUtility()
final class TextDecorationUtility<T extends Attribute>
    extends ScalarUtility<T, TextDecoration> with _$TextDecorationUtility {
  const TextDecorationUtility(super.builder);
}

@MixableScalarUtility(type: Curves)
final class CurveUtility<T extends Attribute> extends ScalarUtility<T, Curve>
    with _$CurveUtility {
  const CurveUtility(super.builder);
}

@MixableScalarUtility()
final class OffsetUtility<T extends Attribute> extends MixUtility<T, Offset>
    with _$OffsetUtility {
  const OffsetUtility(super.builder);

  T call(double dx, double dy) => builder(Offset(dx, dy));

  T as(Offset offset) => builder(offset);
}

@MixableScalarUtility()
final class RadiusUtility<T extends Attribute> extends MixUtility<T, Radius>
    with _$RadiusUtility {
  const RadiusUtility(super.builder);

  T elliptical(double x, double y) => builder(Radius.elliptical(x, y));

  T circular(double radius) => builder(Radius.circular(radius));

  T call(double radius) => builder(Radius.circular(radius));

  T ref(RadiusToken ref) => builder(ref());
}

@MixableScalarUtility()
final class RectUtility<T extends Attribute> extends ScalarUtility<T, Rect>
    with _$RectUtility {
  const RectUtility(super.builder);

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

final class PaintUtility<T extends Attribute> extends ScalarUtility<T, Paint> {
  const PaintUtility(super.builder);
}

final class LocaleUtility<T extends Attribute>
    extends ScalarUtility<T, Locale> {
  const LocaleUtility(super.builder);
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

/// A utility class for creating [Attribute] instances from [TextHeightBehavior] values.
///
/// This class extends [ScalarUtility] and provides a constructor to create instances
/// of this utility class.
final class TextHeightBehaviorUtility<T extends Attribute>
    extends ScalarUtility<T, TextHeightBehavior> {
  const TextHeightBehaviorUtility(super.builder);
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

final class FontFamilyUtility<T extends Attribute>
    extends ScalarUtility<T, String> {
  const FontFamilyUtility(super.builder);
}
