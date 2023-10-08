import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';
import 'decorator.dart';

class WidgetDecoratorWrapper extends StatelessWidget {
  const WidgetDecoratorWrapper(this.mix, {required this.child, super.key});

  final MixData mix;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    var current = child;

    if (mix.decorators.isNotEmpty) {
      for (final decorator in mix.decorators) {
        current = _RenderDecoratorWidget(
          decorator,
          key: decorator.mergeKey,
          mix: mix,
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
    required this.child,
    super.key,
    required this.mix,
  });

  final Decorator decorator;
  final MixData mix;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return decorator.render(child, mix);
  }
}
