import 'package:flutter/material.dart';

import '../attributes/shared/shared.descriptor.dart';
import '../factory/mix_provider.dart';
import '../factory/mix_provider_data.dart';
import '../theme/mix_theme.dart';
import '../widgets/container/container.descriptor.dart';
import '../widgets/flex/flex.descriptor.dart';
import '../widgets/icon/icon.descriptor.dart';
import '../widgets/image/image.descriptor.dart';
import '../widgets/stack/stack.descriptor.dart';
import '../widgets/text/text.descriptor.dart';

extension BuildContextExt on BuildContext {
  MixData? get mix => MixProvider.of(this);

  /// MEDIA QUERY EXTENSION METHODS

  /// MediaQueryData for context
  MediaQueryData get mq => MediaQuery.of(this);

  /// Directionality of context.
  TextDirection get directionality => Directionality.of(this);

  /// Orientation of the device.
  Orientation get orientation => mq.orientation;

  /// Is device in landscape mode.

  bool get isLandscape => orientation == Orientation.landscape;

  /// Is device in portrait mode.

  bool get isPortrait => orientation == Orientation.portrait;

  /// Screen width.
  double get screenWidth => mq.size.width;

  /// Screen height.
  double get screenHeight => mq.size.height;

  // Theme Context Extensions.
  Brightness get brightness => Theme.of(this).brightness;

  /// Check if brightness is Brightness.dark.
  bool get isDarkMode => brightness == Brightness.dark;

  /// Theme context helpers.
  ThemeData get theme => Theme.of(this);

  /// Theme color scheme.
  ColorScheme get colorScheme => theme.colorScheme;

  /// Theme text theme.
  TextTheme get textTheme => theme.textTheme;

  /// Mix Theme Data.
  MixThemeData get mixTheme => MixTheme.of(this);

  @Deprecated('use SharedProps.fromContext(context) instead')
  CommonDescriptor get sharedProps =>
      CommonDescriptor.fromContext(MixProvider.of(this)!);

  @Deprecated('use BoxProps.fromContext(context) instead')
  StyledContainerDescriptor get boxProps =>
      StyledContainerDescriptor.fromContext(MixProvider.of(this)!);

  @Deprecated('use FlexProps.fromContext(context) instead')
  StyledFlexDescriptor get flexProps =>
      StyledFlexDescriptor.fromContext(MixProvider.of(this)!);

  @Deprecated('use ZBoxProps.fromContext(context) instead')
  StyledStackDescriptor get zBoxProps =>
      StyledStackDescriptor.fromContext(MixProvider.of(this)!);

  @Deprecated('use IconProps.fromContext(context) instead')
  StyledIconDescriptor get iconProps =>
      StyledIconDescriptor.fromContext(MixProvider.of(this)!);

  @Deprecated('use TextProps.fromContext(context) instead')
  StyledTextDescriptor get textProps =>
      StyledTextDescriptor.fromContext(MixProvider.of(this)!);

  @Deprecated('use ImageProps.fromContext(context) instead')
  StyledImageDescriptor get imageProps =>
      StyledImageDescriptor.fromContext(MixProvider.of(this)!);
}
