import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class MixToken<T> {
  const MixToken(this.valueGetter);

  final TokenValueGetter<T> valueGetter;
  T resolve(BuildContext context);
}

typedef TokenMap<T extends MixToken<V>, V> = Map<T, TokenValueGetter<V>>;

typedef TokenValueGetter<T> = T Function(BuildContext);

// class MixDesignTokens {
//   final TokenMap tokens;

//   const MixDesignTokens.raw(this.tokens);

//   static MixDesignTokens get defaults =>
//       MixDesignTokens.raw(materialThemeTokens);

//   TokenValueGetter<dynamic>? operator [](MixToken<dynamic> ref) => tokens[ref];

//   MixDesignTokens merge(MixDesignTokens? other) {
//     if (other == null || other == this) return this;

//     final mergedRefs = {...tokens, ...other.tokens};

//     return MixDesignTokens.raw(mergedRefs);
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is MixDesignTokens && other.tokens == tokens;
//   }

//   @override
//   int get hashCode => tokens.hashCode;

//   @override
//   String toString() => 'MixDesignTokens(tokens: $tokens)';
// }
