import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../factory/mix_provider.dart';
import '../factory/mix_provider_data.dart';
import '../factory/style_mix.dart';
import '../variants/variant.dart';

@Deprecated('Use MixWidget instead')
typedef MixWidget = StyledWidget;

abstract class StyledWidget extends StatelessWidget {
  /// Constructor
  const StyledWidget({
    @Deprecated('Use the style parameter instead') StyleMix? mix,
    StyleMix? style,
    super.key,

    /// Inherit beavhior is off by default and allows to inherit the style from the parent Context.
    /// Only WidgetAttributes are inherited. Decorators will not be inherited as
    /// decorators should have already been applied to the parent Widget.
    bool inherit = false,
    List<StyleVariant>? variants,
  })  : _mix = mix,
        _style = style,
        _variants = variants,
        _inherit = inherit;

  final StyleMix? _mix;
  final StyleMix? _style;
  final List<StyleVariant>? _variants;
  final bool _inherit;

  StyleMix get style {
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

    return _style ?? _mix ?? StyleMix.constant;
  }

  List<StyleVariant>? get variants => _variants;

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
      DiagnosticsProperty<StyleMix>('mix', _mix, defaultValue: null),
    );

    properties.add(
      DiagnosticsProperty<StyleMix>('style', _style, defaultValue: null),
    );

    properties.add(
      DiagnosticsProperty<bool>('inherit', _inherit, defaultValue: null),
    );

    properties.add(
      DiagnosticsProperty<List<StyleVariant>>(
        'variants',
        variants,
        defaultValue: null,
      ),
    );
  }
}
