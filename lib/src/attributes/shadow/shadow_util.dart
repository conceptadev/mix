import 'package:flutter/material.dart';

import '../../core/extensions/values_ext.dart';
import '../color/color_dto.dart';
import '../color/color_util.dart';
import '../scalars/scalar_util.dart';
import 'shadow_dto.dart';

class ShadowUtility<T> extends MixUtility<T, ShadowDto> {
  static const selfBuilder = ShadowUtility(MixUtility.selfBuilder);
  const ShadowUtility(super.builder);

  T _only({ColorDto? color, Offset? offset, double? blurRadius}) {
    final shadow = ShadowDto(
      blurRadius: blurRadius,
      color: color,
      offset: offset,
    );

    return builder(shadow);
  }

  ColorUtility<T> get color {
    return ColorUtility((color) => _only(color: color));
  }

  OffsetUtility<T> get offset {
    return OffsetUtility((offset) => _only(offset: offset));
  }

  DoubleUtility<T> get blurRadius {
    return DoubleUtility((blurRadius) => _only(blurRadius: blurRadius));
  }

  T call({Color? color, Offset? offset, double? blurRadius}) {
    return _only(
      color: color?.toDto(),
      offset: offset,
      blurRadius: blurRadius,
    );
  }
}

class BoxShadowListUtility<T> extends MixUtility<T, List<BoxShadowDto>> {
  static const selfBuilder = BoxShadowListUtility(MixUtility.selfBuilder);
  const BoxShadowListUtility(super.builder);

  T call(List<BoxShadow> shadows) {
    return builder(shadows.map(BoxShadowDto.from).toList());
  }
}

class BoxShadowUtility<T> extends MixUtility<T, BoxShadowDto> {
  static const selfBuilder = BoxShadowUtility(MixUtility.selfBuilder);

  const BoxShadowUtility(super.builder);

  ColorUtility<T> get color {
    return ColorUtility((color) => call(color: color));
  }

  OffsetUtility<T> get offset {
    return OffsetUtility((offset) => call(offset: offset));
  }

  DoubleUtility<T> get blurRadius {
    return DoubleUtility((blurRadius) => call(blurRadius: blurRadius));
  }

  DoubleUtility<T> get spreadRadius {
    return DoubleUtility((spreadRadius) => call(spreadRadius: spreadRadius));
  }

  T call({
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

class ElevationUtility<T> extends MixUtility<T, List<BoxShadowDto>> {
  static const selfBuilder = ElevationUtility(MixUtility.selfBuilder);

  const ElevationUtility(super.builder);

  T call(int value) {
    assert(kElevationToShadow.containsKey(value), 'Invalid elevation value');

    return builder(kElevationToShadow[value]!.toDto());
  }

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
