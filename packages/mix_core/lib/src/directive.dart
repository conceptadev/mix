// Ported from package:mix `src/core/directive.dart` (base class only).
//
// Concrete directives (color opacity, string case, ...) operate on
// platform value types and live in each platform package.

import 'package:meta/meta.dart';

/// Base class for directives that apply transformations to values.
///
/// Directives provide a way to transform values like colors or strings in a
/// consistent, composable manner throughout the Mix framework.
@immutable
abstract class Directive<T> {
  const Directive();

  /// The unique identifier for this directive type.
  String get key;

  /// Applies the transformation to the given value.
  T apply(T value);
}
