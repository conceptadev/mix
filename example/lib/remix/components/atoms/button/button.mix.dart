import 'package:example/remix/design_tokens/colors.dart';
import 'package:example/remix/design_tokens/shadows.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

Mix get _container => Mix(
      py(8),
      px(16),
      rounded(8),
      gap(8),
      axisSize.min,
    );

Mix get _label => Mix(
      fontSize(14),
      letterSpacing(1.25),
      upperCase,
    );

Mix get _icon => Mix(
      iconSize(15),
    );

abstract class RawRemixButtonRecipe {
  Mix get label;
  Mix get container;
  Mix get icon;
}

class ButtonRecipe implements RawRemixButtonRecipe {
  Mix get container => Mix(
        withMix(_container),
        bgColor(RxColors.primary),
        withMix(RxShadows.shadow20),
      );

  Mix get label => Mix(
        withMix(_label),
        textColor(RxColors.white),
      );

  Mix get icon => Mix(
        withMix(_icon),
        iconColor(RxColors.white),
        iconSize(20),
      );
}

class OutlinedButtonRecipe implements RawRemixButtonRecipe {
  Mix get container => Mix(
        withMix(_container),
        borderColor(RxColors.primary),
        borderWidth(1),
        bgColor(Colors.transparent),
      );

  Mix get label => Mix(
        withMix(_label),
        textColor(RxColors.primary),
      );

  Mix get icon => Mix(
        withMix(_icon),
        iconColor(RxColors.primary),
      );
}

/// Recipe for
class TextButtonrecipe implements RawRemixButtonRecipe {
  Mix get container => Mix(
        withMix(_container),
      );

  Mix get label => Mix(
        withMix(_label),
        textColor(RxColors.primary),
      );

  Mix get icon => Mix(
        withMix(_icon),
        iconColor(RxColors.primary),
      );
}
