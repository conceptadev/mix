import 'package:flutter/material.dart';
import '../../../decorators/decorator_attribute.dart';
import '../../../mixer/mix_context.dart';

/// ## Widget
/// - (All)
/// ## Utilities
/// - [RotateDecoratorUtility](RotateDecoratorUtility-class.html)
///
/// {@category Decorators}
class RotateDecorator extends ParentDecoratorAttribute<RotateDecorator> {
  final int quarterTurns;
  const RotateDecorator({required this.quarterTurns})
      : super(const Key('RotateDecorator'));

  @override
  RotateDecorator merge(RotateDecorator other) {
    return RotateDecorator(
      quarterTurns: other.quarterTurns,
    );
  }

  @override
  Widget render(MixContext mixContext, Widget child) {
    return RotatedBox(
      quarterTurns: quarterTurns,
      child: child,
    );
  }
}
