import 'package:flutter/material.dart';
import 'package:mix/src/attributes/shared/shared.props.dart';
import 'package:mix/src/decorators/decorator_attributes.dart';
import 'package:mix/src/mixer/mix_context.dart';

/// ## Widget
/// - (All)
/// ## Utilities
/// - [OpacityDecoratorUtility](OpacityDecoratorUtility-class.html)
///
/// {@category Decorators}
class OpacityDecorator extends ParentDecoratorAttribute<OpacityDecorator> {
  final double opacity;
  const OpacityDecorator({
    required this.opacity,
  }) : super(const Key('OpacityDecorator'));

  @override
  OpacityDecorator merge(OpacityDecorator other) {
    return OpacityDecorator(opacity: other.opacity);
  }

  @override
  Widget render(MixContext mixContext, Widget child) {
    final sharedProps = SharedProps.fromContext(mixContext);

    if (sharedProps.animated) {
      return AnimatedOpacity(
        duration: sharedProps.animationDuration,
        curve: sharedProps.animationCurve,
        opacity: opacity,
        child: child,
      );
    } else {
      return Opacity(
        opacity: opacity,
        child: child,
      );
    }
  }
}
