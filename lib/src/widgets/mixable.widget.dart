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
class MixableBuilder extends StatelessWidget {
  final Widget Function(MixContext mixContext) builder;

  /// Constructor
  const MixableBuilder({
    Key? key,
    bool? inherit,
    List<Variant>? variants,
    required this.builder,
    required Mix mix,
  })  : _mix = mix,
        _variants = variants,
        _inherit = inherit ?? true,
        super(key: key);

  final Mix _mix;

  final List<Variant>? _variants;
  final bool _inherit;

  MixContext getMixContext(BuildContext context) {
    return MixContext.create(
      context: context,
      mix: _mix.withMaybeVariants(_variants),
      inherit: _inherit,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(
      DiagnosticsProperty<Mix>('mix', _mix, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<List<Variant>>(
        'variants',
        _variants,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<bool>('inherit', _inherit, defaultValue: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return builder(getMixContext(context));
  }
}

/// Mix Widget
abstract class MixableWidget extends StatelessWidget {
  /// Constructor
  const MixableWidget(
    Mix? mix, {
    Key? key,
    bool? inherit,
    List<Variant>? variants,
  })  : _mix = mix ?? Mix.constant,
        _variants = variants,
        _inherit = inherit ?? true,
        super(key: key);

  final Mix _mix;

  final List<Variant>? _variants;
  final bool _inherit;

  MixContext getMixContext(BuildContext context) {
    return MixContext.create(
      context: context,
      mix: _mix.withMaybeVariants(_variants),
      inherit: _inherit,
    );
  }

  @override
  Widget build(BuildContext context);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(
      DiagnosticsProperty<Mix>('mix', _mix, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<List<Variant>>(
        'variants',
        _variants,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<bool>('inherit', _inherit, defaultValue: true),
    );
  }
}

abstract class RemixableWidget extends MixableWidget {
  /// Constructor
  const RemixableWidget(
    Mix? mix, {
    Key? key,
  }) : super(mix, key: key);

  abstract final Mix baseMix;

  Mix get mix {
    return baseMix.apply(_mix);
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
