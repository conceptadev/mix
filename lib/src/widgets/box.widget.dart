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
    this.child,
  }) : super(mix, key: key);

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return BoxMixerWidget(
      mix.createContext(context),
      child: child,
    );
  }
}

class BoxMixerWidget extends MixerWidget {
  // Child Widget
  final Widget? child;

  const BoxMixerWidget(
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
        child: current,
        duration: sharedMixer.animationDuration,
        curve: sharedMixer.animationCurve,
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
        child: current,
      );
    }

    current = mixContext.applyWidgetDecorators(current);
    return current;
  }
}
