import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mix/src/attributes/attribute.dart';
import 'package:mix/src/mixer/mix_context.dart';

enum DecoratorType {
  parent,
  child,
  separator,
}

typedef DecoratorsMapList = Map<DecoratorType, List<DecoratorAttribute>>;

extension DecoratorsMapListExtension on DecoratorsMapList {
  List<DecoratorAttribute> get parent => this[DecoratorType.parent] ?? [];
  List<DecoratorAttribute> get child => this[DecoratorType.child] ?? [];
  List<DecoratorAttribute> get separator => this[DecoratorType.separator] ?? [];
}

class MixDecoratorAttributes {
  final DecoratorsMapList values;

  const MixDecoratorAttributes(this.values);

  const MixDecoratorAttributes.empty()
      : values = const {
          DecoratorType.parent: [],
          DecoratorType.child: [],
          DecoratorType.separator: [],
        };

  factory MixDecoratorAttributes.fromList(List<DecoratorAttribute> decorators) {
    final mergedDecorators = <Type, DecoratorAttribute>{};

    for (final attribute in decorators) {
      final existing = mergedDecorators[attribute.runtimeType];
      if (existing != null) {
        mergedDecorators[attribute.runtimeType] = existing.merge(attribute);
      } else {
        mergedDecorators[attribute.runtimeType] = attribute;
      }
    }

    final DecoratorsMapList decoratorMap = {};

    mergedDecorators.forEach((_, decorator) {
      decoratorMap[decorator.type] ??= [];
      // Add to decorator map and sort to guarantee order consistency
      decoratorMap[decorator.type]!
        ..add(decorator)
        ..sort((a, b) => a.key.hashCode - b.key.hashCode);
    });

    return MixDecoratorAttributes(decoratorMap);
  }

  MixDecoratorAttributes clone() {
    return MixDecoratorAttributes(Map.from(values));
  }

  MixDecoratorAttributes merge(MixDecoratorAttributes? other) {
    if (other == null) {
      return this;
    }

    final thisList = values.entries.map((e) => e.value).expand((e) => e);

    final otherList = other.values.entries.map((e) => e.value).expand((e) => e);

    return MixDecoratorAttributes.fromList([...thisList, ...otherList]);
  }

  get children {
    return values[DecoratorType.child] ?? [];
  }

  get parents {
    return values[DecoratorType.parent] ?? [];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MixDecoratorAttributes && mapEquals(other.values, values);
  }

  @override
  int get hashCode => values.hashCode;
}

abstract class DecoratorAttribute<T> extends Attribute {
  const DecoratorAttribute(this.key);
  final Key key;
  DecoratorAttribute<T> merge(T other);

  DecoratorType get type;
  Widget render(MixContext mixContext, Widget child);
}

abstract class ParentDecoratorAttribute<T> extends DecoratorAttribute<T> {
  const ParentDecoratorAttribute(Key key) : super(key);
  @override
  DecoratorType get type => DecoratorType.parent;
}

abstract class ChildDecoratorAttribute<T> extends DecoratorAttribute<T> {
  const ChildDecoratorAttribute(Key key) : super(key);
  @override
  DecoratorType get type => DecoratorType.child;
}
