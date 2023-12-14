import 'package:flutter/material.dart';

import '../../core/styled_widget.dart';
import '../../decorators/widget_decorator_widget.dart';
import '../../factory/mix_provider.dart';
import '../../factory/mix_provider_data.dart';
import 'box_attribute.dart';
import 'box_spec.dart';

typedef StyledContainer = Box;
typedef StyledAnimatedContainer = AnimatedBox;

/// [Box] - A styled widget that applies a [Style] to its [child], similar to a [Container].
///
/// `Box` behaves similarly to Flutter's [Container] widget but offers enhanced styling capabilities
/// through its use of a `Style`. This widget extends [StyledWidget] and acts as a flexible
/// wrapper for applying a mix of styles and decorations to its [child]. Unlike `Container`,
/// `Box` is specifically designed to work with the styling system that utilizes `Style`,
/// allowing for more complex and varied style compositions.
///
/// One of the key features of `Box` is its ability to apply decorators, which are made possible
/// by its use of the [MixedBox] widget internally. This enables `Box` to go beyond the basic styling
/// functionalities of a `Container` by supporting advanced styling and decoration features
/// defined in the `Style`.
///
/// Parameters:
///   - [style]: The [Style] to be applied. Inherits from [StyledWidget] and enhances the
///     styling capabilities beyond what is offered by a standard [Container].
///   - [key]: The key for the widget. Inherits from [StyledWidget].
///   - [inherit]: Determines whether the [Box] should inherit styles from its
///     ancestors. Default is `false`. This attribute is part of the [StyledWidget] base class.
///   - [child]: The widget below this widget in the tree. The [child] is styled based on the
///     attributes defined in the provided [Style].
///
/// Example usage:
/// ```dart
/// Box(
///   style: Style( /* ...style attributes... */ ),
///   child: Text('Styled Box Widget')
/// )
/// ```
///
/// This example creates a `Box` widget with a custom `Style`, offering enhanced styling
/// and decoration capabilities compared to a standard [Container].
class Box extends StyledWidget {
  const Box({super.style, super.key, super.inherit, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return withMix(context, (mix) {
      return MixedBox(child: child);
    });
  }
}

/// [MixedBox] - A widget that applies a given [Style] to its [child].
///
/// This widget is primarily used by [Box] and [AnimatedBox] to render their children
/// with the styles specified in the `Style`. It acts as an intermediary widget
/// that resolves and applies the styling attributes from the provided `Style`
/// to the [child]. It also integrates with the decorator system, enabling the application
/// of various styling effects in a flexible manner.
///
/// The [MixedBox] handles the extraction of [BoxSpecAttribute] from the `Style`
/// and uses it to create a [BoxSpecWidget]. The decorators, if any, are applied
/// in the specified order, allowing for layered styling effects.
///
/// Parameters:
///   - [mix]: The `MixData` representing the current styling context. It contains
///     the resolved attributes from the `Style` that are to be applied to the [child].
///   - [key]: The key for the widget.
///   - [child]: The widget below this widget in the tree. It is the recipient of the
///     styles and decorations applied by this widget.
///   - [decoratorOrder]: Specifies the order in which decorators are applied to the widget.
///     This allows for fine-grained control over how multiple decorators interact
///     with each other.
///
/// Example usage:
/// ```dart
/// MixedBox(
///   mix: mixData,
///   child: Text('Styled with Mix'),
///   decoratorOrder: [ /* Decorator types in desired order */ ]
/// )
/// ```
///
/// This example shows how `MixedBox` is used to apply a `Style` to a text widget,
/// potentially with a series of decorators applied in a specific order.
class MixedBox extends StatelessWidget {
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
    final mix = this.mix ?? MixProvider.of(context);
    // Resolve the BoxSpecAttribute from the mix. If not found, use an empty BoxSpec.
    final spec = BoxSpec.of(mix);

    // The RenderWidgetDecorators widget is responsible for applying the decorators
    // to the child widget in the specified order.
    return RenderWidgetDecorators(
      mix: mix,
      // The Container widget is used here as a foundation for applying the styling.
      // Each property of the BoxSpec is mapped to the corresponding property of the Container,
      // allowing for a flexible and dynamic approach to styling.
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
