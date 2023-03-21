import 'package:flutter/material.dart';

import '../../decorators/decorator_wrapper.widget.dart';
import '../../mixer/mix_factory.dart';
import '../../variants/variant.dart';
import '../mix.widget.dart';
import '../mix_context_builder.dart';
import '../nothing.widget.dart';
import 'box.props.dart';

class Box extends MixWidget {
  const Box({
    Mix? mix,
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
        final props = BoxProps.fromContext(mixContext);

        return BoxMixedWidget(
          props,
          child: child,
        );
      },
    );
  }
}

class BoxMixedWidget extends StatelessWidget {
  // Child Widget
  final Widget? child;

  const BoxMixedWidget(
    this.props, {
    this.child,
    Key? key,
  }) : super(key: key);

  final BoxProps props;

  @override
  Widget build(BuildContext context) {
    if (!props.visible) {
      return const Nothing();
    }
    var current = child;

    // Apply notifier to children
    if (current != null) {
      current = DecoratorWrapper(
        props.childDecorators,
        child: current,
      );
    }

    if (props.animated) {
      current = AnimatedContainer(
        color: props.color,
        decoration: props.decoration,
        alignment: props.alignment,
        constraints: props.constraints,
        margin: props.margin,
        padding: props.padding,
        height: props.height,
        width: props.width,
        duration: props.animationDuration,
        curve: props.animationCurve,
        transform: props.transform,
        child: current,
      );
    } else {
      current = Container(
        color: props.color,
        decoration: props.decoration,
        alignment: props.alignment,
        constraints: props.constraints,
        margin: props.margin,
        padding: props.padding,
        height: props.height,
        width: props.width,
        transform: props.transform,
        child: current,
      );
    }

    // Wrap parent decorators
    current = current = DecoratorWrapper(
      props.parentDecorators,
      child: current,
    );

    return current;
  }
}
