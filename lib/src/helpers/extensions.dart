import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/attributes/pressable/pressable.attributes.dart';
import 'package:mix/src/attributes/text/text.attributes.dart';
import 'package:mix/src/attributes/text/text.notifier.dart';
import 'package:mix/src/attributes/variants/variant.attributes.dart';
import 'package:mix/src/dto/box_shadow.dto.dart';
import 'package:mix/src/mixer/mix_context_notifier.dart';
import 'package:mix/src/mixer/mixer.dart';
import 'package:mix/src/theme/tokens/breakpoints_token.dart';

extension ContextExtensions on BuildContext {
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

  /// shared attributes of parent
  MixContext? get ancestorMixer => MixContextNotifier.of(this);

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

extension Matrix4Extension on Matrix4 {
  /// Merge [other] into this matrix.
  Matrix4 merge(Matrix4? other) {
    if (other == null) return this;
    return clone()..multiply(other);
  }
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
    switch (this) {
      case 'dark':
        return DarkModeAttribute(params);
      case 'hover':
        return HoverAttribute(params);
      case 'pressing':
        return PressingAttribute(params);
      case 'disabled':
        return DisabledAttribute(params);
      case 'focus':
        return FocusedAttribute(params);
      case 'xsmall':
        return ScreenSizeAttribute(params, ScreenSizeToken.xsmall);
      case 'small':
        return ScreenSizeAttribute(params, ScreenSizeToken.small);
      case 'medium':
        return ScreenSizeAttribute(params, ScreenSizeToken.medium);
      case 'large':
        return ScreenSizeAttribute(params, ScreenSizeToken.large);
      case 'landscape':
        return OrientationAttribute(params, Orientation.landscape);
      case 'portrait':
        return OrientationAttribute(params, Orientation.portrait);
      default:
        return VariantAttribute(this, params);
    }
  }
}
