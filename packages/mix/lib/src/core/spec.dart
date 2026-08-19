// The [Spec] base class lives in package:mix_core (pure Dart); [SpecTween]
// stays here because it extends Flutter's [Tween].

import 'package:flutter/widgets.dart';
import 'package:mix_core/mix_core.dart' show Spec;

// Re-export the Spec base and the equality helpers so generated `_$XSpec`
// mixins (which `part of` a file that imports `spec.dart`) can reach
// `propsEquals`, `propsHash`, and `propsDiff` without leaking the package
// entrypoint into `lib/src` (DCM rule `avoid-importing-entrypoint-exports`).
export 'package:mix_core/mix_core.dart'
    show Equatable, Spec, propsDiff, propsEquals, propsHash;

/// A [Tween] for interpolating between two [Spec] objects.
class SpecTween<T extends Spec<T>> extends Tween<T?> {
  SpecTween({super.begin, super.end});

  @override
  T? lerp(double t) {
    if (begin == null) return end;
    if (end == null) return begin;

    return begin?.lerp(end, t);
  }
}
