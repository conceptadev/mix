import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../../theme/tokens/breakpoints_token.dart';
import '../widget_state_variant.dart';
import 'on_breakpoint_util.dart';
import 'on_brightness_util.dart';
import 'on_directionality_util.dart';
import 'on_not_util.dart';
import 'on_orientation_util.dart';

class OnContextVariantUtility {
  late final small = const OnBreakpointTokenVariant(BreakpointToken.small);

  late final xsmall = const OnBreakpointTokenVariant(BreakpointToken.xsmall);

  late final medium = const OnBreakpointTokenVariant(BreakpointToken.medium);

  late final large = const OnBreakpointTokenVariant(BreakpointToken.large);

  late final breakpoint = OnBreakPointVariant.new;
  late final breakpointToken = OnBreakpointTokenVariant.new;

  late final light = const OnBrightnessVariant(Brightness.light);
  late final dark = const OnBrightnessVariant(Brightness.dark);

  late final ltr = const OnDirectionalityVariant(TextDirection.ltr);
  late final rtl = const OnDirectionalityVariant(TextDirection.rtl);

  late final landscape = const OnOrientationVariant(Orientation.landscape);
  late final portrait = const OnOrientationVariant(Orientation.portrait);

  late final press = const OnPressVariant();
  late final hover = const OnHoverVariant();
  late final focus = const OnFocusedVariant();
  late final enabled = const OnNotVariant(OnDisabledVariant());
  late final disabled = const OnDisabledVariant();
  late final longPress = const OnLongPressVariant();
  late final selected = const OnSelectedVariant();
  late final unselected = const OnNotVariant(OnSelectedVariant());
  late final dragged = const OnDraggedVariant();

  /// Creates an [OnNotVariant] with the specified [variant].
  ///
  /// This reverses the result of the specified [variant].
  ///
  /// For example, if the specified [variant] evaluates to `true`,
  /// the [OnNotVariant] with that variant will evaluate to `false`, and vice versa.
  late final not = OnNotVariant.new;
  static final self = OnContextVariantUtility._();

  OnContextVariantUtility._();
}
