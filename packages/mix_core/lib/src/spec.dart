// Ported from package:mix `src/core/spec.dart`. `SpecTween` extends
// Flutter's `Tween` and stays platform-side; `Spec.lerp` itself is pure.

import 'package:meta/meta.dart';

import 'equatable.dart';

/// Base class for all resolved specifications that define styled-element
/// properties.
///
/// Specs are the final resolved form of styling attributes after applying
/// context-specific values and merging operations. Mixes in [Equatable] so
/// every Spec — generated or hand-written — carries value equality by
/// contract. Concrete subclasses either satisfy the Equatable interface via
/// the `_$XSpec` mixin emitted by `mix_generator` or by supplying `props`
/// directly.
@immutable
abstract class Spec<T extends Spec<T>> with Equatable {
  const Spec();

  Type get type => T;

  /// Creates a copy of this spec with the given fields
  /// replaced by the non-null parameter values.
  T copyWith();

  /// Linearly interpolates with another [Spec] object.
  T lerp(covariant T? other, double t);
}
