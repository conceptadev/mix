// ignore_for_file: prefer_collection_literals

import 'dart:collection';

import 'package:flutter/material.dart';

import '../attributes/variant_attribute.dart';
import '../helpers/compare_mixin.dart';
import 'attribute.dart';

class StyleAttributeMap with Comparable {
  final LinkedHashMap<Type, StyleAttribute>? _map;

  const StyleAttributeMap._(this._map);

  const StyleAttributeMap.empty() : _map = null;

  factory StyleAttributeMap(Iterable<StyleAttribute> attributes) {
    return StyleAttributeMap._(_mergeMap(attributes));
  }

  static LinkedHashMap<Type, Attr> _mergeMap<Attr extends StyleAttribute>(
    Iterable<Attr> attributes,
  ) {
    final map = LinkedHashMap<Type, Attr>();
    for (final attribute in attributes) {
      final type = attribute.type;

      // If value cannot be merged just overwrite it
      if (attribute is! Mergeable) {
        map[type] = attribute;
        continue;
      }

      // If there is no saved attribute, just add it
      final savedAttribute = map[type] as Mergeable<Attr>?;
      if (savedAttribute == null) {
        map[type] = attribute;
      } else {
        // If there is a saved attribute, merge it with the new one
        map[type] = savedAttribute.merge(attribute);
      }
    }

    return map;
  }

  int get length => _map?.length ?? 0;

  bool get isEmpty => _map?.isEmpty ?? true;

  bool get isNotEmpty => _map?.isNotEmpty ?? false;

  List<StyleAttribute> get values => _map?.values.toList() ?? [];

  bool contains(StyleAttribute attribute) =>
      _map?.containsKey(attribute.type) ?? false;

  Attr? attributeOfType<Attr extends StyleAttribute>() => _map?[Attr] as Attr?;

  Iterable<Attr> whereType<Attr extends StyleAttribute>() =>
      _map?.values.whereType<Attr>() ?? [];

  StyleAttributeMap merge(StyleAttributeMap other) {
    return StyleAttributeMap([...values, ...other.values]);
  }

  @override
  List<Object> get props => [_map ?? {}];
}

class VariantAttributeMap with Comparable {
  final LinkedHashMap<Key, VariantAttribute>? _map;

  const VariantAttributeMap._(this._map);

  const VariantAttributeMap.empty() : _map = null;

  factory VariantAttributeMap(Iterable<VariantAttribute> attributes) {
    return VariantAttributeMap._(_mergeMap(attributes));
  }

  static LinkedHashMap<Key, Attr> _mergeMap<Attr extends VariantAttribute>(
    Iterable<Attr> attributes,
  ) {
    final map = LinkedHashMap<Key, Attr>();
    for (final attribute in attributes) {
      final type = attribute.mergeKey;

      // If there is no saved attribute, just add it
      final savedAttribute = map[type] as Mergeable<Attr>?;
      if (savedAttribute == null) {
        map[type] = attribute;
      } else {
        // If there is a saved attribute, merge it with the new one
        map[type] = savedAttribute.merge(attribute);
      }
    }

    return map;
  }

  int get length => _map?.length ?? 0;

  bool get isEmpty => _map?.isEmpty ?? true;

  bool get isNotEmpty => _map?.isNotEmpty ?? false;

  List<VariantAttribute> get values => _map?.values.toList() ?? [];

  Iterable<Attr> whereType<Attr extends VariantAttribute>() =>
      _map?.values.whereType<Attr>() ?? [];

  bool contains(VariantAttribute attribute) =>
      _map?.containsKey(attribute.mergeKey) ?? false;

  VariantAttributeMap merge(VariantAttributeMap other) {
    return VariantAttributeMap([...values, ...other.values]);
  }

  @override
  List<Object> get props => [_map ?? {}];
}
