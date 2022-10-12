import 'package:flutter/material.dart';
import 'decorator_attribute.dart';
import '../mixer/mix_context.dart';

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
    List<DecoratorAttribute> decorators;

    if (type == DecoratorType.parent) {
      decorators = mixContext.attributes.decorators.parents;
    } else if (type == DecoratorType.child) {
      decorators = mixContext.attributes.decorators.children;
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
