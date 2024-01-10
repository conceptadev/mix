import 'package:flutter/material.dart';

import '../../core/styled_widget.dart';
import '../../decorators/widget_decorator_widget.dart';
import '../../factory/mix_provider.dart';
import '../../factory/mix_provider_data.dart';
import 'box_attribute.dart';
import 'box_spec.dart';

typedef StyledContainer = Box;
typedef StyledAnimatedContainer = AnimatedBox;

/// A widget that applies styling from `StyledWidget` to a `MixedBox`.
///
/// `Box` extends `StyledWidget` and uses its styling capabilities to style a `MixedBox`.
/// This widget serves as a convenient way to apply consistent styles to its child widget
/// using the `MixData` obtained from `StyledWidget`.
class Box extends StyledWidget {
  /// Creates a `Box` widget.
  ///
  /// The [style], [key], and [inherit] parameters are passed to `StyledWidget`.
  /// The [child] is the widget to which the styling will be applied.
  const Box({super.style, super.key, super.inherit, this.child});

  /// The child widget that will receive the styles.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    // Apply styling from StyledWidget to a MixedBox.
    // This method uses `withMix` to get the `MixData` and then applies it to `MixedBox`,
    // effectively styling the [child].
    return withMix(context, (mix) {
      return MixedBox(child: child);
    });
  }
}

/// A widget that applies styling defined in `MixData` to a child widget.
///
/// `MixedBox` transforms styling rules from `MixData` into concrete properties on
/// a `Container`. It's used to dynamically style a child widget based on these rules.
class MixedBox extends StatelessWidget {
  /// Creates a `MixedBox` widget.
  ///
  /// The [mix] parameter holds styling rules. If null, styling is obtained from
  /// the closest `MixProvider`. The [child] is the widget to be styled. The optional
  /// [decoratorOrder] determines the order of style decorators on the child.
  const MixedBox({
    this.mix,
    super.key,
    this.child,
    this.decoratorOrder = const [],
  });

  final Widget? child;
  final MixData? mix;
  final List<Type> decoratorOrder;

  @override
  Widget build(BuildContext context) {
    // Get MixData from this widget or the nearest MixProvider.
    final mix = this.mix ?? MixProvider.of(context);

    // Retrieve styling properties from MixData. Use default properties if MixData is not provided.
    final spec = BoxSpec.of(mix);

    // Apply styles and decorators to the Container, which wraps the child widget.
    return RenderWidgetDecorators(
      mix: mix,
      orderOfDecorators: decoratorOrder,
      child: Container(
        alignment: spec.alignment,
        padding: spec.padding,
        decoration: spec.decoration,
        width: spec.width,
        height: spec.height,
        constraints: spec.constraints,
        margin: spec.margin,
        transform: spec.transform,
        clipBehavior: spec.clipBehavior ?? Clip.none,
        child: child,
      ),
    );
  }
}

/// [AnimatedBox] - An animated widget that applies a styled [Style] to its [child].
///
/// This widget extends [AnimatedStyledWidget], enabling it to animate the transition
/// of styles defined in a `Style`. It is particularly useful for creating visually
/// appealing dynamic effects in response to state changes or user interactions. The
/// `AnimatedBox` leverages the [AnimatedMixedBox] to apply the animated transition
/// to the styling properties defined in the `BoxSpec`.
///
/// The `AnimatedBox` is adept at handling complex styling scenarios where the visual
/// properties of a widget need to smoothly transition over a period of time, making
/// it ideal for modern, interactive UIs.
///
/// Parameters:
///   - [style]: The [Style] to be applied and animated. Inherits from [AnimatedStyledWidget].
///   - [key]: The key for the widget. Inherits from [AnimatedStyledWidget].
///   - [inherit]: Determines whether the [AnimatedBox] should inherit styles from its ancestors.
///     Inherits from [AnimatedStyledWidget] and defaults to `false`.
///   - [child]: The widget below this widget in the tree, which will be the recipient
///     of the animated styles.
///   - [curve]: The animation curve, inherited from [AnimatedStyledWidget], to use for transitions.
///   - [duration]: The duration over which to animate the specified style mix, required and
///     inherited from [AnimatedStyledWidget].
///
/// Example usage:
/// ```dart
/// AnimatedBox(
///   style: myStyle,
///   duration: Duration(seconds: 1),
///   curve: Curves.easeInOut,
///   child: Text('Animated Styled Box'),
/// )
/// ```
///
/// This example creates an `AnimatedBox` with a custom `Style` named `myStyle`.
/// The widget animates these styles over a duration of 1 second with an `easeInOut` curve,
/// providing a fluid and dynamic experience for the 'Animated Styled Box' text widget.
class AnimatedBox extends AnimatedStyledWidget {
  const AnimatedBox({
    super.style,
    super.key,
    super.inherit,
    this.child,
    super.curve,
    required super.duration,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    // The withMix method is used to apply the current styling context, retrieving
    // the BoxSpecAttribute from the given Style. If no BoxSpecAttribute is found,
    // a default, empty BoxSpec is used.
    return withMix(context, (mix) {
      // AnimatedMixedBox is responsible for applying the animated transition
      // to the BoxSpec properties, providing a seamless and dynamic styling experience.
      return AnimatedMixedBox(
        curve: curve,
        duration: duration,
        child: child,
      );
    });
  }
}

class AnimatedMixedBox extends StatelessWidget {
  const AnimatedMixedBox({
    this.mix,
    super.key,
    this.child,
    this.curve = Curves.linear,
    required this.duration,
  });

  final Widget? child;
  final Curve curve;
  final Duration duration;
  final MixData? mix;

  @override
  Widget build(BuildContext context) {
    final mix = this.mix ?? MixProvider.of(context);

    final spec = mix.attributeOf<BoxSpecAttribute>()?.resolve(mix) ??
        const BoxSpec.empty();

    // AnimatedContainer is utilized here to animate the transition of BoxSpec properties.
    // Each property from the BoxSpec is applied to the AnimatedContainer, allowing the
    // widget to animate changes smoothly over the specified duration and curve.
    return AnimatedContainer(
      alignment: spec.alignment,
      padding: spec.padding,
      decoration: spec.decoration,
      width: spec.width,
      height: spec.height,
      constraints: spec.constraints,
      margin: spec.margin,
      transform: spec.transform,
      clipBehavior: spec.clipBehavior ?? Clip.none,
      curve: curve,
      duration: duration,
      child: child,
    );
  }
}
