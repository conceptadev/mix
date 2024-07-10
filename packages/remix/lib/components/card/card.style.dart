import 'package:mix/mix.dart';
import 'package:remix/components/card/card.variants.dart';
import 'package:remix/components/card/card_spec.dart';
import 'package:remix/tokens/remix_tokens.dart';

final _util = CardSpecUtility.self;
final _container = _util.container;
final _flex = _util.flex;
Style get _baseStyle => Style(
      _container.padding(16),
      _flex.column(),
      _flex.gap(24),
      _container.borderRadius(8),
    );

Style get _solidVariant => Style(
      _container.border.color.ref($rx.neutral1),
    );

Style get _softVariant => Style(
      _container.color.ref($rx.neutral3A),
    );

Style get _surfaceVariant => Style(
      _container.color.ref($rx.neutral3A),
      _container.border.color.ref($rx.neutral7A),
      _container.border.strokeAlign(1),
    );

Style get _ghostVariant => Style();
Style buildCardstyle(Style? style) {
  return Style(
    _baseStyle(),
    CardVariant.solid(_solidVariant()),
    CardVariant.soft(_softVariant()),
    CardVariant.ghost(_ghostVariant()),
    CardVariant.surface(_surfaceVariant()),
  ).merge(style);
}
