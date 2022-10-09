import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/shared/shared.props.dart';
import 'package:mix/src/mixer/mix_context_notifier.dart';
import 'package:mix/src/widgets/box/box.props.dart';

import '../../decorators/decorator_wrapper.widget.dart';
import '../empty.widget.dart';

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

    final props = BoxProps.fromContext(mixContext);

    final sharedProps = SharedProps.fromContext(mixContext);

    if (!sharedProps.visible) {
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

    if (sharedProps.animated) {
      current = AnimatedContainer(
        color: props.color,
        decoration: props.decoration,
        alignment: props.alignment,
        constraints: props.constraints,
        margin: props.margin,
        padding: props.padding,
        height: props.height,
        width: props.width,
        duration: sharedProps.animationDuration,
        curve: sharedProps.animationCurve,
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
