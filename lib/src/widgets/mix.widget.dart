import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../mix.dart';
import '../attributes/box/box.mixer.dart';
import '../attributes/flex/flex.mixer.dart';
import '../attributes/icon/icon.mixer.dart';
import '../attributes/shared/shared.mixer.dart';
import '../attributes/text/text.mixer.dart';
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

  List<Var>? variantOrNull(Var? variant) {
    return variant == null ? null : [variant];
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
abstract class MixedWidget extends StatelessWidget {
  /// Constructor
  const MixedWidget(
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

    properties.add(
      DiagnosticsProperty<BoxMixer>(
        'boxMixer',
        boxMixer,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<TextMixer>(
        'textMixer',
        textMixer,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<IconMixer>(
        'iconMixer',
        iconMixer,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<FlexMixer>(
        'flexMixer',
        flexMixer,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<SharedMixer>(
        'sharedMixer',
        sharedMixer,
        defaultValue: null,
      ),
    );
  }
}
