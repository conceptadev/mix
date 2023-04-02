import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../factory/mix_factory.dart';
import '../factory/mix_provider_data.dart';
import '../variants/variant.dart';

abstract class MixWidget extends StatelessWidget {
  /// Constructor
  const MixWidget({
    @Deprecated('Use the style parameter instead') Mix? mix,
    StyleMix? style,
    super.key,
    List<Variant>? variants,
  })  : _mix = mix ?? Mix.constant,
        _variants = variants;

  final Mix _mix;
  final List<Variant>? _variants;

  Mix get mix => _mix;

  List<Variant>? get variants => _variants;

  MixData createMixData(BuildContext context) {
    return MixData.create(
      context: context,
      mix: _mix.selectVariants(_variants ?? []),
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
  }
}
