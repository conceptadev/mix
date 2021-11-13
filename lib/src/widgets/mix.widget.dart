import 'package:flutter/material.dart';
import 'package:mix/src/attributes/box/box.attributes.dart';
import 'package:mix/src/attributes/flex/flex.attributes.dart';
import 'package:mix/src/attributes/icon/icon.attributes.dart';
import 'package:mix/src/attributes/text/text.attributes.dart';

import '../../mix.dart';
import '../mixer/mixer.dart';

/// Mix Widget
abstract class MixWidget extends StatelessWidget {
  /// Constructor
  const MixWidget(
    this.mix, {
    Key? key,
  }) : super(key: key);

  final Mix mix;

  @override
  Widget build(BuildContext context);
}

/// Mixer Widget
abstract class MixerWidget extends StatelessWidget {
  /// Constructor
  const MixerWidget(
    this.recipe, {
    Key? key,
  }) : super(key: key);

  BoxAttributes get boxProps => recipe.box;
  TextAttributes get textProps => recipe.text;
  IconAttributes get iconProps => recipe.icon;
  FlexAttributes get flexProps => recipe.flex;

  // Common
  bool get animated => recipe.common.animated == true;
  Duration get animationDuration =>
      recipe.common.animationDuration ?? const Duration(milliseconds: 100);
  Curve get animationCurve => recipe.common.animationCurve ?? Curves.linear;
  bool get hidden => recipe.common.hidden == true;
  TextDirection? get textDirection => recipe.common.textDirection;

  final Mixer recipe;

  @override
  Widget build(BuildContext context);
}
