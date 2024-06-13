// ignore_for_file: prefer_relative_imports, avoid-importing-entrypoint-exports

import 'package:flutter/material.dart';
import 'package:mix/annotations.dart';

import '../../../mix.dart';

part 'shadow_dto.g.dart';

abstract base class ShadowDtoImpl<T extends Shadow> extends Dto<T> {
  final ColorDto? color;
  final Offset? offset;
  final double? blurRadius;

  const ShadowDtoImpl({this.blurRadius, this.color, this.offset});
}

/// Represents a [Dto] Data transfer object of [Shadow]
///
/// This is used to allow for resolvable value tokens, and also the correct
/// merge and combining behavior. It allows to be merged, and resolved to a [Shadow]

@MixableDto()
final class ShadowDto extends ShadowDtoImpl<Shadow> with _$ShadowDto {
  const ShadowDto({super.blurRadius, super.color, super.offset});
}

/// Represents a [Dto] Data transfer object of [BoxShadow]
///
/// This is used to allow for resolvable value tokens, and also the correct
/// merge and combining behavior. It allows to be merged, and resolved to a `[BoxShadow]
@MixableDto()
final class BoxShadowDto extends ShadowDtoImpl<BoxShadow> with _$BoxShadowDto {
  final double? spreadRadius;

  const BoxShadowDto({
    super.color,
    super.offset,
    super.blurRadius,
    this.spreadRadius,
  });
}

extension ListShadowExt on List<Shadow> {
  List<ShadowDto> toDto() {
    return map((e) => e.toDto()).toList();
  }
}

extension ListBoxShadowExt on List<BoxShadow> {
  List<BoxShadowDto> toDto() {
    return map((e) => e.toDto()).toList();
  }
}
