import 'package:flutter/material.dart';

import '../../core/styled_widget.dart';
import '../../deprecations.dart';
import '../../factory/mix_provider.dart';
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
      final spec = BoxSpec.of(mix);

      return mix.isAnimated
          ? AnimatedMixedBox(
              spec: spec,
              duration: mix.animation!.duration,
              curve: mix.animation!.curve,
              child: child,
            )
          : MixedBox(spec: spec, child: child);
    });
  }
}

class MixedBox extends StatelessWidget {
  const MixedBox({required this.spec, super.key, this.child});

  final Widget? child;
  final BoxSpec? spec;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: spec?.alignment,
      padding: spec?.padding,
      decoration: spec?.decoration,
      foregroundDecoration: spec?.foregroundDecoration,
      width: spec?.width,
      height: spec?.height,
      constraints: spec?.constraints,
      margin: spec?.margin,
      transform: spec?.transform,
      transformAlignment: spec?.transformAlignment,
      clipBehavior: spec?.clipBehavior ?? Clip.none,
      child: child,
    );
  }
}

class AnimatedMixedBox extends ImplicitlyAnimatedWidget {
  const AnimatedMixedBox({
    required this.spec,
    super.key,
    this.child,
    required super.duration,
    super.curve = Curves.linear,
    super.onEnd,
  });

  final Widget? child;
  final BoxSpec spec;

  @override
  AnimatedWidgetBaseState<AnimatedMixedBox> createState() =>
      _AnimatedBoxSpecWidgetState();
}

class _AnimatedBoxSpecWidgetState
    extends AnimatedWidgetBaseState<AnimatedMixedBox> {
  BoxSpecTween? _boxSpec;

  @override
  // ignore: avoid-dynamic
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _boxSpec = visitor(
      _boxSpec,
      widget.spec,
      // ignore: avoid-dynamic
      (dynamic value) => BoxSpecTween(begin: value as BoxSpec?),
    ) as BoxSpecTween?;
  }

  @override
  Widget build(BuildContext context) {
    final spec = _boxSpec?.evaluate(animation);

    return MixedBox(spec: spec, child: widget.child);
  }
}
