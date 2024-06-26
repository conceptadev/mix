// ignore_for_file: prefer_relative_imports, avoid-importing-entrypoint-exports

import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

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

  @override
  Shadow get defaultValue => const Shadow();
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

  @override
  BoxShadow get defaultValue => const BoxShadow();
}
