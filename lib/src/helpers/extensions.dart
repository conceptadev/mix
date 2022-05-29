import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/attributes/text/text.attributes.dart';
import 'package:mix/src/attributes/text/text.notifier.dart';
import 'package:mix/src/dto/box_shadow.dto.dart';

/// {@category Misc Utils}
extension BuildContextExtensions on BuildContext {
  Brightness get brightness => Theme.of(this).brightness;

  /// Check if brightness is Brightness.dark
  bool get isDarkMode => brightness == Brightness.dark;

  /// MediaQueryData for context
  MediaQueryData get mq => MediaQuery.of(this);

  /// Theme context helpers
  ThemeData get theme => Theme.of(this);

  /// Text attributes of parent
  TextAttributes? get textAttributes => TextAttributeNotifier.of(this);

  /// Directionality of context
  TextDirection get directionality => Directionality.of(this);

  /// Theme color scheme
  ColorScheme get colorScheme => theme.colorScheme;

  /// Default TextStyle
  TextStyle defaultTextStyle() =>
      theme.textTheme.bodyText1 ?? const TextStyle();

  /// Theme text theme
  TextTheme get textTheme => theme.textTheme;
  TextTheme get tt => theme.textTheme;

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
}

/// {@category Misc Utils}
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

/// {@category Misc Utils}
extension BoxShadowExtension on BoxShadow {
  BoxShadowDto toBoxShadowProps() {
    return BoxShadowDto(
      blurRadius: blurRadius,
      color: color,
      offset: Offset(offset.dx, offset.dy),
      spreadRadius: spreadRadius,
    );
  }
}

/// {@category Misc Utils}
extension Matrix4Extension on Matrix4 {
  /// Merge [other] into this matrix.
  Matrix4 merge(Matrix4? other) {
    if (other == null || other == this) return this;
    return clone()..multiply(other);
  }
}

/// {@category Misc Utils}
extension BoolExtension on bool {
  Attribute? call(Attribute attribute) {
    if (this) return attribute;
    return null;
  }
}
