// ignore_for_file: prefer_collection_literals

import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../core/attribute.dart';
import 'compare_mixin.dart';

@immutable
class VisualAttributeMap<Attr extends VisualAttribute> with Comparable {
  final LinkedHashMap<Type, Attr>? _attributeMap;

  VisualAttributeMap._(this._attributeMap);

  factory VisualAttributeMap(List<Attr> attributes) {
    final attributeMap = LinkedHashMap<Type, Attr>();
    for (final attribute in attributes) {
      final type = attribute.runtimeType;
      if (attributeMap.containsKey(type)) {
        attributeMap[type] = attributeMap[type]!.merge(attribute);
      } else {
        attributeMap[type] = attribute;
      }
    }

    return VisualAttributeMap._(attributeMap);
  }

  @protected
  LinkedHashMap<Type, Attr> get map =>
      _attributeMap ?? LinkedHashMap<Type, Attr>();

  int get length => map.length;

  bool get isEmpty => map.isEmpty;

  bool get isNotEmpty => map.isNotEmpty;

  Iterable<Attr> get values => map.values;

  T? attributeOfType<T extends VisualAttribute>() => map[T] as T?;

  Iterable<T> whereType<T extends VisualAttribute>() {
    return map.values.whereType<T>();
  }

  VisualAttributeMap<Attr> merge(VisualAttributeMap<Attr> other) {
    final list = [...values, ...other.values];

    return VisualAttributeMap(list);
  }

  @override
  List<Object> get props => [_attributeMap ?? {}];
}
