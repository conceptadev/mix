import 'package:flutter/material.dart';

import '../../attributes/common/common.props.dart';
import '../../decorators/decorator_wrapper.widget.dart';
import '../../mixer/mix_factory.dart';
import '../../variants/variant.dart';
import '../mix.widget.dart';
import '../mix_context_builder.dart';
import '../nothing.widget.dart';
import 'box.props.dart';

class Box extends MixWidget {
  const Box({
    MixFactory? mix,
    Key? key,
    bool? inherit,
    List<Variant>? variants,
    this.child,
  }) : super(
          mix,
          variants: variants,
          inherit: inherit,
          key: key,
        );

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MixContextBuilder(
      mix: mix,
      inherit: inherit,
      variants: variants,
      builder: (context, mixContext) {
        final boxProps = BoxProps.fromContext(context);
        final commonProps = CommonProps.fromContext(context);

        return BoxMixedWidget(
          boxProps: boxProps,
          commonProps: commonProps,
          child: child,
        );
      },
    );
  }
}

class BoxMixedWidget extends StatelessWidget {
  // Child Widget
  final Widget? child;

  const BoxMixedWidget({
    required this.boxProps,
    required this.commonProps,
    this.child,
    Key? key,
  }) : super(key: key);

  final BoxProps boxProps;
  final CommonProps commonProps;

  @override
  Widget build(BuildContext context) {
    if (!commonProps.visible) {
      return const Nothing();
    }
    var current = child;

    // Apply notifier to children
    if (current != null) {
      current = DecoratorWrapper(
        boxProps.childDecorators,
        child: current,
      );
    }

    if (commonProps.animated) {
      current = AnimatedContainer(
        color: boxProps.color,
        decoration: boxProps.decoration,
        alignment: boxProps.alignment,
        constraints: boxProps.constraints,
        margin: boxProps.margin,
        padding: boxProps.padding,
        height: boxProps.height,
        width: boxProps.width,
        duration: commonProps.animationDuration,
        curve: commonProps.animationCurve,
        transform: boxProps.transform,
        child: current,
      );
    } else {
      current = Container(
        color: boxProps.color,
        decoration: boxProps.decoration,
        alignment: boxProps.alignment,
        constraints: boxProps.constraints,
        margin: boxProps.margin,
        padding: boxProps.padding,
        height: boxProps.height,
        width: boxProps.width,
        transform: boxProps.transform,
        child: current,
      );
    }

    // Wrap parent decorators
    current = DecoratorWrapper(
      boxProps.parentDecorators,
      child: current,
    );

    return current;
  }
}
