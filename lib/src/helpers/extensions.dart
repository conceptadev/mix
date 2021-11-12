import 'package:flutter/material.dart';
import 'package:mix/src/helpers/utils.dart';

/// Possible screen sizes
enum ScreenSize { xs, sm, md, lg }

// https://material.io/design/layout/responsive-layout-grid.html#breakpoints
class ScreenSizeBreakpoints {
  static double xs = 0;
  static double sm = 600;
  static double md = 1240;
  static double lg = 1440;
}

extension ContextExtensions on BuildContext {
  Brightness brightness() => Theme.of(this).brightness;

  /// Check if brightness is Brightness.dark
  bool isDarkMode() => brightness() == Brightness.dark;

  /// MediaQueryData for context
  MediaQueryData mq() => MediaQuery.of(this);

  /// Theme context helpers
  ThemeData theme() => Theme.of(this);

  /// Theme color scheme
  ColorScheme colorScheme() => theme().colorScheme;

  /// Theme text theme
  TextTheme textTheme() => theme().textTheme;

  /// Orientation of the device
  Orientation orientation() => mq().orientation;

  /// Is device in landscape mode.
  @deprecated
  bool isLandscape() => orientation() == Orientation.landscape;

  /// Is device in portrait mode.
  @deprecated
  bool isPortrait() => orientation() == Orientation.portrait;

  /// Screen width
  double get screenWidth => mq().size.width;

  /// Screen height
  double get screenHeight => mq().size.height;

  /// Returns [ScreenSize] based on Material breakpoints
  ScreenSize screenSize() {
    return screenWidth >= ScreenSizeBreakpoints.lg
        ? ScreenSize.lg
        : screenWidth >= ScreenSizeBreakpoints.md
            ? ScreenSize.md
            : screenWidth >= ScreenSizeBreakpoints.sm
                ? ScreenSize.sm
                : ScreenSize.xs;
  }
}

extension ColorExtensions on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) => hexToColor(hexString);

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

extension StrutStyleExtension on StrutStyle {
  merge(StrutStyle? other) {
    return StrutStyle(
      fontFamily: other?.fontFamily ?? fontFamily,
      fontFamilyFallback: other?.fontFamilyFallback ?? fontFamilyFallback,
      fontSize: other?.fontSize ?? fontSize,
      height: other?.height ?? height,
      leadingDistribution: other?.leadingDistribution ?? leadingDistribution,
      leading: other?.leading ?? leading,
      fontWeight: other?.fontWeight ?? fontWeight,
      fontStyle: other?.fontStyle ?? fontStyle,
      forceStrutHeight: other?.forceStrutHeight ?? forceStrutHeight,
      debugLabel: other?.debugLabel ?? debugLabel,
    );
  }
}

extension EdgeInsetExtension on EdgeInsets {
  EdgeInsets merge(EdgeInsets? other) {
    if (other == null) return this;
    return copyWith(
      top: _mergeIf(other.top, top, _d.top),
      bottom: _mergeIf(other.bottom, bottom, _d.bottom),
      left: _mergeIf(other.left, left, _d.left),
      right: _mergeIf(other.right, right, _d.right),
    );
  }

  static const EdgeInsets _d = EdgeInsets.zero;
}

extension BorderExtension on Border {
  Border merge(Border? other) {
    if (other == null) return this;
    return Border(
      top: top.merge(other.top),
      bottom: bottom.merge(other.bottom),
      left: left.merge(other.left),
      right: right.merge(other.right),
    );
  }
}

extension BorderSideExtension on BorderSide {
  static const BorderSide _d = BorderSide();

  BorderSide merge(BorderSide? other) {
    if (other == null) return this;
    return copyWith(
      color: _mergeIf(other.color, color, _d.color),
      width: _mergeIf(other.width, width, _d.width),
      style: _mergeIf(other.style, style, _d.style),
    );
  }
}

extension BorderRadiusExtension on BorderRadius {
  BorderRadius merge(BorderRadius? other) {
    if (other == null) return this;
    return BorderRadius.only(
      topLeft: _mergeIf(other.topLeft, topLeft, _d),
      topRight: _mergeIf(other.topRight, topRight, _d),
      bottomLeft: _mergeIf(other.bottomLeft, bottomLeft, _d),
      bottomRight: _mergeIf(other.bottomRight, bottomRight, _d),
    );
  }

  static const Radius _d = Radius.zero;
}

extension BoxShadowExtension on BoxShadow {
  BoxShadow copyWith({
    Color? color,
    Offset? offset,
    double? blurRadius,
    double? spreadRadius,
  }) {
    return BoxShadow(
      color: color ?? this.color,
      offset: offset ?? this.offset,
      blurRadius: blurRadius ?? this.blurRadius,
      spreadRadius: spreadRadius ?? this.spreadRadius,
    );
  }

  static const BoxShadow _d = BoxShadow();

  BoxShadow merge(BoxShadow? o) {
    if (o == null) return this;
    return copyWith(
      color: _mergeIf(o.color, color, _d.color),
      offset: _mergeIf(o.offset, offset, _d.offset),
      blurRadius: _mergeIf(o.blurRadius, blurRadius, _d.blurRadius),
      spreadRadius: _mergeIf(o.spreadRadius, spreadRadius, _d.spreadRadius),
    );
  }
}

/// Receives a value, an other value and a default value for comparison
T _mergeIf<T>(T other, T thisValue, T defaultValue) {
  if (thisValue == defaultValue && other != defaultValue) return other;
  if (thisValue != defaultValue && other == defaultValue) return thisValue;
  return other;
}
