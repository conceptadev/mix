import 'package:mix/mix.dart';
import 'package:remix/components/switch/switch.variants.dart';
import 'package:remix/components/switch/switch_spec.dart';
import 'package:remix/helpers/utility_extension.dart';
import 'package:remix/tokens/remix_tokens.dart';

final _util = SwitchSpecUtility.self;

final _container = _util.container;
final _indicator = _util.indicator;

Style get _baseStyle => Style(
      _container.borderRadius(99),
      _indicator.borderRadius(99),
      SwitchStatus.on(
        _container.alignment.centerRight(),
      ),
      SwitchStatus.off(
        _container.alignment.centerLeft(),
      ),
    );

Style get _solidVariant => Style(
      $on.hover(
        _container.color.ref($rx.accent12),
      ),
      $on.disabled(
        _container.color.ref($rx.neutral3A),
      ),
      SwitchStatus.on(
        _container.color.ref($rx.accent9),
        _indicator.color.ref($rx.neutral1),
      ),
      SwitchStatus.off(
        _container.color.ref($rx.neutral4),
        _indicator.color.ref($rx.neutral1),
      ),
    );

Style get _smallVariant => Style(
      _container.width(24),
      _container.padding.horizontal(1),
      _container.height(16),
      _indicator.size(12),
    );

Style get _mediumVariant => Style(
      _container.width(32),
      _container.padding.horizontal(2),
      _container.height(20),
      _indicator.size(16),
    );

Style get _largeVariant => Style(
      _container.width(40),
      _container.padding.horizontal(3),
      _container.height(24),
      _indicator.size(20),
    );

Style buildSwitchStyle() {
  return Style(
    _baseStyle(),
    // Sizes
    SwitchSize.small(_smallVariant()),
    SwitchSize.medium(_mediumVariant()),
    SwitchSize.large(_largeVariant()),
    SwitchVariant.solid(_solidVariant()),
  );
}
