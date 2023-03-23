import 'package:flutter/material.dart';

import '../../../decorators/decorator_attribute.dart';

/// ## Widget
/// - (All)
/// ## Utilities
/// - [RotateDecoratorUtility](RotateDecoratorUtility-class.html)
///
/// {@category Decorators}
class RotateDecorator extends BoxParentDecoratorAttribute<RotateDecorator> {
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
  Widget builder(BuildContext context, Widget child) {
    return RotatedBox(
      key: key,
      quarterTurns: quarterTurns,
      child: child,
    );
  }
}
