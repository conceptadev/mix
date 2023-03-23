import 'package:flutter/material.dart';

import '../../../attributes/common/common.props.dart';
import '../../../decorators/decorator_attribute.dart';

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
  Widget builder(BuildContext context, Widget child) {
    final commonProps = CommonProps.fromContext(context);

    if (commonProps.animated) {
      return AnimatedOpacity(
        key: key,
        duration: commonProps.animationDuration,
        curve: commonProps.animationCurve,
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
