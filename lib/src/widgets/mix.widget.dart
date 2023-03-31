import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../factory/mix_context.dart';
import '../factory/mix_context_data.dart';
import '../factory/mix_factory.dart';
import '../variants/variant.dart';

abstract class MixWidget extends StatelessWidget {
  /// Constructor
  const MixWidget({
    Mix? mix,
    super.key,
    bool? inherit,
    List<Variant>? variants,
  })  : _mix = mix ?? Mix.constant,
        _variants = variants,
        _inherit = inherit ?? false;

  final Mix _mix;
  final List<Variant>? _variants;
  final bool _inherit;

  Mix get mix => _mix;
  bool get inherit => _inherit;
  List<Variant>? get variants => _variants;

  MixData createMixContextData(BuildContext context) {
    var combinedMix = _mix;

    if (_inherit) {
      /// Get ancestor context
      final inheritedMixContext = MixContext.of(context);

      if (inheritedMixContext != null) {
        final inheritedValues = inheritedMixContext.toValues();
        combinedMix = combinedMix.copyWith(values: inheritedValues);
      }
    }

    return MixData.create(
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
      DiagnosticsProperty<Mix>('mix', mix, defaultValue: null),
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
