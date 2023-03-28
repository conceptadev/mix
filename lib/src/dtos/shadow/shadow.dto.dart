import 'package:flutter/material.dart';

import '../../attributes/attribute.dart';
import '../../helpers/mergeable_list.dart';
import '../color.dto.dart';
import '../dto.dart';

class ShadowDto<T extends Shadow> extends Dto<T>
    with MergeableMixin<ShadowDto> {
  final ColorDto? color;
  final Offset? offset;
  final double? blurRadius;

  const ShadowDto({
    this.color,
    this.offset,
    this.blurRadius,
  });

  final Shadow _default = const Shadow();

  factory ShadowDto.from(Shadow shadow) {
    return ShadowDto(
      blurRadius: shadow.blurRadius,
      color: ColorDto.maybeFrom(shadow.color),
      offset: shadow.offset,
    );
  }

  static maybeFrom(Shadow? shadow) {
    if (shadow == null) {
      return null;
    }

    return ShadowDto.from(shadow);
  }

  @override
  T resolve(BuildContext context) {
    return Shadow(
      color: color?.resolve(context) ?? _default.color,
      offset: offset ?? _default.offset,
      blurRadius: blurRadius ?? _default.blurRadius,
    ) as T;
  }

  ShadowDto copyWith({
    ColorDto? color,
    Offset? offset,
    double? blurRadius,
  }) {
    return ShadowDto(
      color: color ?? this.color,
      offset: offset ?? this.offset,
      blurRadius: blurRadius ?? this.blurRadius,
    );
  }

  @override
  ShadowDto merge(covariant ShadowDto? other) {
    return copyWith(
      color: other?.color,
      offset: other?.offset,
      blurRadius: other?.blurRadius,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShadowDto &&
        other.color == color &&
        other.offset == offset &&
        other.blurRadius == blurRadius;
  }

  @override
  int get hashCode {
    return color.hashCode ^ offset.hashCode ^ blurRadius.hashCode;
  }

  @override
  String toString() {
    return 'ShadowDto(color: $color, offset: $offset, blurRadius: $blurRadius)';
  }
}

extension ShadowDtoExt on List<ShadowDto> {
  List<Shadow> resolve(BuildContext context) {
    return map((e) => e.resolve(context)).toList();
  }

  List<ShadowDto> merge(List<ShadowDto>? other) {
    return combineMergeableLists(this, other);
  }
}
