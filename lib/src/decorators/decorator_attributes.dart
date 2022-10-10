import 'package:flutter/material.dart';
import 'package:mix/src/attributes/attribute.dart';
import 'package:mix/src/mixer/mix_context.dart';

enum DecoratorType {
  parent,
  child,
  separator,
}

typedef DecoratorsMapList = Map<DecoratorType, List<DecoratorAttribute>>;

class MixDecoratorAttributes {
  final DecoratorsMapList decorators;

  const MixDecoratorAttributes(this.decorators);

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

  get children {
    return decorators[DecoratorType.child] ?? [];
  }

  get parents {
    return decorators[DecoratorType.parent] ?? [];
  }
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
