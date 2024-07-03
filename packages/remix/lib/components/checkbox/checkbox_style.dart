// ignore_for_file: camel_case_types

import 'package:mix/mix.dart';
import 'package:remix/components/checkbox/checkbox_spec.dart';
import 'package:remix/components/checkbox/checkbox_variant.dart';
import 'package:remix/tokens/remix_tokens.dart';

final _checkbox = CheckboxSpecUtility.self;
final _container = _checkbox.container;
final _icon = _checkbox.icon;

Style get _baseStyle => Style(
      _container.borderRadius(4),
      _icon.color($rx.neutral1()),
    );

Style get _solidVariant => Style(
      _container.color($rx.accent9()),
      _icon.color($rx.neutral1()),
      $on.hover(
        _container.color($rx.accent12()),
      ),
    );

final _disabledVariant = Style(
  _container.color($rx.neutral3A()),
  _container.border.color($rx.neutral5A()),
  _icon.color($rx.neutral7A()),
);

final _smallVariant = Style(
  _container.width(16),
  _container.height(16),
  _icon.size(12),
);

final _mediumVariant = Style(
  _container.width(20),
  _container.height(20),
  _icon.size(16),
);

final _largeVariant = Style(
  // _container.size(24),
  _container.width(24),
  _container.height(24),
  _icon.size(20),
);

Style buildDefaultCheckboxStyle() {
  return Style(
    _baseStyle(),

    /// Size Variants
    CheckboxSize.small(_smallVariant()),
    CheckboxSize.medium(_mediumVariant()),
    CheckboxSize.large(_largeVariant()),

    // State variants
    CheckboxVariant.solid(_solidVariant()),
    $on.disabled(_disabledVariant()),
  );
}
