import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../mix.dart';
import '../attributes/box/box.props.dart';
import '../attributes/flex/flex.props.dart';
import '../attributes/icon/icon.props.dart';
import '../attributes/shared/shared.props.dart';
import '../attributes/text/text.props.dart';
import '../attributes/zbox/zbox.props.dart';

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

  BoxProps get boxMixer => mixContext.boxProps;
  TextProps get textMixer => mixContext.textProps;
  IconProps get iconMixer => mixContext.iconProps;
  FlexProps get flexMixer => mixContext.flexProps;
  SharedProps get sharedMixer => mixContext.sharedProps;
  ZBoxProps get zBoxMixer => mixContext.zBoxProps;
  DecoratorMap get decorators => mixContext.decorators;
  List<Decorator> get parentDecorators => mixContext.decorators.parents;
  List<Decorator> get childDecorators => mixContext.decorators.children;

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

    properties.add(
      DiagnosticsProperty(
        'zBoxMixer',
        zBoxMixer,
        defaultValue: null,
      ),
    );
  }
}
