// ignore_for_file: prefer_collection_literals

import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../helpers/compare_mixin.dart';
import 'attribute.dart';

class StyleAttributeMap<T extends StyleAttribute> with Comparable {
  final LinkedHashMap<Type, StyleAttribute>? _attributeMap;

  const StyleAttributeMap._(this._attributeMap);

  const StyleAttributeMap.empty() : _attributeMap = null;

  factory StyleAttributeMap(Iterable<T> attributes) {
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

  int get length => map.length;

  bool get isEmpty => map.isEmpty;

  bool get isNotEmpty => map.isNotEmpty;

  List<StyleAttribute> get values => map.values.toList();

  @protected
  LinkedHashMap<Type, StyleAttribute> get map =>
      _attributeMap ?? LinkedHashMap<Type, StyleAttribute>();

  bool contains(T attribute) => map.containsKey(attribute.type);

  Attr? attributeOfType<Attr extends StyleAttribute>() => map[Attr] as Attr?;

  Iterable<Attr> whereType<Attr extends StyleAttribute>() =>
      map.values.whereType<Attr>();

  StyleAttributeMap merge(StyleAttributeMap other) {
    final list = [...values, ...other.values];

    return StyleAttributeMap(list);
  }

  @override
  List<Object> get props => [_attributeMap ?? {}];
}
