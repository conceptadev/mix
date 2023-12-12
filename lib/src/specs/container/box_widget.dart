import 'package:flutter/material.dart';

import '../../core/styled_widget.dart';
import '../../decorators/widget_decorator_widget.dart';
import '../../factory/mix_provider_data.dart';
import 'box_attribute.dart';
import 'box_spec.dart';

typedef StyledContainer = Box;
typedef StyledAnimatedContainer = AnimatedBox;

/// [Box] - A styled widget that applies a [StyleMix] to its [child], similar to a [Container].
///
/// `Box` behaves similarly to Flutter's [Container] widget but offers enhanced styling capabilities
/// through its use of a `StyleMix`. This widget extends [StyledWidget] and acts as a flexible
/// wrapper for applying a mix of styles and decorations to its [child]. Unlike `Container`,
/// `Box` is specifically designed to work with the styling system that utilizes `StyleMix`,
/// allowing for more complex and varied style compositions.
///
/// One of the key features of `Box` is its ability to apply decorators, which are made possible
/// by its use of the [MixedBox] widget internally. This enables `Box` to go beyond the basic styling
/// functionalities of a `Container` by supporting advanced styling and decoration features
/// defined in the `StyleMix`.
///
/// Parameters:
///   - [style]: The [StyleMix] to be applied. Inherits from [StyledWidget] and enhances the
///     styling capabilities beyond what is offered by a standard [Container].
///   - [key]: The key for the widget. Inherits from [StyledWidget].
///   - [inherit]: Determines whether the [Box] should inherit styles from its
///     ancestors. Default is `false`. This attribute is part of the [StyledWidget] base class.
///   - [child]: The widget below this widget in the tree. The [child] is styled based on the
///     attributes defined in the provided [StyleMix].
///
/// Example usage:
/// ```dart
/// Box(
///   style: StyleMix( /* ...style attributes... */ ),
///   child: Text('Styled Box Widget')
/// )
/// ```
///
/// This example creates a `Box` widget with a custom `StyleMix`, offering enhanced styling
/// and decoration capabilities compared to a standard [Container].
class Box extends StyledWidget {
  const Box({super.style, super.key, super.inherit, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return withMix(context, (mix) {
      return MixedBox(mix: mix, child: child);
    });
  }
}

/// [AnimatedBox] - An animated widget that applies a styled [StyleMix] to its [child].
///
/// This widget extends [AnimatedStyledWidget], enabling it to animate the transition
/// of styles defined in a `StyleMix`. It is particularly useful for creating visually
/// appealing dynamic effects in response to state changes or user interactions. The
/// `AnimatedBox` leverages the [AnimatedBoxSpecWidget] to apply the animated transition
/// to the styling properties defined in the `BoxSpec`.
///
/// The `AnimatedBox` is adept at handling complex styling scenarios where the visual
/// properties of a widget need to smoothly transition over a period of time, making
/// it ideal for modern, interactive UIs.
///
/// Parameters:
///   - [style]: The [StyleMix] to be applied and animated. Inherits from [AnimatedStyledWidget].
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
///   style: myStyleMix,
///   duration: Duration(seconds: 1),
///   curve: Curves.easeInOut,
///   child: Text('Animated Styled Box'),
/// )
/// ```
///
/// This example creates an `AnimatedBox` with a custom `StyleMix` named `myStyleMix`.
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
    // the BoxSpecAttribute from the given StyleMix. If no BoxSpecAttribute is found,
    // a default, empty BoxSpec is used.
    return withMix(context, (mix) {
      final spec = mix.attributeOf<BoxSpecAttribute>()?.resolve(mix) ??
          const BoxSpec.empty();

      // AnimatedBoxSpecWidget is responsible for applying the animated transition
      // to the BoxSpec properties, providing a seamless and dynamic styling experience.
      return AnimatedBoxSpecWidget(
        spec: spec,
        curve: curve,
        duration: duration,
        child: child,
      );
    });
  }
}

/// [MixedBox] - A widget that applies a given [StyleMix] to its [child].
///
/// This widget is primarily used by [Box] and [AnimatedBox] to render their children
/// with the styles specified in the `StyleMix`. It acts as an intermediary widget
/// that resolves and applies the styling attributes from the provided `StyleMix`
/// to the [child]. It also integrates with the decorator system, enabling the application
/// of various styling effects in a flexible manner.
///
/// The [MixedBox] handles the extraction of [BoxSpecAttribute] from the `StyleMix`
/// and uses it to create a [BoxSpecWidget]. The decorators, if any, are applied
/// in the specified order, allowing for layered styling effects.
///
/// Parameters:
///   - [mix]: The `MixData` representing the current styling context. It contains
///     the resolved attributes from the `StyleMix` that are to be applied to the [child].
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
/// This example shows how `MixedBox` is used to apply a `StyleMix` to a text widget,
/// potentially with a series of decorators applied in a specific order.
class MixedBox extends StatelessWidget {
  const MixedBox({
    required this.mix,
    super.key,
    this.child,
    this.decoratorOrder = const [],
  });

  final Widget? child;
  final MixData mix;
  final List<Type> decoratorOrder;

  @override
  Widget build(BuildContext context) {
    // Resolve the BoxSpecAttribute from the mix. If not found, use an empty BoxSpec.
    final spec = mix.attributeOf<BoxSpecAttribute>()?.resolve(mix) ??
        const BoxSpec.empty();

    // The RenderWidgetDecorators widget is responsible for applying the decorators
    // to the child widget in the specified order.
    return RenderWidgetDecorators(
      mix: mix,
      child: BoxSpecWidget(spec: spec, child: child),
    );
  }
}

/// [BoxSpecWidget] - A widget that applies the properties of [BoxSpec] to a [Container].
///
/// This widget acts as a bridge between the styling rules defined in a `BoxSpec`
/// and the actual widget tree by applying these styles to a [Container]. It's especially
/// useful in scenarios where animations are involved or when composing other widgets
/// that depend on the properties defined in the `BoxSpec`.
///
/// The [BoxSpecWidget] takes a [BoxSpec] object and maps its properties to the
/// corresponding properties of a [Container]. This allows for a flexible and
/// dynamic approach to styling widgets, as changes to the `BoxSpec` can be
/// reflected in the UI without manual intervention in multiple places.
///
/// Parameters:
///   - [spec]: An instance of [BoxSpec] containing the styling rules to be applied.
///     This includes alignment, padding, decoration, size constraints, margin,
///     transformation, and clipping behavior.
///   - [key]: The key for the widget.
///   - [child]: The widget below this widget in the tree, which will be contained
///     within the styled [Container].
///
/// Example usage:
/// ```dart
/// BoxSpecWidget(
///   spec: myBoxSpec,
///   child: Text('Styled Text'),
/// )
/// ```
///
/// In this example, `myBoxSpec` is an instance of [BoxSpec] with predefined styling
/// rules. The `BoxSpecWidget` applies these styles to a [Container] that wraps the
/// 'Styled Text' widget. This approach is particularly advantageous when dealing
/// with animated transitions or when composing a UI with multiple widgets that
/// rely on a common set of styling rules encapsulated within a `BoxSpec`.
class BoxSpecWidget extends StatelessWidget {
  const BoxSpecWidget({required this.spec, super.key, this.child});

  final Widget? child;
  final BoxSpec spec;

  @override
  Widget build(BuildContext context) {
    // The Container widget is used here as a foundation for applying the styling.
    // Each property of the BoxSpec is mapped to the corresponding property of the Container,
    // allowing for a flexible and dynamic approach to styling.
    return Container(
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
    );
  }
}

/// [AnimatedBoxSpecWidget] - A widget for animating the properties defined in [BoxSpec].
///
/// This widget extends [StatelessWidget] and is similar in function to [BoxSpecWidget],
/// but with added support for animations. It animates the transition of the properties
/// defined in `BoxSpec`, such as alignment, padding, decoration, size, and more, using
/// an [AnimatedContainer]. This makes it ideal for scenarios where a dynamic and visually
/// appealing transition between different styles is required.
///
/// The [AnimatedBoxSpecWidget] is particularly useful in creating fluid and smooth transitions
/// in the UI when the properties of a box-like widget need to change over time, such as in response
/// to user interactions or state changes.
///
/// Parameters:
///   - [spec]: An instance of [BoxSpec] containing the styling rules and properties to be animated.
///   - [key]: The key for the widget.
///   - [child]: The widget below this widget in the tree, which will be contained
///     within the animated [Container].
///   - [curve]: The animation curve to use. Defaults to [Curves.linear].
///   - [duration]: The duration over which to animate the specified properties.
///
/// Example usage:
/// ```dart
/// AnimatedBoxSpecWidget(
///   spec: myBoxSpec,
///   duration: Duration(seconds: 1),
///   curve: Curves.easeInOut,
///   child: Text('Animated Box'),
/// )
/// ```
///
/// In this example, `myBoxSpec` is an instance of [BoxSpec] with predefined properties.
/// The `AnimatedBoxSpecWidget` animates these properties over a duration of 1 second
/// with an `easeInOut` curve, enhancing the user experience with smooth transitions
/// for the 'Animated Box' widget.
class AnimatedBoxSpecWidget extends StatelessWidget {
  const AnimatedBoxSpecWidget({
    required this.spec,
    super.key,
    this.child,
    this.curve = Curves.linear,
    required this.duration,
  });

  final Widget? child;
  final Curve curve;
  final Duration duration;
  final BoxSpec spec;

  @override
  Widget build(BuildContext context) {
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
