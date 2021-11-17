import 'package:flutter/foundation.dart';
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
    Mix? mix, {
    Key? key,
  })  : _mix = mix ?? Mix.constant,
        super(key: key);

  final Mix _mix;

  Mix get mix {
    return _mix;
  }

  @override
  Widget build(BuildContext context);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(
      DiagnosticsProperty<Mix>('mix', mix, defaultValue: null),
    );
  }
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(
      DiagnosticsProperty<Mixer>(
        'mixer',
        mixer,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<BoxAttributes>(
        'box',
        boxProps,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<TextAttributes>(
        'text',
        textProps,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<IconAttributes>(
        'icon',
        iconProps,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<FlexAttributes>(
        'flex',
        flexProps,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<SharedAttributes>(
        'shared',
        sharedProps,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<bool>('animated', animated, defaultValue: false),
    );

    properties.add(
      DiagnosticsProperty<Duration>(
        'animationDuration',
        animationDuration,
        defaultValue: const Duration(milliseconds: 100),
      ),
    );

    properties.add(
      DiagnosticsProperty<Curve>(
        'animationCurve',
        animationCurve,
        defaultValue: Curves.linear,
      ),
    );

    properties.add(
      DiagnosticsProperty<bool>(
        'hidden',
        hidden,
        defaultValue: false,
      ),
    );
  }
}
