import 'dart:ui';

import '../attributes/color_attribute.dart';
import '../attributes/shadow_attribute.dart';
import '../core/extensions/values_ext.dart';
import 'scalar_util.dart';

class ShadowUtility<T> extends MixUtility<T, ShadowAttribute> {
  static const selfBuilder = ShadowUtility(MixUtility.selfBuilder);
  const ShadowUtility(super.builder);

  T _color(ColorAttribute color) => _only(color: color);
  T _offset(Offset offset) => _only(offset: offset);
  T _blurRadius(double blurRadius) => _only(blurRadius: blurRadius);

  T _only({ColorAttribute? color, Offset? offset, double? blurRadius}) {
    final shadow = ShadowAttribute(
      blurRadius: blurRadius,
      color: color,
      offset: offset,
    );

    return as(shadow);
  }

  ColorUtility<T> get color => ColorUtility(_color);
  OffsetUtility<T> get offset => OffsetUtility(_offset);
  DoubleUtility<T> get blurRadius => DoubleUtility(_blurRadius);

  T call({Color? color, Offset? offset, double? blurRadius}) {
    return _only(
      color: color?.toAttribute(),
      offset: offset,
      blurRadius: blurRadius,
    );
  }
}

class BoxShadowUtility<T> extends MixUtility<T, BoxShadowAttribute> {
  static const selfBuilder = BoxShadowUtility(MixUtility.selfBuilder);

  const BoxShadowUtility(super.builder);

  T _color(ColorAttribute color) => call(color: color);
  T _offset(Offset offset) => call(offset: offset);
  T _blurRadius(double blurRadius) => call(blurRadius: blurRadius);
  T _spreadRadius(double spreadRadius) => call(spreadRadius: spreadRadius);

  ColorUtility<T> get color => ColorUtility(_color);
  OffsetUtility<T> get offset => OffsetUtility(_offset);
  DoubleUtility<T> get blurRadius => DoubleUtility(_blurRadius);
  DoubleUtility<T> get spreadRadius => DoubleUtility(_spreadRadius);

  T call({
    ColorAttribute? color,
    Offset? offset,
    double? blurRadius,
    double? spreadRadius,
  }) {
    final shadow = BoxShadowAttribute(
      color: color,
      offset: offset,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
    );

    return as(shadow);
  }
}
