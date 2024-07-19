import 'package:flutter/widgets.dart';

import '../../mix.dart';
import '../modifiers/internal/render_widget_modifier.dart';
import 'internal/mix_state/interactive_mix_state.dart';

/// An abstract widget for applying custom styles.
///
/// `StyledWidget` serves as a base class for widgets that need custom styling.
/// It facilitates the application of a `Style` object to the widget and optionally
/// allows this style to be inherited from its parent. This class is intended to be
/// extended by more concrete widgets that implement specific styled behavior.

abstract class StyledWidget extends StatelessWidget {
  /// Constructor for a styled widget.
  ///
  /// Takes a [Style] object and an optional [inherit] flag.
  const StyledWidget({
    Style? style,
    super.key,
    this.inherit = false,
    required this.orderOfModifiers,
  }) : style = style ?? const Style.empty();

  /// The style to apply to the widget.
  ///
  /// Defines the appearance of the widget using a [Style] object. If null, defaults
  /// to an empty [Style], meaning no style is applied.
  final Style style;

  /// Whether the widget should inherit its style from its parent.
  ///
  /// If set to true, the widget will merge its style with the style from the nearest
  /// [StyledWidget] ancestor in the widget tree. Defaults to false.
  final bool inherit;

  final List<Type> orderOfModifiers;

  /// Applies a mix of inherited and local styles to the widget.
  ///
  /// Accepts a [BuildContext] and a [MixData] builder. It computes the final style by
  /// merging the inherited style with the local style, then applies it to the widget.
  /// This method is typically used in the `build` method of widgets extending
  /// [StyledWidget] to provide the actual styled widget.
  Widget withMix(
    BuildContext context,
    Widget Function(BuildContext context) builder,
  ) {
    return _InteractiveMixStateBuilder(
        style: style,
        builder: (context) {
          final inheritedMix = inherit ? Mix.maybeOfInherited(context) : null;

          final mix = style.of(context);

          final mergedMix = inheritedMix?.merge(mix) ?? mix;

          return Mix(
            data: mergedMix,
            child: _applyModifiers(mergedMix, Builder(builder: builder)),
          );
        });
  }

  Widget _applyModifiers(MixData mix, Widget child) {
    final modifiers = mix
        .whereType<WidgetModifierAttribute>()
        .map((e) => e.resolve(mix))
        .toList();

    return mix.isAnimated
        ? RenderAnimatedModifiers(
            modifiers: modifiers,
            duration: mix.animation!.duration,
            orderOfModifiers: orderOfModifiers,
            curve: mix.animation!.curve,
            child: child,
          )
        : RenderModifiers(
            modifiers: modifiers,
            orderOfModifiers: orderOfModifiers,
            child: child,
          );
  }

  @override
  Widget build(BuildContext context);
}

class _InteractiveMixStateBuilder extends StatelessWidget {
  const _InteractiveMixStateBuilder({
    required this.builder,
    required this.style,
  });

  final Widget Function(BuildContext context) builder;
  final Style style;
  @override
  Widget build(BuildContext context) {
    final needsInteractive = style.variants.values
            .any((attr) => attr.variant is InteractiveMixStateVariant) &&
        InteractiveMixState.maybeOf(context) != null;

    return needsInteractive
        ? InteractiveMixStateWidget(child: Builder(builder: builder))
        : builder(context);
  }
}

/// A styled widget that builds its child using a [MixData] object.
///
/// `SpecBuilder` is a concrete implementation of [StyledWidget] that
/// builds its child using a [withMix] method from [StyledWidget].
/// This widget is useful for creating custom styled widgets.

class SpecBuilder extends StyledWidget {
  const SpecBuilder({
    required this.builder,
    super.style,
    super.inherit,
    super.orderOfModifiers = const [],
    super.key,
  });

  final Widget Function(BuildContext) builder;

  @override
  Widget build(BuildContext context) => withMix(context, builder);
}
