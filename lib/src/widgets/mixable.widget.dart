import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mix/src/decorators/decorator.dart';

import '../../mix.dart';

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

  DecoratorMap get decorators => mixContext.decorators;
  List<DecoratorAttribute> get parentDecorators =>
      mixContext.decorators.parents;
  List<DecoratorAttribute> get childDecorators =>
      mixContext.decorators.children;

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
