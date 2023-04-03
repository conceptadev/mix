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
  })  : _mix = mix,
        _style = style,
        _variants = variants;

  final Mix? _mix;
  final StyleMix? _style;
  final List<Variant>? _variants;

  MixFactory get style {
    if (_style != null && _mix != null) {
      throw Exception(
        'Please, give only one of the following parameters style OR mix',
      );
    }

    return _style ?? _mix ?? Mix.constant;
  }

  List<Variant>? get variants => _variants;

  MixData createMixData(BuildContext context) {
    return MixData.create(
      context: context,
      style: style.selectVariants(_variants ?? []),
    );
  }

  @override
  Widget build(BuildContext context);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(
      DiagnosticsProperty<Mix>('mix', style, defaultValue: null),
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
