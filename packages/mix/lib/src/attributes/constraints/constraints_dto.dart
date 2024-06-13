import 'package:flutter/rendering.dart';
import 'package:mix/annotations.dart';

// ignore: avoid-importing-entrypoint-exports
import '../../../mix.dart';

part 'constraints_dto.g.dart';

sealed class ConstraintsDto<T extends Constraints> extends Dto<T> {
  const ConstraintsDto();
}

/// Represents a Data transfer object of [BoxConstraints]
///
/// This is used to allow for resolvable value tokens, and also the correct
/// merge and combining behavior. It allows to be merged, and resolved to a `[BoxConstraints]
@MixableDto()
final class BoxConstraintsDto extends ConstraintsDto<BoxConstraints>
    with _$BoxConstraintsDto {
  final double? minWidth;
  final double? maxWidth;
  final double? minHeight;
  final double? maxHeight;

  const BoxConstraintsDto({
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
  });
}
