// ignore_for_file: prefer_collection_literals

import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../attributes/attribute.dart';
import 'equality/compare_mixin.dart';
import 'extensions/iterable_ext.dart';

@immutable
class VisualAttributeMap with Comparable {
  final LinkedHashMap<Type, StyleAttribute>? _attributeMap;

  VisualAttributeMap._(this._attributeMap);

  factory VisualAttributeMap(List<StyleAttribute> attributes) {
    final attributeMap = LinkedHashMap<Type, StyleAttribute>();
    for (final attribute in attributes) {
      final type = attribute.runtimeType;
      if (attributeMap.containsKey(type)) {
        final attr = attributeMap[type];

        if (attr is Mergeable) {
          attributeMap[type] = (attr as Mergeable).merge(attr);
        }
      } else {
        attributeMap[type] = attribute;
      }
    }

    return VisualAttributeMap._(attributeMap);
  }

  @protected
  LinkedHashMap<Type, StyleAttribute> get map =>
      _attributeMap ?? LinkedHashMap<Type, StyleAttribute>();

  int get length => map.length;

  bool get isEmpty => map.isEmpty;

  bool get isNotEmpty => map.isNotEmpty;

  Iterable<StyleAttribute> get values => map.values;

  T? attributeOfType<T extends StyleAttribute>() =>
      map.values.whereType<T>().firstMaybeNull;

  Iterable<T> whereType<T extends StyleAttribute>() {
    return map.values.whereType<T>();
  }

  VisualAttributeMap merge(VisualAttributeMap other) {
    final list = [...values, ...other.values];

    return VisualAttributeMap(list);
  }

  @override
  List<Object> get props => [_attributeMap ?? {}];
}
