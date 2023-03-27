import 'package:flutter/material.dart';

import '../../../mix.dart';
import '../../decorators/decorator_wrapper.widget.dart';
import '../../mixer/mix_context_notifier.dart';
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
    final mixContext = createMixContext(context);

    return BoxMixedWidget(
      mixContext,
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

    final props = mixContext.boxProps;

    final sharedProps = mixContext.sharedProps;

    if (!sharedProps.visible) {
      return const Empty();
    }
    // Apply notifier to children
    if (current != null) {
      current = MixContextNotifier(
        mixContext,
        child: ChildDecoratorWrapper(
          mixContext,
          child: current,
        ),
      );
    }

    current = BoxAnimation(
      animated: sharedProps.animated,
      color: props.color,
      decoration: props.decoration,
      alignment: props.alignment,
      constraints: props.constraints,
      margin: props.margin,
      padding: props.padding,
      height: props.height,
      width: props.width,
      duration: sharedProps.animationDuration,
      // duration: lastAnimateDur ?? Duration.zero,
      curve: sharedProps.animationCurve,
      transform: props.transform,
      child: current,
    );

    // Wrap parent decorators

    current = ParentDecoratorWrapper(
      mixContext,
      child: current,
    );

    return current;
  }
}

class BoxAnimation extends StatefulWidget {
  final bool animated;
  final Color? color;
  final BoxDecoration? decoration;
  final AlignmentGeometry? alignment;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;
  final Duration? duration;
  final Curve? curve;
  final Matrix4? transform;
  final Widget? child;

  const BoxAnimation({
    Key? key,
    required this.animated,
    this.color,
    this.decoration,
    this.alignment,
    this.constraints,
    this.margin,
    this.padding,
    this.height,
    this.width,
    this.duration,
    this.curve,
    this.transform,
    this.child,
  }) : super(key: key);

  @override
  State<BoxAnimation> createState() => _BoxAnimationState();
}

class _BoxAnimationState extends State<BoxAnimation> {
  Duration? lastAnimateDur;

  @override
  Widget build(BuildContext context) {
    late Widget result;

    if (widget.animated || lastAnimateDur != null) {
      lastAnimateDur = widget.duration!;

      result = AnimatedContainer(
        color: widget.color,
        decoration: widget.decoration,
        alignment: widget.alignment,
        constraints: widget.constraints,
        margin: widget.margin,
        padding: widget.padding,
        height: widget.height,
        width: widget.width,
        duration: lastAnimateDur!,
        curve: widget.curve ?? Curves.linear,
        transform: widget.transform,
        child: widget.child,
      );
    } else {
      result = Container(
        color: widget.color,
        decoration: widget.decoration,
        alignment: widget.alignment,
        constraints: widget.constraints,
        margin: widget.margin,
        padding: widget.padding,
        height: widget.height,
        width: widget.width,
        transform: widget.transform,
        child: widget.child,
      );
    }

    if (!widget.animated) {
      lastAnimateDur = null;
    }

    return result;
  }
}
