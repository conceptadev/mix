import 'package:flutter/widgets.dart';

import '../../core/mix_element.dart';
import '../../properties/painting/border_mix.dart';
import 'decoration_style_mixin.dart';

/// Mixin that provides convenient border styling methods
mixin BorderStyleMixin<T extends Mix<Object?>>
    implements DecorationStyleMixin<T> {
  // Individual border side methods with full BorderSide property support
  /// Sets the top border.
  @Deprecated(
    'Use border(.top(.color(...).width(...))) instead. borderTop will be removed in Mix 3.0.',
  )
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
  @Deprecated(
    'Use border(.bottom(.color(...).width(...))) instead. borderBottom will be removed in Mix 3.0.',
  )
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
  @Deprecated(
    'Use border(.left(.color(...).width(...))) instead. borderLeft will be removed in Mix 3.0.',
  )
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
  @Deprecated(
    'Use border(.right(.color(...).width(...))) instead. borderRight will be removed in Mix 3.0.',
  )
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
  @Deprecated(
    'Use border(.start(.color(...).width(...))) instead. borderStart will be removed in Mix 3.0.',
  )
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
  @Deprecated(
    'Use border(.end(.color(...).width(...))) instead. borderEnd will be removed in Mix 3.0.',
  )
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
  @Deprecated(
    'Use border(.vertical(.color(...).width(...))) instead. borderVertical will be removed in Mix 3.0.',
  )
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
  @Deprecated(
    'Use border(.horizontal(.color(...).width(...))) instead. borderHorizontal will be removed in Mix 3.0.',
  )
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
  @Deprecated(
    'Use border(.color(...).width(...)) instead. borderAll will be removed in Mix 3.0.',
  )
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
