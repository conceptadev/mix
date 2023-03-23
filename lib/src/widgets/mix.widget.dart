import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../mixer/mix_context.dart';
import '../mixer/mix_context_data.dart';
import '../mixer/mix_factory.dart';
import '../variants/variant.dart';

abstract class MixWidget extends StatelessWidget {
  /// Constructor
  const MixWidget(
    MixFactory? mix, {
    Key? key,
    bool? inherit,
    List<Variant>? variants,
  })  : _mix = mix ?? MixFactory.constant,
        _variants = variants,
        _inherit = inherit ?? false,
        super(key: key);

  final MixFactory _mix;
  final List<Variant>? _variants;
  final bool _inherit;

  MixFactory get mix => _mix;
  bool get inherit => _inherit;
  List<Variant>? get variants => _variants;

  MixContextData createMixContextData(BuildContext context) {
    var combinedMix = _mix;

    if (_inherit) {
      /// Get ancestor context
      final inheritedMixContext = MixContext.of(context);

      if (inheritedMixContext != null) {
        final inheritedValues = inheritedMixContext.toValues();
        combinedMix = combinedMix.copyWith(values: inheritedValues);
      }
    }

    return MixContextData.create(
      context: context,
      mix: combinedMix.selectVariants(_variants ?? []),
    );
  }

  @override
  Widget build(BuildContext context);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(
      DiagnosticsProperty<MixFactory>('mix', mix, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<List<Variant>>(
        'variants',
        variants,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<bool>('inherit', inherit, defaultValue: true),
    );
  }
}

/// Mixer Widget
@Deprecated('Simplifying the api by removing this')
abstract class MixedWidget extends StatelessWidget {
  /// Constructor
  const MixedWidget(
    this.mixContext, {
    Key? key,
  }) : super(key: key);

  final MixContextData mixContext;

  @override
  Widget build(BuildContext context);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(
      DiagnosticsProperty<MixContextData>(
        'mixContext',
        mixContext,
        defaultValue: null,
      ),
    );
  }
}
