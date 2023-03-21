import 'package:flutter/material.dart';

import 'decorator_attribute.dart';

class DecoratorWrapper extends StatelessWidget {
  const DecoratorWrapper(
    this.decorators, {
    Key? key,
    required this.child,
  }) : super(key: key);

  final Iterable<DecoratorAttribute> decorators;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    var current = child;

    if (decorators.isNotEmpty) {
      for (var decorator in decorators) {
        current = _RenderDecoratorWidget(
          decorator,
          key: decorator.key,
          child: current,
        );
      }
    }

    return current;
  }
}

class _RenderDecoratorWidget extends StatelessWidget {
  const _RenderDecoratorWidget(
    this.decorator, {
    Key? key,
    required this.child,
  }) : super(key: key);

  final DecoratorAttribute decorator;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return decorator.render(
      context,
      child,
    );
  }
}
