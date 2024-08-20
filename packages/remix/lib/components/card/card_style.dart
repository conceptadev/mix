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

Style get _outlineVariant {
  return Style(_container.border.color.$neutral(4));
}

Style get _softVariant {
  return Style(_container.color.$neutralAlpha(3));
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

Style get _size1 => Style(_container.padding.all.$space(2));

Style get _size2 => Style(_container.padding.all.$space(3));

Style get _size3 => Style(_container.padding.all.$space(4));

Style _buildCustomCardStyle(Style? style, List<ICardVariant> variants) {
  return Style(
    _baseStyle(),

    // Variant
    CardVariant.outline(_outlineVariant()),
    CardVariant.soft(_softVariant()),
    CardVariant.ghost(_ghostVariant()),
    CardVariant.surface(_surfaceVariant()),

    // Size
    CardSize.size1(_size1()),
    CardSize.size2(_size2()),
    CardSize.size3(_size3()),
  ).merge(style).applyVariants(variants);
}
