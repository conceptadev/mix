// ignore_for_file: prefer_collection_literals

import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../helpers/compare_mixin.dart';
import 'attribute.dart';

@immutable
class StyleAttributeMap<T extends StyleAttribute> with Comparable {
  final LinkedHashMap<Type, StyleAttribute>? _attributeMap;

  const StyleAttributeMap._(this._attributeMap);

  factory StyleAttributeMap(List<T> attributes) {
    final map = LinkedHashMap<Type, T>();
    for (final attribute in attributes) {
      final type = attribute.type;

      // If value cannot be merged just overwrite it
      if (attribute is! Mergeable) {
        map[type] = attribute;
        continue;
      }

      // If there is no saved attribute, just add it
      final savedAttribute = map[type] as Mergeable<T>?;
      if (savedAttribute == null) {
        map[type] = attribute;
      } else {
        // If there is a saved attribute, merge it with the new one
        map[type] = savedAttribute.merge(attribute);
      }
    }

    return StyleAttributeMap._(map);
  }

  @protected
  LinkedHashMap<Type, StyleAttribute> get map =>
      _attributeMap ?? LinkedHashMap<Type, StyleAttribute>();

  int get length => map.length;

  bool get isEmpty => map.isEmpty;

  bool get isNotEmpty => map.isNotEmpty;

  Iterable<StyleAttribute> get values => map.values;

  T? attributeOfType<T extends StyleAttribute>() => map[T] as T?;

  Iterable<T> whereType<T extends StyleAttribute>() =>
      map.values.whereType<T>();

  StyleAttributeMap merge(StyleAttributeMap other) {
    final list = [...values, ...other.values];

    return StyleAttributeMap(list);
  }

  @override
  List<Object> get props => [_attributeMap ?? {}];
}
