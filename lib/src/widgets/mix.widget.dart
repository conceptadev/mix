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
    this.mixer, {
    Key? key,
  }) : super(key: key);

  BoxAttributes? get boxProps => mixer.box;
  TextAttributes? get textProps => mixer.text;
  IconAttributes? get iconProps => mixer.icon;
  FlexAttributes? get flexProps => mixer.flex;
  SharedAttributes? get sharedProps => mixer.shared;

  // Common
  bool get animated => sharedProps?.animated == true;
  Duration get animationDuration =>
      sharedProps?.animationDuration ?? const Duration(milliseconds: 100);
  Curve get animationCurve => sharedProps?.animationCurve ?? Curves.linear;
  bool get hidden => sharedProps?.hidden == true;
  TextDirection? get textDirection => sharedProps?.textDirection;

  final Mixer mixer;

  @override
  Widget build(BuildContext context);
}
