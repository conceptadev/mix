import 'package:flutter/material.dart';

import '../factory/mix_provider_data.dart';
import 'decorator.dart';

class DecoratorWrapper extends StatelessWidget {
  const DecoratorWrapper(
    this.mix, {
    super.key,
    required this.child,
  });

  final MixData mix;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    var current = child;

    if (mix.decorators?.isNotEmpty == true) {
      for (var decorator in mix.decorators!) {
        current = _RenderDecoratorWidget(
          decorator,
          mix: mix,
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
    required this.mix,
    super.key,
    required this.child,
  });

  final Decorator decorator;
  final MixData mix;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return decorator.render(
      mix,
      child,
    );
  }
}
