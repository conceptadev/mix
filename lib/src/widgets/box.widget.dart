import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../mixer/mix_context_notifier.dart';
import '../mixer/mix_factory.dart';
import '../mixer/mixer.dart';
import 'mix.widget.dart';
import 'nothing.widget.dart';

class Box extends MixWidget {
  const Box({
    Mix? mix,
    Key? key,
    this.inherit = true,
    this.variant,
    this.child,
  }) : super(mix, key: key);

  final Widget? child;
  final Var? variant;
  final bool inherit;

  @override
  Widget build(BuildContext context) {
    MixContext mixed = MixContext.create(
      context,
      mix,
      inherit: inherit,
      customVariants: variantOrNull(variant),
    );

    return BoxMixedWidget(
      mixed,
      child: child,
    );
  }
}

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

    current = mixContext.applyWidgetDecorators(current);
    return current;
  }
}
