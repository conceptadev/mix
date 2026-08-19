// Ported from package:mix `src/theme/tokens/mix_token.dart` (base type only).
//
// Resolution is abstract here: each platform decides how a token turns into
// a value for its context type. In Flutter (package:mix) that is
// `MixScope.tokenOf(this, context)`; a terminal package might look the token
// up in a theme carried by its own context object. The token *reference*
// mechanism (`call()` returning sentinel values such as `ColorRef`) is also
// platform-side, since sentinels implement platform value interfaces.

import 'package:meta/meta.dart';

/// A design token that resolves to a value against a context [C].
///
/// Identifies semantic values in your design system. Identity is
/// `runtimeType + name`, matching package:mix semantics.
@immutable
abstract class MixToken<C, T> {
  final String name;
  const MixToken(this.name);

  /// Resolves this token to a concrete value using [context].
  T resolve(C context);

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    if (runtimeType != other.runtimeType) return false;

    return other is MixToken && other.name == name;
  }

  @override
  String toString() => 'MixToken<$T>($name)';

  @override
  int get hashCode => Object.hash(name, T);
}
