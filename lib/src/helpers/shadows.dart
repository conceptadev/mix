/// ## 👓⛅ Box Shadow Utilities
/// Provides 👓 [BoxShadowUtils] extension on [BoxShadow]
/// for manipulation of shadows by [copyWith].
/// - Consider the `operator` overrides for even simpler syntax.
///
/// Provides ⛅ [BoxShadowsUtils] extension on `List<BoxShadow>`
/// for mass shadow manipulation.
///
/// ### Reference
/// #### 👓 [BoxShadowUtils]
/// - 📋 [copyWith] Copy With replacement properties
/// - ❌ [*] "Multiply" `this` [BoxShadow] by a `Color`
/// - ❌ [*] "Multiply" `this` [blurRadius] by a `num`
/// - ➕ [+] "Add" to `this` [spreadRadius] a `double smudgeSpread`
/// - ➖ [-] "Subtract" from `this` [spreadRadius] a `double squishSpread`
/// - 📏 [%] "Modulate" `this` [offset] by `Offset` [offsetScale]
/// #### ⛅ [BoxShadowsUtils]
/// - 🎨 [colorize] a `List<BoxShadow>` with single `[Color]` or `List` [colors]
///   - Optionally ❓ [preserveOpacity] of the originals
/// - 📊 [rampOpacity] of a `List<BoxShadow>` with single `[double]` or `List` [stops]
///   - Optionally 🎨 override a [color] and ramp simultaneously
library curtains;

import 'package:flutter/material.dart';

/// ### 👓 Box Shadow Utilities
/// Extension on [BoxShadow] for manipulation of shadows by [copyWith].
///
/// Consider the `operator` overrides for even simpler syntax.
/// - 📋 [copyWith] Copy With replacement properties
/// - ❌ [*] "Multiply" `this` [BoxShadow] by a `Color`
/// - ❌ [*] "Multiply" `this` [blurRadius] by a `num`
/// - ➕ [+] "Add" to `this` [spreadRadius] a `double smudgeSpread`
/// - ➖ [-] "Subtract" from `this` [spreadRadius] a `double squishSpread`
/// - 📏 [%] "Modulate" `this` [offset] by `Offset` [offsetScale]
extension BoxShadowUtils on BoxShadow {
  /// 📋 Return a [BoxShadow] with fields that mirror `this`
  /// except for the parameters passed with this method.
  BoxShadow copyWith({
    Color? color,
    Offset? offset,
    double? blurRadius,
    double? spreadRadius,
  }) =>
      BoxShadow(
        color: color ?? this.color,
        offset: offset ?? this.offset,
        blurRadius: blurRadius ?? this.blurRadius,
        spreadRadius: spreadRadius ?? this.spreadRadius,
      );

  /// ❌ "Multiply" `this` [BoxShadow] by a [Color] or [double].
  /// ```
  /// *(Color operation) => return this.copyWith(color: operation);
  /// *(num operation) => return this.copyWith(blurRadius: blurRadius * operation);
  /// ```
  BoxShadow operator *(dynamic operation) => (operation is Color)
      ? copyWith(color: operation)
      : (operation is num)
          ? copyWith(blurRadius: blurRadius * operation)
          : this;

  /// ➕ "Add" a `double` to `this` [BoxShadow], returning a new
  /// `BoxShadow` with smudged, or increased, [BoxShadow.spreadRadius].
  /// ```
  /// +(double spreadSmudge) => this.copyWith(spreadRadius: this.spreadRadius+spreadSmudge);
  /// ```
  BoxShadow operator +(double spreadSmudge) =>
      copyWith(spreadRadius: spreadRadius + spreadSmudge);

  /// ➖ "Subtract" a `double` from `this` [BoxShadow], returning a new
  /// `BoxShadow` with squished, or decreased, [BoxShadow.spreadRadius].
  /// ```
  /// -(double spreadSquish) => this.copyWith(spreadRadius: this.spreadRadius-spreadSquish);
  /// ```
  BoxShadow operator -(double spreadSquish) =>
      copyWith(spreadRadius: spreadRadius - spreadSquish);

  /// 📏 "Modulate" `this` [BoxShadow] by [offsetScale].
  ///
  /// Returns a new `BoxShadow` whose `offset` has been
  /// [Offset.scale]d by [offsetScale]'s `dx` and `dy` respectively.
  /// ```
  /// %(Offset offsetScale) => this.copyWith(offset: this.offset.scale(offsetScale.dx, offsetScale.dy));
  /// ```
  BoxShadow operator %(Offset offsetScale) =>
      copyWith(offset: offset.scale(offsetScale.dx, offsetScale.dy));
}

/// ### ⛅ Box Shadows Utilities
/// - 🎨 [colorize] a `List<BoxShadow>` with
/// a single `[Color]` or `List` [colors].
///   - Optionally ❓ [preserveOpacity] of the original `Color`s
///
/// - 📊 [rampOpacity] of a `List<BoxShadow>` with
/// a single `[double]` or `List` [stops].
///   - Optionally 🎨 provide a [color] to replace
///   the originals and ramp simultaneously
extension BoxShadowsUtils on List<BoxShadow> {
  /// Provide a `Color` or `List<Color>` 🎨 [colors] to override
  /// `this` List's [BoxShadow.color]s.
  ///
  /// If 🎨 [colors] has less entries than `this` List,
  /// [colors.last] will be applied to the extra `BoxShadow`s.
  ///
  /// ### Optionally
  /// Pass `true` to ❓ [preserveOpacity] to maintain `this`
  /// List's [BoxShadow.color]s' opacities,
  /// applying only the RGB from [colors].
  List<BoxShadow> colorize(
    List<Color> colors, {
    bool preserveOpacity = false,
  }) {
    if (colors.isEmpty) return this;

    List<BoxShadow> coloredShadows = [];
    int i = 0;
    Color getColor() => (i >= colors.length) ? colors.last : colors[i];

    for (BoxShadow shadow in this) {
      final opacity =
          preserveOpacity ? shadow.color.opacity : getColor().opacity;
      coloredShadows.add(shadow * getColor().withOpacity(opacity));
      i++;
    }

    return coloredShadows;
  }

  /// Return a new `List<BoxShadow>` that mirrors `this` one except
  /// the [Color.opacity] of each [BoxShadow] will be set to
  /// the `double` that matches in index from 📊 [stops].
  ///
  /// If 📊 [stops] has less entries than `this` List,
  /// [stops.last] will be applied to the extra `BoxShadow`s.
  ///
  /// ### Optionally
  /// Apply a single new 🎨 [color] for each
  /// [BoxShadow.color] in `this` simultaneously.
  List<BoxShadow> rampOpacity(List<double> stops, {Color? color}) {
    List<BoxShadow> rampedShadows = [];
    int i = 0;

    for (BoxShadow shadow in this)
      rampedShadows.add(
        shadow *
            (color ?? shadow.color)
                // `i-1` since we increment++ when checking against length
                .withOpacity((i++ >= stops.length) ? stops.last : stops[i - 1]),
      );

    return rampedShadows;
  }
}
