import 'package:flutter/material.dart';

import '../attributes/common/common.props.dart';
import '../mixer/mix_context.dart';
import '../mixer/mix_context_data.dart';
import '../widgets/box/box.descriptor.dart';
import '../widgets/flex/flex.props.dart';
import '../widgets/icon/icon.props.dart';
import '../widgets/image/image.props.dart';
import '../widgets/text/text.props.dart';
import '../widgets/zbox/zbox.props.dart';
import 'dto/text_style.dto.dart';

extension MixContextExtensions on BuildContext {
  MixContextData? get mixContext => MixContext.of(this);

  @Deprecated('use SharedProps.fromContext(context) instead')
  CommonProps get sharedProps => CommonProps.fromContext(this);

  @Deprecated('use BoxProps.fromContext(context) instead')
  BoxDescriptor get boxProps => BoxDescriptor.fromContext(this);

  @Deprecated('use FlexProps.fromContext(context) instead')
  FlexProps get flexProps => FlexProps.fromContext(this);

  @Deprecated('use ZBoxProps.fromContext(context) instead')
  ZBoxProps get zBoxProps => ZBoxProps.fromContext(this);

  @Deprecated('use IconProps.fromContext(context) instead')
  IconProps get iconProps => IconProps.fromContext(this);

  @Deprecated('use TextProps.fromContext(context) instead')
  TextProps get textProps => TextProps.fromContext(this);

  @Deprecated('use ImageProps.fromContext(context) instead')
  ImageProps get imageProps => ImageProps.fromContext(this);
}

extension ThemeContextExtensions on BuildContext {
  Brightness get brightness => Theme.of(this).brightness;

  /// Check if brightness is Brightness.dark
  bool get isDarkMode => brightness == Brightness.dark;

  /// Theme context helpers
  ThemeData get theme => Theme.of(this);

  /// Theme color scheme
  ColorScheme get colorScheme => theme.colorScheme;

  /// Theme text theme
  TextTheme get textTheme => theme.textTheme;
}

/// {@category Misc Utils}
extension MediaQueryContextExtensions on BuildContext {
  /// MediaQueryData for context
  MediaQueryData get mq => MediaQuery.of(this);

  /// Directionality of context
  TextDirection get directionality => Directionality.of(this);

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
  StrutStyle merge(StrutStyle? other) {
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

extension Matrix4Extension on Matrix4 {
  /// Merge [other] into this matrix.
  Matrix4 merge(Matrix4? other) {
    if (other == null || other == this) return this;

    return clone()..multiply(other);
  }
}

extension TextStyleExtension on TextStyle {
  TextStyleMergeableDto get ref => TextStyleMergeableDto(this);
}
