import 'package:flutter/material.dart';

import '../../theme/tokens/breakpoints_token.dart';
import '../../widgets/pressable/pressable_util.dart';
import 'on_breakpoint_util.dart';
import 'on_brightness_util.dart';
import 'on_directionality_util.dart';
import 'on_not_util.dart';
import 'on_orientation_util.dart';

final $on = OnContextVariantUtility();

class OnContextVariantUtility {
  late final small = OnBreakpointTokenVariant(BreakpointToken.small);

  late final xsmall = OnBreakpointTokenVariant(BreakpointToken.xsmall);

  late final medium = OnBreakpointTokenVariant(BreakpointToken.medium);

  late final large = OnBreakpointTokenVariant(BreakpointToken.large);

  late final breakpoint = OnBreakPointVariant.new;

  late final light = OnBrightnessVariant(Brightness.light);
  late final dark = OnBrightnessVariant(Brightness.dark);

  late final ltr = OnDirectionalityVariant(TextDirection.ltr);
  late final rtl = OnDirectionalityVariant(TextDirection.rtl);

  late final landscape = OnOrientationVariant(Orientation.landscape);
  late final portrait = OnOrientationVariant(Orientation.portrait);

  late final press = const OnPressVariant();
  late final hover = const OnHoverVariant();
  late final focus = const OnFocusVariant();
  late final enabled = const OnEnabledVariant();
  late final disabled = const OnDisabledVariant();
  late final longPress = const OnLongPressVariant();

  late final mouse = OnMouseHoverBuilder.new;

  /// Creates an [OnNotVariant] with the specified [variant].
  ///
  /// This reverses the result of the specified [variant].
  ///
  /// For example, if the specified [variant] evaluates to `true`,
  /// the [OnNotVariant] with that variant will evaluate to `false`, and vice versa.
  late final not = OnNotVariant.new;
  OnContextVariantUtility();
}
