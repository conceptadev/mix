import 'package:flutter/material.dart';

import '../../core/attribute.dart';
import '../../core/extensions/values_ext.dart';
import '../color/color_dto.dart';
import '../color/color_util.dart';
import '../scalars/scalar_util.dart';
import 'shadow_dto.dart';

class ShadowUtility<T extends StyleAttribute>
    extends DtoUtility<T, ShadowDto, Shadow> {
  late final color = ColorUtility<T>((v) => only(color: v));

  late final offset = OffsetUtility<T>((v) => only(offset: v));

  ShadowUtility(super.builder) : super(valueToDto: ShadowDto.from);

  T blurRadius(double v) => only(blurRadius: v);

  T call({Color? color, Offset? offset, double? blurRadius}) {
    return only(
      color: ColorDto.maybeFrom(color),
      offset: offset,
      blurRadius: blurRadius,
    );
  }

  @override
  T only({ColorDto? color, Offset? offset, double? blurRadius}) {
    return builder(
      ShadowDto(blurRadius: blurRadius, color: color, offset: offset),
    );
  }
}

class ShadowListUtility<T extends StyleAttribute>
    extends MixUtility<T, List<ShadowDto>> {
  const ShadowListUtility(super.builder);

  T call(List<BoxShadow> shadows) {
    return builder(shadows.map(ShadowDto.from).toList());
  }
}

class BoxShadowListUtility<T extends StyleAttribute>
    extends MixUtility<T, List<BoxShadowDto>> {
  const BoxShadowListUtility(super.builder);

  T call(List<BoxShadow> shadows) {
    return builder(shadows.map(BoxShadowDto.from).toList());
  }
}

class BoxShadowUtility<T extends StyleAttribute>
    extends DtoUtility<T, BoxShadowDto, BoxShadow> {
  late final color = ColorUtility<T>((v) => only(color: v));

  late final offset = OffsetUtility<T>((v) => call(offset: v));

  late final blurRadius = DoubleUtility<T>((v) => call(blurRadius: v));

  late final spreadRadius = DoubleUtility<T>((v) => call(spreadRadius: v));

  BoxShadowUtility(super.builder) : super(valueToDto: BoxShadowDto.from);

  T call({
    Color? color,
    Offset? offset,
    double? blurRadius,
    double? spreadRadius,
  }) {
    return only(
      color: ColorDto.maybeFrom(color),
      offset: offset,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
    );
  }

  @override
  T only({
    ColorDto? color,
    Offset? offset,
    double? blurRadius,
    double? spreadRadius,
  }) {
    final shadow = BoxShadowDto(
      color: color,
      offset: offset,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
    );

    return builder(shadow);
  }
}

class ElevationUtility<T extends StyleAttribute>
    extends MixUtility<T, List<BoxShadowDto>> {
  const ElevationUtility(super.builder);

  T call(int value) {
    assert(kElevationToShadow.containsKey(value), 'Invalid elevation value');

    return builder(kElevationToShadow[value]!.toDto());
  }

  // Convenience methods for common elevation values.
  T none() => call(0);
  T one() => call(1);
  T two() => call(2);
  T three() => call(3);
  T four() => call(4);
  T six() => call(6);
  T eight() => call(8);
  T nine() => call(9);
  T twelve() => call(12);
  T sixteen() => call(16);
  T twentyFour() => call(24);
}
