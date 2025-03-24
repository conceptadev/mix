// ignore_for_file: prefer_relative_imports,avoid-importing-entrypoint-exports
import 'package:flutter/rendering.dart';
import 'package:mix/mix.dart';
import 'package:mix_annotations/mix_annotations.dart';

part 'constraints_dto.g.dart';

sealed class ConstraintsMix<T extends Constraints> extends Mixable<T> {
  const ConstraintsMix();
}

/// Represents a Data transfer object of [BoxConstraints]
///
/// This is used to allow for resolvable value tokens, and also the correct
/// merge and combining behavior. It allows to be merged, and resolved to a `[BoxConstraints]
@MixableProperty()
final class BoxConstraintsMix extends ConstraintsMix<BoxConstraints>
    with _$BoxConstraintsMix {
  final double? minWidth;
  final double? maxWidth;
  final double? minHeight;
  final double? maxHeight;

  const BoxConstraintsMix({
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
  });
}
