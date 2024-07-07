import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../internal/compare_mixin.dart';
import '../../internal/iterable_ext.dart';
import 'color_token.dart';
import 'radius_token.dart';
import 'text_style_token.dart';

@immutable
abstract class MixToken<T> {
  final String name;
  const MixToken(this.name);

  static ColorToken color(String name) => ColorToken(name);

  static TextStyleToken textStyle(String name) => TextStyleToken(name);

  static RadiusToken radius(String name) => RadiusToken(name);

  T call();

  T resolve(BuildContext context);
  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    if (runtimeType != other.runtimeType) return false;

    return other is MixToken && other.name == name;
  }

  @override
  int get hashCode => Object.hash(name, runtimeType);
}

mixin TokenRef<T extends MixToken> {
  T get token;
}

mixin WithTokenResolver<V> {
  BuildContextResolver<V> get resolve;
}

typedef BuildContextResolver<T> = T Function(BuildContext context);

class StyledTokens<T extends MixToken<V>, V> with EqualityMixin {
  final Map<T, V> _map;

  const StyledTokens(this._map);

  //  empty
  const StyledTokens.empty() : this(const {});

  V? operator [](T token) => _map[token];

  // Looks for the token the value set within the MixToken
  // TODO: Needs to be optimized, but this is a temporary solution
  T? findByRef(V value) {
    return _map.keys.firstWhereOrNull((token) => token() == value);
  }

  StyledTokens<T, V> merge(StyledTokens<T, V> other) {
    final newMap = Map<T, V>.from(_map);

    newMap.addAll(other._map);

    return StyledTokens(newMap);
  }

  @override
  get props => [_map];
}
