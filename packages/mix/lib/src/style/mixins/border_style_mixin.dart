import 'package:flutter/widgets.dart';

import '../../core/mix_element.dart';
import '../../properties/painting/border_mix.dart';
import 'decoration_style_mixin.dart';

/// Mixin that provides convenient border styling methods
mixin BorderStyleMixin<T extends Mix<Object?>>
    implements DecorationStyleMixin<T> {
  // Individual border side methods with full BorderSide property support
  /// Sets the top border.
  ///
  /// Prefer `.border(.top(.color(…).width(…)))`, which composes the same border through
  /// [border] without a dedicated helper per edge.
  @Deprecated('Use .border(.top(.color(…).width(…))) instead.')
  T borderTop({
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    return border(
      BorderMix.top(
        BorderSideMix(
          color: color,
          strokeAlign: strokeAlign,
          style: style,
          width: width,
        ),
      ),
    );
  }

  /// Sets the bottom border.
  ///
  /// Prefer `.border(.bottom(.color(…).width(…)))`, which composes the same border through
  /// [border] without a dedicated helper per edge.
  @Deprecated('Use .border(.bottom(.color(…).width(…))) instead.')
  T borderBottom({
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    return border(
      BorderMix.bottom(
        BorderSideMix(
          color: color,
          strokeAlign: strokeAlign,
          style: style,
          width: width,
        ),
      ),
    );
  }

  /// Sets the left border.
  ///
  /// Prefer `.border(.left(.color(…).width(…)))`, which composes the same border through
  /// [border] without a dedicated helper per edge.
  @Deprecated('Use .border(.left(.color(…).width(…))) instead.')
  T borderLeft({
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    return border(
      BorderMix.left(
        BorderSideMix(
          color: color,
          strokeAlign: strokeAlign,
          style: style,
          width: width,
        ),
      ),
    );
  }

  /// Sets the right border.
  ///
  /// Prefer `.border(.right(.color(…).width(…)))`, which composes the same border through
  /// [border] without a dedicated helper per edge.
  @Deprecated('Use .border(.right(.color(…).width(…))) instead.')
  T borderRight({
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    return border(
      BorderMix.right(
        BorderSideMix(
          color: color,
          strokeAlign: strokeAlign,
          style: style,
          width: width,
        ),
      ),
    );
  }

  /// Sets the start border (RTL-aware).
  ///
  /// Prefer `.border(.start(.color(…).width(…)))`, which composes the same border through
  /// [border] without a dedicated helper per edge.
  @Deprecated('Use .border(.start(.color(…).width(…))) instead.')
  T borderStart({
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    return border(
      BorderDirectionalMix.start(
        BorderSideMix(
          color: color,
          strokeAlign: strokeAlign,
          style: style,
          width: width,
        ),
      ),
    );
  }

  /// Sets the end border (RTL-aware).
  ///
  /// Prefer `.border(.end(.color(…).width(…)))`, which composes the same border through
  /// [border] without a dedicated helper per edge.
  @Deprecated('Use .border(.end(.color(…).width(…))) instead.')
  T borderEnd({
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    return border(
      BorderDirectionalMix.end(
        BorderSideMix(
          color: color,
          strokeAlign: strokeAlign,
          style: style,
          width: width,
        ),
      ),
    );
  }

  /// Sets vertical borders (top & bottom).
  ///
  /// Prefer `.border(.vertical(.color(…).width(…)))`, which composes the same border through
  /// [border] without a dedicated helper per edge.
  @Deprecated('Use .border(.vertical(.color(…).width(…))) instead.')
  T borderVertical({
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    final side = BorderSideMix(
      color: color,
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    );

    return border(BorderMix.vertical(side));
  }

  /// Sets horizontal borders (left & right).
  ///
  /// Prefer `.border(.horizontal(.color(…).width(…)))`, which composes the same border through
  /// [border] without a dedicated helper per edge.
  @Deprecated('Use .border(.horizontal(.color(…).width(…))) instead.')
  T borderHorizontal({
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    final side = BorderSideMix(
      color: color,
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    );

    return border(BorderMix.horizontal(side));
  }

  /// Sets all borders.
  ///
  /// Prefer `.border(.color(…).width(…))`, which composes the same border through
  /// [border] without a dedicated helper per edge.
  @Deprecated('Use .border(.color(…).width(…)) instead.')
  T borderAll({
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    final side = BorderSideMix(
      color: color,
      strokeAlign: strokeAlign,
      style: style,
      width: width,
    );

    return border(BorderMix.all(side));
  }
}
