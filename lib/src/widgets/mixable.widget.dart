import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../mix.dart';
import '../attributes/box/box.props.dart';
import '../attributes/flex/flex.props.dart';
import '../attributes/icon/icon.props.dart';
import '../attributes/shared/shared.props.dart';
import '../attributes/text/text.props.dart';

/// Mix Widget
abstract class MixableWidget extends StatelessWidget {
  /// Constructor
  const MixableWidget(
    Mix? mix, {
    Key? key,
  })  : _mix = mix ?? Mix.constant,
        super(key: key);

  final Mix _mix;

  Mix get mix {
    return _mix;
  }

  List<Variant>? variantOrNull(Variant? variant) {
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

abstract class RemixableWidget extends MixableWidget {
  /// Constructor
  const RemixableWidget(
    Mix? mix, {
    Key? key,
  }) : super(mix, key: key);

  abstract final Mix defaultMix;

  @override
  Mix get mix {
    return defaultMix.apply(_mix);
  }
}

/// Mixer Widget
abstract class MixedWidget extends StatelessWidget {
  /// Constructor
  const MixedWidget(
    this.mixContext, {
    Key? key,
  }) : super(key: key);

  BoxProps get boxMixer => mixContext.boxMixer;
  TextProps get textMixer => mixContext.textMixer;
  IconProps get iconMixer => mixContext.iconMixer;
  FlexProps get flexMixer => mixContext.flexMixer;
  SharedProps get sharedMixer => mixContext.sharedMixer;

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
      DiagnosticsProperty<BoxProps>(
        'boxMixer',
        boxMixer,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<TextProps>(
        'textMixer',
        textMixer,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<IconProps>(
        'iconMixer',
        iconMixer,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<FlexProps>(
        'flexMixer',
        flexMixer,
        defaultValue: null,
      ),
    );

    properties.add(
      DiagnosticsProperty<SharedProps>(
        'sharedMixer',
        sharedMixer,
        defaultValue: null,
      ),
    );
  }
}
