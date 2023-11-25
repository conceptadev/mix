import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../core/extensions/iterable_ext.dart';
import '../../helpers/compare_mixin.dart';
import 'color_token.dart';
import 'radius_token.dart';
import 'text_style_token.dart';

@immutable
abstract class MixToken<T> {
  final String name;
  final T value;

  const MixToken(this.name, this.value);

  static ColorToken color(String name, Color value) {
    return ColorToken(name, value);
  }

  static TextStyleToken textStyle(String name, TextStyle value) {
    return TextStyleToken(name, value);
  }

  static RadiusToken radius(String name, Radius value) {
    return RadiusToken(name, value);
  }

  T call() => value;

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    if (runtimeType != other.runtimeType) return false;

    return other is MixToken && other.name == name && other.value == value;
  }

  @override
  int get hashCode => Object.hash(name, value, runtimeType);
}

mixin ValueRef<T> {
  String get tokenName;
  TokenResolver<T> get resolve;
}

typedef TokenResolver<T> = T Function(BuildContext context);

typedef TokenMap<T extends MixToken<V>, V> = Map<T, TokenResolver<V>>;

class StyledTokens<T extends MixToken<V>, V> with Comparable {
  final Map<T, TokenResolver<V>> _map;

  const StyledTokens(this._map);

  //  empty
  const StyledTokens.empty() : this(const {});

  V call(T token, BuildContext context) {
    return _map[token]?.call(context) ?? token.value;
  }

  // Looks for the token the value set within the MixToken
  // TODO: Needs to be optimized, but this is a temporary solution
  T? findByValue(V value) {
    return _map.keys.firstWhereOrNull((token) => token.value == value);
  }

  @override
  get props => [_map];
}
