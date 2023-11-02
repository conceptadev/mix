import 'package:flutter/material.dart';

import '../../factory/mix_provider_data.dart';

class WidgetDecoratorWrapper extends StatelessWidget {
  const WidgetDecoratorWrapper(this.mix, {required this.child, super.key});

  final MixData mix;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Widget current = child;
    // TODO: review the use of key for re-render
    // if (mix.decorators.isNotEmpty) {
    //   for (final decorator in mix.decorators) {
    //     current = decorator.build(current, mix);
    //   }
    // }

    return current;
  }
}
