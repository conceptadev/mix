import '../../core/mix_element.dart';
import '../../properties/layout/edge_insets_geometry_mix.dart';

/// Mixin that provides convenient spacing styling methods for styles
mixin SpacingStyleMixin<T extends Mix<Object?>> {
  /// Must be implemented by the class using this mixin
  T padding(EdgeInsetsGeometryMix value);

  /// Must be implemented by the class using this mixin
  T margin(EdgeInsetsGeometryMix value);

  // Padding convenience methods
  /// Sets the top padding.
  @Deprecated(
    'Use padding(.top(value)) instead. paddingTop will be removed in Mix 3.0.',
  )
  T paddingTop(double value) => padding(EdgeInsetsGeometryMix.top(value));

  /// Sets the bottom padding.
  @Deprecated(
    'Use padding(.bottom(value)) instead. paddingBottom will be removed in Mix 3.0.',
  )
  T paddingBottom(double value) => padding(EdgeInsetsGeometryMix.bottom(value));

  /// Sets the left padding.
  @Deprecated(
    'Use padding(.left(value)) instead. paddingLeft will be removed in Mix 3.0.',
  )
  T paddingLeft(double value) => padding(EdgeInsetsGeometryMix.left(value));

  /// Sets the right padding.
  @Deprecated(
    'Use padding(.right(value)) instead. paddingRight will be removed in Mix 3.0.',
  )
  T paddingRight(double value) => padding(EdgeInsetsGeometryMix.right(value));

  /// Sets horizontal (left and right) padding.
  @Deprecated(
    'Use padding(.horizontal(value)) instead. paddingX will be removed in Mix 3.0.',
  )
  T paddingX(double value) => padding(EdgeInsetsGeometryMix.horizontal(value));

  /// Sets vertical (top and bottom) padding.
  @Deprecated(
    'Use padding(.vertical(value)) instead. paddingY will be removed in Mix 3.0.',
  )
  T paddingY(double value) => padding(EdgeInsetsGeometryMix.vertical(value));

  /// Sets padding on all sides.
  @Deprecated(
    'Use padding(.all(value)) instead. paddingAll will be removed in Mix 3.0.',
  )
  T paddingAll(double value) => padding(EdgeInsetsGeometryMix.all(value));

  /// Sets the start (leading) padding.
  @Deprecated(
    'Use padding(.start(value)) instead. paddingStart will be removed in Mix 3.0.',
  )
  T paddingStart(double value) => padding(EdgeInsetsGeometryMix.start(value));

  /// Sets the end (trailing) padding.
  @Deprecated(
    'Use padding(.end(value)) instead. paddingEnd will be removed in Mix 3.0.',
  )
  T paddingEnd(double value) => padding(EdgeInsetsGeometryMix.end(value));

  /// Sets custom padding for each side with priority resolution.
  @Deprecated(
    'Use padding(.only(...)) or padding(.directional(...)) instead. paddingOnly will be removed in Mix 3.0.',
  )
  T paddingOnly({
    double? horizontal,
    double? vertical,
    double? start,
    double? end,
    double? left,
    double? right,
    double? top,
    double? bottom,
  }) {
    // Priority resolution (most specific wins)
    final resolvedLeft = left ?? horizontal;
    final resolvedRight = right ?? horizontal;
    final resolvedTop = top ?? vertical;
    final resolvedBottom = bottom ?? vertical;

    // Use directional if start/end provided
    if (start != null || end != null) {
      return padding(
        EdgeInsetsGeometryMix.directional(
          start: start ?? resolvedLeft,
          end: end ?? resolvedRight,
          top: resolvedTop,
          bottom: resolvedBottom,
        ),
      );
    }

    // Otherwise use regular EdgeInsets
    return padding(
      EdgeInsetsGeometryMix.only(
        left: resolvedLeft,
        right: resolvedRight,
        top: resolvedTop,
        bottom: resolvedBottom,
      ),
    );
  }

  // Margin convenience methods

  /// Sets the top margin.
  @Deprecated(
    'Use margin(.top(value)) instead. marginTop will be removed in Mix 3.0.',
  )
  T marginTop(double value) => margin(EdgeInsetsGeometryMix.top(value));

  /// Sets the bottom margin.
  @Deprecated(
    'Use margin(.bottom(value)) instead. marginBottom will be removed in Mix 3.0.',
  )
  T marginBottom(double value) => margin(EdgeInsetsGeometryMix.bottom(value));

  /// Sets the left margin.
  @Deprecated(
    'Use margin(.left(value)) instead. marginLeft will be removed in Mix 3.0.',
  )
  T marginLeft(double value) => margin(EdgeInsetsGeometryMix.left(value));

  /// Sets the right margin.
  @Deprecated(
    'Use margin(.right(value)) instead. marginRight will be removed in Mix 3.0.',
  )
  T marginRight(double value) => margin(EdgeInsetsGeometryMix.right(value));

  /// Sets horizontal (left and right) margin.
  @Deprecated(
    'Use margin(.horizontal(value)) instead. marginX will be removed in Mix 3.0.',
  )
  T marginX(double value) => margin(EdgeInsetsGeometryMix.horizontal(value));

  /// Sets vertical (top and bottom) margin.
  @Deprecated(
    'Use margin(.vertical(value)) instead. marginY will be removed in Mix 3.0.',
  )
  T marginY(double value) => margin(EdgeInsetsGeometryMix.vertical(value));

  /// Sets margin on all sides.
  @Deprecated(
    'Use margin(.all(value)) instead. marginAll will be removed in Mix 3.0.',
  )
  T marginAll(double value) => margin(EdgeInsetsGeometryMix.all(value));

  /// Sets the start (leading) margin.
  @Deprecated(
    'Use margin(.start(value)) instead. marginStart will be removed in Mix 3.0.',
  )
  T marginStart(double value) => margin(EdgeInsetsGeometryMix.start(value));

  /// Sets the end (trailing) margin.
  @Deprecated(
    'Use margin(.end(value)) instead. marginEnd will be removed in Mix 3.0.',
  )
  T marginEnd(double value) => margin(EdgeInsetsGeometryMix.end(value));

  /// Sets custom margin for each side with priority resolution.
  @Deprecated(
    'Use margin(.only(...)) or margin(.directional(...)) instead. marginOnly will be removed in Mix 3.0.',
  )
  T marginOnly({
    double? horizontal,
    double? vertical,
    double? start,
    double? end,
    double? left,
    double? right,
    double? top,
    double? bottom,
  }) {
    // Priority resolution (most specific wins)
    final resolvedLeft = left ?? horizontal;
    final resolvedRight = right ?? horizontal;
    final resolvedTop = top ?? vertical;
    final resolvedBottom = bottom ?? vertical;

    // Use directional if start/end provided
    if (start != null || end != null) {
      return margin(
        EdgeInsetsGeometryMix.directional(
          start: start ?? resolvedLeft,
          end: end ?? resolvedRight,
          top: resolvedTop,
          bottom: resolvedBottom,
        ),
      );
    }

    // Otherwise use regular EdgeInsets
    return margin(
      EdgeInsetsGeometryMix.only(
        left: resolvedLeft,
        right: resolvedRight,
        top: resolvedTop,
        bottom: resolvedBottom,
      ),
    );
  }
}
