import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/mixer/mix_context.dart';

/// ## Widget
/// - (All)
/// ## Utilities
/// - [RotateDecoratorUtility](RotateDecoratorUtility-class.html)
///
/// {@category Decorators}
class RotateDecorator extends ParentDecorator<RotateDecorator> {
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
