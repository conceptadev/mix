import 'package:flutter/material.dart';

import '../../../attributes/shared/shared.props.dart';
import '../../../decorators/decorator_attribute.dart';
import '../../../mixer/mix_context.dart';

/// ## Widget
/// - (All)
/// ## Utilities
/// - [OpacityDecoratorUtility](OpacityDecoratorUtility-class.html)
///
/// {@category Decorators}
class OpacityDecorator extends BoxParentDecoratorAttribute<OpacityDecorator> {
  final double opacity;
  const OpacityDecorator({
    required this.opacity,
    Key? key,
  }) : super(key: key);

  @override
  OpacityDecorator merge(OpacityDecorator other) {
    return OpacityDecorator(opacity: other.opacity);
  }

  @override
  Widget render(MixContext mixContext, Widget child) {
    final sharedProps = SharedProps.fromContext(mixContext);

    if (sharedProps.animated) {
      return AnimatedOpacity(
        key: key,
        duration: sharedProps.animationDuration,
        curve: sharedProps.animationCurve,
        opacity: opacity,
        child: child,
      );
    } else {
      return Opacity(
        key: key,
        opacity: opacity,
        child: child,
      );
    }
  }
}
