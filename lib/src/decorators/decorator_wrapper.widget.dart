import 'package:flutter/material.dart';

import '../mixer/mix_context.dart';
import 'decorator_attribute.dart';

class ParentDecoratorWrapper extends DecoratorWrapper {
  const ParentDecoratorWrapper(
    MixContext mixContext, {
    Key? key,
    required Widget child,
  }) : super(
          mixContext,
          key: key,
          child: child,
          type: DecoratorType.parent,
        );
}

class ChildDecoratorWrapper extends DecoratorWrapper {
  const ChildDecoratorWrapper(
    MixContext mixContext, {
    Key? key,
    required Widget child,
  }) : super(
          mixContext,
          key: key,
          child: child,
          type: DecoratorType.child,
        );
}

abstract class DecoratorWrapper extends StatelessWidget {
  const DecoratorWrapper(
    this.mixContext, {
    Key? key,
    required this.child,
    required this.type,
  }) : super(key: key);

  final DecoratorType type;
  final Widget child;
  final MixContext mixContext;

  @override
  Widget build(BuildContext context) {
    List<DecoratorAttribute> decorators = mixContext;

    if (type == DecoratorType.parent) {
      decorators = mixContext.getDecorators();
    } else if (type == DecoratorType.child) {
      decorators = mixContext.values.decorators.children;
    } else {
      throw Exception('Decorator type not supported');
    }

    var current = child;

    if (decorators.isNotEmpty) {
      for (var decorator in decorators) {
        current = DecoratorAttributeWidget(
          decorator,
          key: decorator.key,
          mixContext: mixContext,
          child: current,
        );
      }
    }

    return current;
  }
}

class DecoratorAttributeWidget extends StatelessWidget {
  const DecoratorAttributeWidget(
    this.decorator, {
    Key? key,
    required this.child,
    required this.mixContext,
  }) : super(key: key);

  final DecoratorAttribute decorator;
  final Widget child;
  final MixContext mixContext;

  @override
  Widget build(BuildContext context) {
    return decorator.render(
      mixContext,
      child,
    );
  }
}
