// ignore_for_file: unused_element, prefer_relative_imports, avoid-importing-entrypoint-exports

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'scalar_util.g.dart';

@MixableClassUtility(type: Alignment)
final class AlignmentUtility<T extends Attribute>
    extends MixUtility<T, AlignmentGeometry> with _$AlignmentUtility {
  const AlignmentUtility(super.builder);

  /// Creates an [Attribute] instance with a custom [Alignment] or [AlignmentDirectional] value.
  ///
  /// If [start] is provided, an [AlignmentDirectional] is created. Otherwise, an [Alignment] is created.
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

@MixableClassUtility()
final class AlignmentDirectionalUtility<T extends Attribute>
    extends MixUtility<T, AlignmentDirectional>
    with _$AlignmentDirectionalUtility {
  const AlignmentDirectionalUtility(super.builder);
  T only({double? y, double? start}) {
    return builder(AlignmentDirectional(start ?? 0, y ?? 0));
  }
}

@MixableClassUtility()
final class FontFeatureUtility<T extends Attribute>
    extends MixUtility<T, FontFeature> with _$FontFeatureUtility {
  const FontFeatureUtility(super.builder);
}

@MixableClassUtility()
final class DurationUtility<T extends Attribute> extends MixUtility<T, Duration>
    with _$DurationUtility {
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

@MixableClassUtility()
final class FontWeightUtility<T extends Attribute>
    extends MixUtility<T, FontWeight> with _$FontWeightUtility {
  const FontWeightUtility(super.builder);
}

@MixableClassUtility()
final class TextDecorationUtility<T extends Attribute>
    extends MixUtility<T, TextDecoration> with _$TextDecorationUtility {
  const TextDecorationUtility(super.builder);
}

@MixableClassUtility(type: Curves)
final class CurveUtility<T extends Attribute> extends MixUtility<T, Curve>
    with _$CurveUtility {
  const CurveUtility(super.builder);

  T as(Curve curve) => builder(curve);

  T spring({
    Duration duration = const Duration(milliseconds: 500),
    double bounce = 0.5,
  }) =>
      builder(SpringCurve(duration: duration, bounce: bounce));
}

@MixableClassUtility(generateCallMethod: false)
final class OffsetUtility<T extends Attribute> extends MixUtility<T, Offset>
    with _$OffsetUtility {
  const OffsetUtility(super.builder);

  T as(Offset offset) => builder(offset);
}

@MixableClassUtility(generateCallMethod: false)
final class RadiusUtility<T extends Attribute> extends MixUtility<T, Radius>
    with _$RadiusUtility {
  const RadiusUtility(super.builder);

  T call(double radius) => builder(Radius.circular(radius));

  T ref(RadiusToken ref) => builder(ref());
}

@MixableClassUtility()
final class RectUtility<T extends Attribute> extends MixUtility<T, Rect>
    with _$RectUtility {
  const RectUtility(super.builder);
}

final class PaintUtility<T extends Attribute> extends ScalarUtility<T, Paint> {
  const PaintUtility(super.builder);
}

final class LocaleUtility<T extends Attribute>
    extends ScalarUtility<T, Locale> {
  const LocaleUtility(super.builder);
}

@MixableClassUtility()
final class ImageProviderUtility<T extends Attribute>
    extends MixUtility<T, ImageProvider> with _$ImageProviderUtility {
  const ImageProviderUtility(super.builder);

  /// Creates an [Attribute] instance with [ImageProvider.network].
  /// @param url The URL of the image.
  T network(String url) => builder(NetworkImage(url));
  T file(File file) => builder(FileImage(file));
  T asset(String asset) => builder(AssetImage(asset));
  T memory(Uint8List bytes) => builder(MemoryImage(bytes));
}

@MixableClassUtility()
final class TextHeightBehaviorUtility<T extends Attribute>
    extends MixUtility<T, TextHeightBehavior> with _$TextHeightBehaviorUtility {
  const TextHeightBehaviorUtility(super.builder);
}

@MixableClassUtility()
final class GradientTransformUtility<T extends Attribute>
    extends MixUtility<T, GradientTransform> with _$GradientTransformUtility {
  const GradientTransformUtility(super.builder);

  /// Creates an [Attribute] instance with a [GradientRotation] value.
  T rotate(double radians) => builder(GradientRotation(radians));
}

@MixableClassUtility()
final class Matrix4Utility<T extends Attribute> extends MixUtility<T, Matrix4>
    with _$Matrix4Utility {
  const Matrix4Utility(super.builder);
}

@MixableClassUtility()
final class FontFamilyUtility<T extends Attribute> extends MixUtility<T, String>
    with _$FontFamilyUtility {
  const FontFamilyUtility(super.builder);
}

@MixableClassUtility()
final class TextScalerUtility<T extends Attribute>
    extends MixUtility<T, TextScaler> with _$TextScalerUtility {
  const TextScalerUtility(super.builder);
}

@MixableClassUtility()
final class TableColumnWidthUtility<T extends Attribute>
    extends MixUtility<T, TableColumnWidth> with _$TableColumnWidthUtility {
  const TableColumnWidthUtility(super.builder);
}

@MixableClassUtility()
class TableBorderUtility<T extends Attribute> extends MixUtility<T, TableBorder>
    with _$TableBorderUtility<T> {
  const TableBorderUtility(super.builder);
}
