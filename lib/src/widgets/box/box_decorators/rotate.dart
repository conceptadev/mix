import 'package:flutter/material.dart';

import '../box.decorator.dart';

/// ## Widget
/// - (All)
/// ## Utilities
/// - [RotateDecoratorUtility](RotateDecoratorUtility-class.html)
///
/// {@category Decorators}
class RotateDecorator extends BoxDecorator<RotateDecorator> {
  final int quarterTurns;
  const RotateDecorator({
    required this.quarterTurns,
    Key? key,
  }) : super(key: key);

  @override
  RotateDecorator merge(RotateDecorator other) {
    return RotateDecorator(
      quarterTurns: other.quarterTurns,
    );
  }

  @override
  Widget build(BuildContext context, Widget child) {
    return RotatedBox(
      key: key,
      quarterTurns: quarterTurns,
      child: child,
    );
  }
}
