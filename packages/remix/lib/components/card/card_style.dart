part of 'card.dart';

final _util = CardSpecUtility.self;
final _container = _util.container;
final _flex = _util.flex;
Style get _baseStyle {
  return Style(
    _container.padding(16),
    _flex.column(),
    _flex.gap(24),
    _container.borderRadius(8),
  );
}

Style get _solidVariant {
  return Style(
    _container.border.color.$neutral(1),
  );
}

Style get _softVariant {
  return Style(
    _container.color.$neutralAlpha(3),
  );
}

Style get _surfaceVariant {
  return Style(
    _container.color.$neutralAlpha(3),
    _container.border.color.$neutralAlpha(7),
    _container.border.strokeAlign(1),
  );
}

Style get _ghostVariant {
  return Style();
}

Style _buildCustomCardStyle(Style? style, List<ICardVariant> variants) {
  return Style(
    _baseStyle(),
    CardVariant.solid(_solidVariant()),
    CardVariant.soft(_softVariant()),
    CardVariant.ghost(_ghostVariant()),
    CardVariant.surface(_surfaceVariant()),
  ).merge(style).applyVariants(variants);
}
