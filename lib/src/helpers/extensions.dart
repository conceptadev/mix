import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
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
  bool get isLandscape => mq.orientation == Orientation.landscape;

  /// Is device in portrait mode.
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

extension TextStyleExtension on TextStyle {
  Mix get mix => Mix(textStyle(this));
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

extension StringExtensions on String {
  String get capitalize {
    final current = this;
    if (current.isEmpty) {
      return this;
    }

    return current[0].toUpperCase() + current.substring(1);
  }

  String get titleCase {
    const separator = ' ';
    final current = this;
    List<String> words =
        current.split(separator).map((word) => word.capitalize).toList();

    return words.join(separator);
  }

  String get sentenceCase {
    const separator = ' ';
    final current = this;
    List<String> words = current.split(separator);

    if (words.isNotEmpty) {
      words[0].capitalize;
    }

    return words.join(separator);
  }
}

extension StrutStyleExtension on StrutStyle {
  merge(StrutStyle? strutStyle) {
    return StrutStyle(
      fontFamily: strutStyle?.fontFamily ?? this.fontFamily,
      fontFamilyFallback:
          strutStyle?.fontFamilyFallback ?? this.fontFamilyFallback,
      fontSize: strutStyle?.fontSize ?? this.fontSize,
      height: strutStyle?.height ?? this.height,
      leadingDistribution:
          strutStyle?.leadingDistribution ?? this.leadingDistribution,
      leading: strutStyle?.leading ?? this.leading,
      fontWeight: strutStyle?.fontWeight ?? this.fontWeight,
      fontStyle: strutStyle?.fontStyle ?? this.fontStyle,
      forceStrutHeight: strutStyle?.forceStrutHeight ?? this.forceStrutHeight,
      debugLabel: strutStyle?.debugLabel ?? this.debugLabel,
    );
  }
}

extension EdgeInsetExtension on EdgeInsets {
  EdgeInsets merge(EdgeInsets? edgeInsets) {
    return EdgeInsets.only(
      top: edgeInsets?.top ?? this.top,
      bottom: edgeInsets?.bottom ?? this.bottom,
      left: edgeInsets?.left ?? this.left,
      right: edgeInsets?.right ?? this.right,
    );
  }
}

extension BorderExtension on Border {
  Border merge(Border? border) {
    return Border(
      top: this.top.merge(border?.top),
      bottom: this.bottom.merge(border?.bottom),
      left: this.left.merge(border?.left),
      right: this.right.merge(border?.right),
    );
  }
}

extension BorderSideExtension on BorderSide {
  BorderSide merge(BorderSide? borderSide) {
    return BorderSide(
      color: borderSide?.color ?? this.color,
      width: borderSide?.width ?? this.width,
      style: borderSide?.style ?? this.style,
    );
  }
}

extension BorderRadiusExtension on BorderRadius {
  BorderRadius merge(BorderRadius? borderRadius) {
    return BorderRadius.only(
      topLeft: borderRadius?.topLeft ?? this.topLeft,
      topRight: borderRadius?.topRight ?? this.topRight,
      bottomLeft: borderRadius?.bottomLeft ?? this.bottomLeft,
      bottomRight: borderRadius?.bottomRight ?? this.bottomRight,
    );
  }
}

extension BoxShadowExtension on BoxShadow {
  BoxShadow merge(BoxShadow? boxShadow) {
    return BoxShadow(
      color: boxShadow?.color ?? this.color,
      offset: boxShadow?.offset ?? this.offset,
      blurRadius: boxShadow?.blurRadius ?? this.blurRadius,
      spreadRadius: boxShadow?.spreadRadius ?? this.spreadRadius,
    );
  }
}
