import 'package:flutter/material.dart';

import '../../../attributes/common/common.props.dart';
import '../box.decorator.dart';

class OpacityDecorator extends BoxDecoratorAttribute<OpacityDecorator> {
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
  Widget build(BuildContext context, Widget child) {
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
