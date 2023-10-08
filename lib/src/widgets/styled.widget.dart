import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../attributes/variants/variant.dart';
import '../factory/mix_provider.dart';
import '../factory/mix_provider_data.dart';
import '../factory/style_mix.dart';
import 'exports.dart';

@Deprecated('Use MixWidget instead')
typedef MixWidget = StyledWidget;

abstract class StyledWidget extends StatelessWidget {
  /// Constructor.
  const StyledWidget({
    @Deprecated('Use the style parameter instead') StyleMix? mix,
    StyleMix? style,
    super.key,

    /// Inherit beavhior is off by default and allows to inherit the style from the parent Context.
    /// Only WidgetAttributes are inherited. Decorators will not be inherited as
    /// decorators should have already been applied to the parent Widget.
    bool inherit = false,
    List<Variant>? variants,
  })  : _style = style ?? mix,
        _variants = variants,
        _inherit = inherit;

  final StyleMix? _style;
  final List<Variant>? _variants;
  final bool _inherit;

  StyleMix get style => _style ?? StyleMix.empty;

  List<Variant>? get variants => _variants;

  MixData getMix(BuildContext context) {
    final mix = MixData.create(
      context: context,
      style: style.selectVariants(_variants ?? []),
    );

    if (_inherit) {
      final parentMix = MixProvider.of(context);
      if (parentMix != null) {
        return mix.inheritFrom(parentMix);
      }
    }

    return mix;
  }

  Widget withMix(BuildContext context, Widget child) {
    final mix = getMix(context);

    return MixProvider(mix, child: child);
  }

  Widget withMixBuilder(BuildContext context, WidgetMixBuilder builder) {
    final mix = getMix(context);

    return MixProvider(mix, child: builder(mix));
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(DiagnosticsProperty<StyleMix>('style', _style));

    properties.add(DiagnosticsProperty<bool>('inherit', _inherit));

    properties.add(DiagnosticsProperty<List<Variant>>('variants', variants));
  }

  @override
  Widget build(BuildContext context);
}
