// ignore_for_file: prefer_collection_literals

import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../attributes/variant_attribute.dart';
import '../core/attribute.dart';
import '../core/style_attribute.dart';
import '../factory/mix_provider_data.dart';
import 'compare_mixin.dart';

typedef KeySelector<T, Attr extends Attribute> = T Function(Attr element);

@immutable
class StylesMap extends MergeableMap<Type, StyleAttribute> {
  static const empty = StylesMap._(null);

  const StylesMap._(super.map);

  factory StylesMap.from(List<StyleAttribute> iterable) {
    final map = LinkedHashMap<Type, StyleAttribute>.fromIterable(
      iterable,
      key: (e) => e.runtimeType,
      value: (e) => e,
    );

    return StylesMap._(map);
  }

  Set<Spec> buildSpecs(MixData context) {
    final resolvedMap = Set<Spec>();

    for (final key in map.keys) {
      resolvedMap.add(map[key]!.resolve(context));
    }

    return resolvedMap;
  }

  @override
  StylesMap merge(StylesMap? other) {
    return StylesMap._(super.mergeMap(other?.map));
  }
}

@immutable
class VariantAttributeMap extends MergeableMap<Key, VariantAttribute> {
  static const empty = VariantAttributeMap._(null);
  const VariantAttributeMap._(super.map);

  factory VariantAttributeMap.from(List<VariantAttribute> iterable) {
    final map = LinkedHashMap<Key, VariantAttribute>.fromIterable(
      iterable,
      key: (e) => e.mergeKey,
      value: (e) => e,
    );

    return VariantAttributeMap._(map);
  }

  List<VariantAttribute> get namedVariants {
    return whereRuntimeType<VariantAttribute>().toList();
  }

  List<ContextVariantAttribute> get contextVariants {
    return whereType<ContextVariantAttribute>().toList();
  }

  @override
  VariantAttributeMap merge(VariantAttributeMap? other) {
    return VariantAttributeMap._(super.mergeMap(other?.map));
  }
}

@immutable
abstract class MergeableMap<K, T extends Attribute> with Comparable {
  final LinkedHashMap<K, T>? _map;
  const MergeableMap(this._map);

  @protected
  LinkedHashMap<K, T> get map => _map ?? LinkedHashMap<K, T>();

  int get length => map.length;

  bool get isEmpty => map.isEmpty;

  bool get isNotEmpty => map.isNotEmpty;

  Iterable<T> get values => map.values;

  Iterable<R> whereType<R extends T>() => map.values.whereType<R>();

  Iterable<R> whereRuntimeType<R extends T>() =>
      map.values.where((element) => element.runtimeType == R) as Iterable<R>;

  LinkedHashMap<K, T> mergeMap(LinkedHashMap<K, T>? otherMap) {
    if (otherMap == null) return map;

    final cloneMap = LinkedHashMap<K, T>.from(this.map);

    for (K key in cloneMap.keys) {
      if (cloneMap.containsKey(key)) {
        cloneMap[key] = cloneMap[key]!.merge(otherMap[key]!);
      } else {
        cloneMap[key] = otherMap[key]!;
      }
    }

    return cloneMap;
  }

  MergeableMap<K, T> merge(covariant MergeableMap<K, T>? other);

  @override
  List<Object> get props => [_map ?? {}];
}
