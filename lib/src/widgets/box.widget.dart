import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/mixer/mix_context_notifier.dart';

import 'decorator.widget.dart';
import 'empty.widget.dart';

/// _Mix_ corollary to Flutter _Container_ widget
///
/// ## Attributes:
/// - [BoxAttributes](BoxAttributes-class.html)
/// - [SharedAttributes](SharedAttributes-class.html)
/// ## Utilities:
/// - [BoxUtility](BoxUtility-class.html)
/// - [SharedUtils](SharedUtils-class.html)
///
/// {@category Mixable Widgets}
class Box extends MixableWidget {
  const Box({
    Mix? mix,
    Key? key,
    bool inherit = false,
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
    return BoxMixedWidget(
      getMixContext(context),
      child: child,
    );
  }
}

/// @nodoc
class BoxMixedWidget extends MixedWidget {
  // Child Widget
  final Widget? child;

  const BoxMixedWidget(
    MixContext mixContext, {
    this.child,
    Key? key,
  }) : super(mixContext, key: key);

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

