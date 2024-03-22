import 'package:flutter/material.dart';

import '../../core/styled_widget.dart';
import '../../deprecations.dart';
import '../../factory/mix_provider.dart';
import '../../factory/mix_provider_data.dart';
import 'box_spec.dart';

typedef StyledContainer = Box;

/// A [Container] equivalent widget for applying styles using Mix.
///
/// `Box` is a concrete implementation of [StyledWidget] that applies custom styles
/// to a single child widget using the styling capabilities inherited from
/// [StyledWidget]. It wraps the child in a `MixedBox`, which is responsible for
/// rendering the styled output.
///
/// The primary purpose of `Box` is to provide a flexible and reusable way to style
/// widgets without the need to repeatedly define common style properties. It leverages
/// the [Style] object to define the appearance and allows inheriting styles from
/// ancestor [StyledWidget]s in the widget tree.
///
/// ## Inheriting Styles
///
/// If the [inherit] property is set to `true`, `Box` will merge its defined style with
/// the style from the nearest [MixProvider] ancestor in the widget tree. This is
/// useful for cascading styles down the widget tree.
///
/// ## Performance Considerations
///
/// While `Box` provides a convenient way to style widgets, be mindful of the
/// performance implications of using complex styles and deep inheritance trees.
/// Overuse of style inheritance can lead to increased widget rebuilds and might
/// affect the performance of your application.
///
/// See also:
/// * [Style], which defines the visual properties to be applied.
/// * [MixedBox], which is used internally by `Box` to render the styled widget.
/// * [Container], which is the Flutter equivalent widget.
class Box extends StyledWidget {
  const Box({
    @Deprecated('Use the the style parameter instead') Mix? mix,
    super.style,
    super.key,
    super.inherit,
    this.child,
    super.orderOfDecorators = const [],
  });

  /// The child widget that will receive the styles.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    // Apply styling from StyledWidget to a MixedBox.
    // This method uses `withMix` to get the `MixData` and then applies it to `MixedBox`,
    // effectively styling the [child].
    return withMix(context, (mix) {
      return mix.isAnimated
          ? AnimatedMixedBox(
              mix: mix,
              curve: mix.animation.curve,
              duration: mix.animation.duration,
              child: child,
            )
          : MixedBox(mix: mix, child: child);
    });
  }
}

/// A widget that is responsible for rendering a [Container] with styling defined in `MixData`.
///
/// `MixedBox` is a critical component in the Mix, acting as the interpreter
/// between abstract styling rules in `MixData` and concrete visual properties on a `Container`.
/// It allows dynamic and flexible styling of child widgets based on the rules defined in the
/// provided `MixData`. This widget is particularly useful in scenarios where the styling needs
/// to adapt based on different conditions or contexts.
///
/// The [mix] parameter is the cornerstone of `MixedBox`. It encapsulates the styling rules
/// that dictate how the child widget should be visually represented. If [mix] is null,
/// `MixedBox` attempts to retrieve styling information from the nearest `MixProvider` in
/// the widget tree, enabling style inheritance and theming capabilities.
///
/// The [child] parameter is the widget that will be styled by `MixedBox`. This child widget
/// can be any Flutter widget, making `MixedBox` a way to add composable visual and layout widgets
/// to the widget tree.
///
/// The [decoratorOrder] parameter provides a way to control the order in which [Decorators] are applied.
/// This can be crucial when certain styling effects need to be prioritized over others.
/// It defaults to an empty list, which implies a standard
/// order of decoration.
///
/// See also:
/// * [MixData], which holds the styling rules used by `MixedBox`.
/// * [Container], the underlying widget that is used to apply the actual styling.
/// * [MixProvider], which can provide inherited `MixData`.
class MixedBox extends StatelessWidget {
  /// Creates a `MixedBox` widget.
  ///
  /// The [mix] parameter holds styling rules. If null, styling is obtained from
  /// the closest `MixProvider`. The [child] is the widget to be styled. The optional
  /// [decoratorOrder] determines the order of style decorators on the child.
  const MixedBox({required this.mix, super.key, this.child});

  final Widget? child;
  final MixData mix;
  @override
  Widget build(BuildContext context) {
    // Get MixData from this widget or the nearest MixProvider.

    // Retrieve styling properties from MixData. Use default properties if MixData is not provided.
    final spec = BoxSpec.of(mix);

    return Container(
      alignment: spec.alignment,
      padding: spec.padding,
      decoration: spec.decoration,
      foregroundDecoration: spec.foregroundDecoration,
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

/// Animated version of [MixedBox] that gradually changes its values over a period of time.
///
/// The [AnimatedMixedBox] will automatically animate between the old and
/// new `MixData` values of properties when they change using the provided curve and
/// duration. Attributes that are null are not animated. Its child and
/// descendants are not animated.
///
/// This class is useful for generating simple implicit transitions between
/// different in a [MixedBox] with its internal [AnimatedContainer].
///
/// See also:
/// * [MixData], which holds the styling and animation rules used by `AnimatedMixedBox`.
/// * [AnimatedContainer], the Flutter equivalent widget.
class AnimatedMixedBox extends StatelessWidget {
  const AnimatedMixedBox({
    required this.mix,
    super.key,
    this.child,
    this.curve = Curves.linear,
    required this.duration,
  });

  final Widget? child;
  final Curve curve;
  final Duration duration;
  final MixData mix;

  @override
  Widget build(BuildContext context) {
    final spec = BoxSpec.of(mix);

    // AnimatedContainer is utilized here to animate the transition of BoxSpec properties.
    // Each property from the BoxSpec is applied to the AnimatedContainer, allowing the
    // widget to animate changes smoothly over the specified duration and curve.
    return AnimatedContainer(
      alignment: spec.alignment,
      padding: spec.padding,
      decoration: spec.decoration,
      foregroundDecoration: spec.foregroundDecoration,
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

/// Animated version of [Box] that gradually changes its values over a period of time.
///
/// The [AnimatedBox] will automatically animate between the old and
/// new style values of properties when they change using the provided curve and
/// duration. Attributes that are null are not animated. Its child and
/// descendants are not animated.
///
/// This class is useful for generating simple implicit transitions between
/// different in a [Box] with by applying the [AnimatedMixedBox] to the child.
///
/// See also:
/// * [MixData], which holds the styling and animation rules used by `AnimatedBox`.
/// * [AnimatedMixedBox], which is responsible for applying the animated transitions to
///   the styling properties.
@Deprecated('Use Box now accepts an AnimatedStyle instead')
class AnimatedBox extends AnimatedStyledWidget {
  const AnimatedBox({
    super.style,
    super.key,
    super.inherit,
    this.child,
    super.curve,
    required super.duration,
    super.orderOfDecorators = const [],
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
        mix: mix,
        curve: curve,
        duration: duration,
        child: child,
      );
    });
  }
}
