import 'package:flutter/material.dart';

import '../../attributes/shared/shared.descriptor.dart';
import '../../decorators/decorator_wrapper.widget.dart';
import '../empty/empty.widget.dart';
import '../mix.widget.dart';
import '../mix_context_builder.dart';
import 'box.descriptor.dart';

class Box extends MixWidget {
  const Box({
    super.mix,
    super.key,
    super.variants,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MixBuilder(
      mix: mix,
      variants: variants,
      builder: (context, mixContext) {
        final boxProps = BoxDescriptor.fromContext(context);
        final commonProps = CommonDescriptor.fromContext(context);

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

  final BoxDescriptor boxProps;
  final CommonDescriptor commonProps;

  @override
  Widget build(BuildContext context) {
    if (!commonProps.visible) {
      return const Empty();
    }
    var current = child;

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
    if (boxProps.decorators != null) {
      current = DecoratorWrapper(
        boxProps.decorators!,
        child: current,
      );
    }

    return current;
  }
}
