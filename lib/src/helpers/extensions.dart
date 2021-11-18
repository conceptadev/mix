import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/attributes/dynamic/variant.attributes.dart';
import 'package:mix/src/attributes/text/text.attributes.dart';
import 'package:mix/src/attributes/text/text.notifier.dart';
import 'package:mix/src/helpers/utils.dart';
import 'package:mix/src/mixer/mixer.dart';
import 'package:mix/src/mixer/mixer.notifier.dart';
import 'package:mix/src/theme/mix_theme.dart';
import 'package:mix/src/theme/theme_data.dart';
import 'package:mix/src/theme/theme_spacing.dart';

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

  /// Get mix theme
  MixThemeData get mixData => MixTheme.of(this);

  /// Get spacing data from mix theme
  SpacingData get spacingData => mixData.spacing;

  /// MediaQueryData for context
  MediaQueryData get mq => MediaQuery.of(this);

  /// Theme context helpers
  ThemeData get theme => Theme.of(this);

  /// Text attributes of parent
  TextAttributes? get textAttributes => TextAttributeNotifier.of(this);

  /// Directionality of context
  TextDirection get directionality => Directionality.of(this);

  /// shared attributes of parent
  Mixer? get mixer => MixerNotifier.of(this);

  /// Ancestor Attributes
  List<Attribute> get ancestorAttributes => mixer?.allAttributes ?? [];

  List<Attribute> ancestorAttributesOfType<T extends Attribute>() {
    final ancestorAttributes = this.ancestorAttributes;

    final attributes = <Attribute>[];
    for (final attr in ancestorAttributes) {
      if (attr is T) {
        attributes.add(attr);
      }
    }

    return attributes;
  }

  /// Theme color scheme
  ColorScheme get colorScheme => theme.colorScheme;

  /// Default TextStyle
  TextStyle defaultTextStyle() =>
      theme.textTheme.bodyText1 ?? const TextStyle();

  /// Theme text theme
  TextTheme get textTheme => theme.textTheme;

  /// Orientation of the device
  Orientation get orientation => mq.orientation;

  /// Is device in landscape mode.

  bool get isLandscape => orientation == Orientation.landscape;

  /// Is device in portrait mode.

  bool get isPortrait => orientation == Orientation.portrait;

  /// Screen width
  double get screenWidth => mq.size.width;

  /// Screen height
  double get screenHeight => mq.size.height;

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

extension StringExtensions on String {
  VariantAttribute<T> variant<T extends Attribute>([
    T? p1,
    T? p2,
    T? p3,
    T? p4,
    T? p5,
    T? p6,
    T? p7,
    T? p8,
    T? p9,
    T? p10,
    T? p11,
    T? p12,
  ]) {
    final params = <T>[];
    if (p1 != null) params.add(p1);
    if (p2 != null) params.add(p2);
    if (p3 != null) params.add(p3);
    if (p4 != null) params.add(p4);
    if (p5 != null) params.add(p5);
    if (p6 != null) params.add(p6);
    if (p7 != null) params.add(p7);
    if (p8 != null) params.add(p8);
    if (p9 != null) params.add(p9);
    if (p10 != null) params.add(p10);
    if (p11 != null) params.add(p11);
    if (p12 != null) params.add(p12);
    return VariantAttribute(Symbol(this), params);
  }
}
