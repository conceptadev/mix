import 'package:flutter/material.dart';
import 'package:mix/src/decorators/decorator_attribute.dart';
import 'package:mix/src/mixer/mix_context.dart';

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
