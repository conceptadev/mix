import 'package:flutter/material.dart';

import '../decorators/widget_decorator_widget.dart';
import '../factory/mix_provider.dart';
import '../factory/mix_provider_data.dart';
import '../factory/style_mix.dart';

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
    required this.orderOfDecorators,
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

  final List<Type> orderOfDecorators;

  /// Applies a mix of inherited and local styles to the widget.
  ///
  /// Accepts a [BuildContext] and a [MixData] builder. It computes the final style by
  /// merging the inherited style with the local style, then applies it to the widget.
  /// This method is typically used in the `build` method of widgets extending
  /// [StyledWidget] to provide the actual styled widget.
  Widget withMix(BuildContext context, Widget Function(MixData mix) builder) {
    final inheritedMix = inherit ? MixProvider.maybeOfInherited(context) : null;

    final mix = style.of(context);

    final mergedMix = inheritedMix?.merge(mix) ?? mix;

    return MixProvider(
      data: mergedMix,
      child: applyDecorators(mergedMix, builder(mergedMix)),
    );
  }

  Widget applyDecorators(MixData mix, Widget child) {
    return mix.isAnimated
        ? RenderAnimatedDecorators(
            mix: mix,
            orderOfDecorators: orderOfDecorators,
            duration: mix.animation!.duration,
            curve: mix.animation!.curve,
            child: child,
          )
        : RenderDecorators(
            mix: mix,
            orderOfDecorators: orderOfDecorators,
            child: child,
          );
  }

  @override
  Widget build(BuildContext context);
}

/// A styled widget that builds its child using a [MixData] object.
///
/// `MixBuilder` is a concrete implementation of [StyledWidget] that
/// builds its child using a [withMix] method from [StyledWidget].
/// This widget is useful for creating custom styled widgets.

class MixBuilder extends StyledWidget {
  const MixBuilder({
    super.key,
    super.inherit,
    super.style,
    required this.builder,
    super.orderOfDecorators = const [],
  });

  final Widget Function(MixData) builder;

  @override
  Widget build(BuildContext context) => withMix(context, builder);
}
