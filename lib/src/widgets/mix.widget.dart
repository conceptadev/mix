import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../factory/mix_factory.dart';
import '../factory/mix_provider.dart';
import '../factory/mix_provider_data.dart';
import '../variants/variant.dart';

@Deprecated('Use MixWidget instead')
typedef MixWidget = StyledWidget;

abstract class StyledWidget extends StatelessWidget {
  /// Constructor
  const StyledWidget({
    @Deprecated('Use the style parameter instead') Mix? mix,
    StyleMix? style,
    super.key,

    /// Inherit beavhior is off by default and allows to inherit the style from the parent Context.
    /// Only WidgetAttributes are inherited. Decorators will not be inherited as
    /// decorators should have already been applied to the parent Widget.
    bool inherit = false,
    List<Variant>? variants,
  })  : _mix = mix,
        _style = style,
        _variants = variants,
        _inherit = inherit;

  final Mix? _mix;
  final StyleMix? _style;
  final List<Variant>? _variants;
  final bool _inherit;

  MixFactory get style {
    if (_style != null && _mix != null) {
      throw Exception(
        'Please, give only one of the following parameters style OR mix',
      );
    }

    if (_style == null && _mix == null) {
      throw Exception(
        'Parameter "style" is required, and will be required in the future.',
      );
    }

    return _style ?? _mix ?? Mix.constant;
  }

  List<Variant>? get variants => _variants;

  MixData createMixData(BuildContext context) {
    final currentMix = MixData.create(
      context: context,
      style: style.selectVariants(_variants ?? []),
    );

    if (_inherit) {
      final parentMix = MixProvider.of(context);
      if (parentMix != null) {
        return currentMix.inheritFrom(parentMix);
      }
    }

    return currentMix;
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
      DiagnosticsProperty<StyleMix>('style', _style, defaultValue: null),
    );

    properties.add(
      DiagnosticsProperty<bool>('inherit', _inherit, defaultValue: null),
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
