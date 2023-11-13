import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

@immutable
abstract class MixToken<T> {
  final String name;

  const MixToken(this.name);

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    if (runtimeType != other.runtimeType) return false;

    return other is MixToken<T> && other.name == name;
  }

  @override
  int get hashCode => Object.hash(name, runtimeType);
}

mixin TokenResolver<T> on MixToken<T> {
  T Function(BuildContext context) get tokenResolver;
  T resolve(BuildContext context) => tokenResolver(context);
}

mixin TokenValueReference<T> on MixToken<T> {
  T call();
}

typedef DesignTokenMap<T extends MixToken, V>
    = Map<T, V Function(BuildContext context)>;
