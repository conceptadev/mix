import 'package:flutter/material.dart';

import '../helpers/variants.dart';
import '../mixer/mix_context.dart';
import '../mixer/mix_factory.dart';
import 'decorator.widget.dart';
import 'mixable.widget.dart';
import 'nothing.widget.dart';

/// {@category Mixable Widgets}
class Box extends MixableWidget {
  const Box({
    Mix? mix,
    Key? key,
    this.inherit = true,
    this.variant,
    this.child,
  }) : super(mix, key: key);

  final Widget? child;
  final Variant? variant;
  final bool inherit;

  @override
  Widget build(BuildContext context) {
    return BoxMixedWidget(
      MixContext.create(
        context: context,
        mix: mix.withMaybeVariant(variant),
        inherit: inherit,
      ),
      child: child,
    );
  }
}

/// @nodoc
class BoxMixedWidget extends MixedWidget {
  // Child Widget
  final Widget? child;

  const BoxMixedWidget(
    MixContext mixed, {
    this.child,
    Key? key,
  }) : super(mixed, key: key);

  @override
  Widget build(BuildContext context) {
    var current = child;

    if (!sharedMixer.visible) {
      return const Empty();
    }
    // Apply notifier to children
    if (current != null) {
      current = MixContextNotifier(
        mixContext,
        child: current,
      );

      // Wrap child decorators
      if (childDecorators.isNotEmpty) {
        current = DecoratorWrapper(
          mixContext,
          child: current,
          decorators: childDecorators,
        );
      }
    }

    if (sharedMixer.animated) {
      current = AnimatedContainer(
        color: boxMixer.color,
        decoration: boxMixer.decoration,
        alignment: boxMixer.alignment,
        constraints: boxMixer.constraints,
        margin: boxMixer.margin,
        padding: boxMixer.padding,
        height: boxMixer.height,
        width: boxMixer.width,
        duration: sharedMixer.animationDuration,
        curve: sharedMixer.animationCurve,
        transform: boxMixer.transform,
        child: current,
      );
    } else {
      current = Container(
        color: boxMixer.color,
        decoration: boxMixer.decoration,
        alignment: boxMixer.alignment,
        constraints: boxMixer.constraints,
        margin: boxMixer.margin,
        padding: boxMixer.padding,
        height: boxMixer.height,
        width: boxMixer.width,
        transform: boxMixer.transform,
        child: current,
      );
    }

    // Wrap parent decorators
    if (parentDecorators.isNotEmpty) {
      current = DecoratorWrapper(
        mixContext,
        child: current,
        decorators: parentDecorators,
      );
    }

    return current;
  }
}
