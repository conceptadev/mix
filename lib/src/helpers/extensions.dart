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
  Brightness get brightness => Theme.of(this).brightness;

  /// Check if brightness is Brightness.dark
  bool get isDarkMode => brightness == Brightness.dark;

  /// MediaQueryData for context
  MediaQueryData get mq => MediaQuery.of(this);

  /// Theme context helpers
  ThemeData get theme => Theme.of(this);

  /// Theme color scheme
  ColorScheme get colorScheme => theme.colorScheme;

  /// Theme text theme
  TextTheme get textTheme => theme.textTheme;

  /// Is device in landscape mode.
  @deprecated
  bool get isLandscape => mq.orientation == Orientation.landscape;

  /// Is device in portrait mode.
  @deprecated
  bool get isPortrait => mq.orientation == Orientation.portrait;

  /// Screen width
  double get screenWidth => mq.size.width;

  /// Screen height
  double get screenHeight => mq.size.height;

  /// Returns [ScreenSize] based on Material breakpoints
  ScreenSize get screenSize {
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
  merge(StrutStyle? strutStyle) {
    return StrutStyle(
      fontFamily: strutStyle?.fontFamily ?? fontFamily,
      fontFamilyFallback: strutStyle?.fontFamilyFallback ?? fontFamilyFallback,
      fontSize: strutStyle?.fontSize ?? fontSize,
      height: strutStyle?.height ?? height,
      leadingDistribution:
          strutStyle?.leadingDistribution ?? leadingDistribution,
      leading: strutStyle?.leading ?? leading,
      fontWeight: strutStyle?.fontWeight ?? fontWeight,
      fontStyle: strutStyle?.fontStyle ?? fontStyle,
      forceStrutHeight: strutStyle?.forceStrutHeight ?? forceStrutHeight,
      debugLabel: strutStyle?.debugLabel ?? debugLabel,
    );
  }
}

extension EdgeInsetExtension on EdgeInsets {
  EdgeInsets merge(EdgeInsets? edgeInsets) {
    return EdgeInsets.only(
      top: edgeInsets?.top ?? top,
      bottom: edgeInsets?.bottom ?? bottom,
      left: edgeInsets?.left ?? left,
      right: edgeInsets?.right ?? right,
    );
  }
}

extension BorderExtension on Border {
  Border merge(Border? border) {
    return Border(
      top: top.merge(border?.top),
      bottom: bottom.merge(border?.bottom),
      left: left.merge(border?.left),
      right: right.merge(border?.right),
    );
  }
}

extension BorderSideExtension on BorderSide {
  BorderSide merge(BorderSide? borderSide) {
    return BorderSide(
      color: borderSide?.color ?? color,
      width: borderSide?.width ?? width,
      style: borderSide?.style ?? style,
    );
  }
}

extension BorderRadiusExtension on BorderRadius {
  BorderRadius merge(BorderRadius? borderRadius) {
    return BorderRadius.only(
      topLeft: borderRadius?.topLeft ?? topLeft,
      topRight: borderRadius?.topRight ?? topRight,
      bottomLeft: borderRadius?.bottomLeft ?? bottomLeft,
      bottomRight: borderRadius?.bottomRight ?? bottomRight,
    );
  }
}
