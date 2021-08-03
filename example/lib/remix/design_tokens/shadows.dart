import 'package:example/remix/design_tokens/colors.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class RxShadows {
  static Mix get _base {
    return Mix(
      // Shadow color for brightness light theme
      shadowColor(RxColors.lightShadow),
      // Shadow color for brightness dark theme
      shadowColor(RxColors.darkShadow).onDark,
    );
  }

  static Mix get shadow20 => Mix(
        withMix(_base),
        shadow(
          blurRadius: 3,
          offset: Offset(0, 1),
        ),
      );
  static Mix get shadow40 => Mix(
        withMix(_base),
        shadow(
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
      );
  static Mix get shadow60 => Mix(
        withMix(_base),
        shadow(
          blurRadius: 8,
          offset: Offset(0, 4),
        ),
      );
  static Mix get shadow80 => Mix(
        withMix(_base),
        shadow(
          blurRadius: 16,
          offset: Offset(0, 8),
        ),
      );
  static Mix get shadow100 => Mix(
        withMix(_base),
        shadow(
          blurRadius: 24,
          offset: Offset(0, 16),
        ),
      );
}
