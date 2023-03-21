import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../mix.dart';
import '../mixer/mix_context.dart';

enum DecoratorLocation {
  boxParent,
  boxChild,
}

// typedef DecoratorsMapList = Map<DecoratorLocation, List<DecoratorAttribute>>;

class MixDecoratorAttributes {
  final Map<DecoratorLocation, Iterable<DecoratorAttribute>> values;

  const MixDecoratorAttributes(this.values);

  const MixDecoratorAttributes.empty()
      : values = const {
          DecoratorLocation.boxParent: [],
          DecoratorLocation.boxChild: [],
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

    final Map<DecoratorLocation, List<DecoratorAttribute>> decoratorMap = {};

    mergedDecorators.forEach(
      (_, decorator) {
        decoratorMap[decorator.type] ??= [];
        // Add to decorator map and sort to guarantee order consistency
        decoratorMap[decorator.type]!
          ..add(decorator)
          ..sort(
            (a, b) => a.key.hashCode - b.key.hashCode,
          );
      },
    );

    return MixDecoratorAttributes(decoratorMap);
  }

  MixDecoratorAttributes clone() {
    return MixDecoratorAttributes(Map.from(values));
  }

  MixDecoratorAttributes merge(MixDecoratorAttributes? other) {
    if (other == null) return this;

    return MixDecoratorAttributes.fromList(
      [...toAttributes(), ...other.toAttributes()],
    );
  }

  bool get isEmpty => values.isEmpty;

  bool get isNotEmpty => values.isNotEmpty;

  Iterable<DecoratorAttribute> toAttributes() {
    return values.values.expand((element) => element);
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
  const DecoratorAttribute({this.key});

  /// Key is required in order for proper sorting
  final Key? key;
  DecoratorAttribute<T> merge(T other);

  DecoratorLocation get type;
  Widget builder(MixContextData data, Widget child);

  Widget render(BuildContext context, Widget child) {
    final mixContext = MixContext.of(context);

    if (mixContext == null) {
      throw Exception(
        'DecoratorAttribute can only be rendered within a MixContext',
      );
    }

    return builder(mixContext, child);
  }
}

abstract class BoxParentDecoratorAttribute<T> extends DecoratorAttribute<T> {
  const BoxParentDecoratorAttribute({
    Key? key,
  }) : super(key: key);
  @override
  DecoratorLocation get type => DecoratorLocation.boxParent;
}

abstract class BoxChildDecoratorAttribute<T> extends DecoratorAttribute<T> {
  const BoxChildDecoratorAttribute({
    Key? key,
  }) : super(key: key);
  @override
  DecoratorLocation get type => DecoratorLocation.boxChild;
}
