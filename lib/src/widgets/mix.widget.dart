import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mix/src/attributes/box/box.mixer.dart';
import 'package:mix/src/attributes/flex/flex.mixer.dart';
import 'package:mix/src/attributes/icon/icon.mixer.dart';
import 'package:mix/src/attributes/shared/shared.mixer.dart';
import 'package:mix/src/attributes/text/text.mixer.dart';

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
    this.mixContext, {
    Key? key,
  }) : super(key: key);

  BoxMixer get boxMixer => mixContext.boxMixer;
  TextMixer get textMixer => mixContext.textMixer;
  IconMixer get iconMixer => mixContext.iconMixer;
  FlexMixer get flexMixer => mixContext.flexMixer;
  SharedMixer get sharedMixer => mixContext.sharedMixer;

  final MixContext mixContext;

  @override
  Widget build(BuildContext context);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(
      DiagnosticsProperty<MixContext>(
        'mixContext',
        mixContext,
        defaultValue: null,
      ),
    );
  }
}
