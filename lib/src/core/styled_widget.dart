import 'package:flutter/material.dart';

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
  const StyledWidget({Style? style, super.key, this.inherit = false})
      : style = style ?? const Style.empty();

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

  /// Applies a mix of inherited and local styles to the widget.
  ///
  /// Accepts a [BuildContext] and a [MixBuilder]. It computes the final style by
  /// merging the inherited style with the local style, then applies it to the widget.
  /// This method is typically used in the `build` method of widgets extending
  /// [StyledWidget] to provide the actual styled widget.
  Widget withMix(BuildContext context, MixBuilder builder) {
    final inheritedMix = inherit ? MixData.inherited(context) : null;

    final mixData = MixData.create(context, style);

    final mergedMixData = inheritedMix?.merge(mixData) ?? mixData;

    return MixProvider(data: mergedMixData, child: builder(mergedMixData));
  }

  @override
  Widget build(BuildContext context);
}

/// A styled widget that builds its child using a [MixData] object.
///
/// `StyledWidgetBuilder` is a concrete implementation of [StyledWidget] that
/// builds its child using a [withMix] method from [StyledWidget].
/// This widget is useful for creating custom styled widgets.
class StyledWidgetBuilder extends StyledWidget {
  const StyledWidgetBuilder({
    super.key,
    super.inherit,
    super.style,
    required this.builder,
  });

  final Widget Function(MixData) builder;

  @override
  Widget build(BuildContext context) {
    return withMix(context, builder);
  }
}

/// An abstract widget that applies custom styles with animations.
///
/// `AnimatedStyledWidget` extends [StyledWidget] to include animations in the
/// style application process. This widget is designed to create animated effects
/// on styles applied to Flutter widgets. It should be extended by more concrete
/// widgets that implement specific animated styled behaviors.
abstract class AnimatedStyledWidget extends StyledWidget {
  /// Creates an animated styled widget.
  ///
  /// This constructor initializes the widget with an optional [style], [inherit] flag,
  /// animation [curve], and a required animation [duration]. The [curve] defines the
  /// nature of the animation's progression and [duration] specifies the length of time
  /// the animation will run.
  ///
  /// The [style] and [inherit] parameters are passed to the superclass [StyledWidget].
  /// If [inherit] is true, the widget will merge its style with its nearest [StyledWidget]
  /// ancestor's style.
  ///
  /// The [curve] parameter defaults to [Curves.linear], representing a steady animation
  /// pace. The [duration] parameter is required and determines how long the animation
  /// takes to complete.
  const AnimatedStyledWidget({
    super.key,
    super.inherit,
    super.style,
    this.curve = Curves.linear,
    required this.duration,
  });

  /// The curve used for the animation.
  ///
  /// Specifies how the animation speed transitions over the course of the [duration].
  /// By default, it's set to [Curves.linear], indicating a uniform animation speed.
  /// Custom curves can be provided to create different animation effects.
  final Curve curve;

  /// The duration of the animation.
  ///
  /// Determines the total time it takes for the animation to complete from start to end.
  /// This duration is essential to control the speed and responsiveness of the animation.
  final Duration duration;

  // Note: The build method will be implemented in subclasses, where the animation logic
  // will be applied based on the provided style, curve, and duration.
}
