import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class DecoratorWrapper extends StatelessWidget {
  const DecoratorWrapper(
    this.mixContext, {
    Key? key,
    required this.child,
    required this.decorators,
  }) : super(key: key);

  final List<Decorator>? decorators;
  final Widget child;
  final MixContext mixContext;

  @override
  Widget build(BuildContext context) {
    var current = child;
    final _decorators = decorators ?? [];

    if (_decorators.isNotEmpty) {
      for (var decorator in _decorators) {
        current = _DecoratedWidget(
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

class _DecoratedWidget extends StatelessWidget {
  const _DecoratedWidget(
    this.decorator, {
    Key? key,
    required this.child,
    required this.mixContext,
  }) : super(key: key);

  final Decorator decorator;
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
