part of 'badge.dart';

class XBadgeThemeVariant extends Variant {
  static const solid = XBadgeThemeVariant('solid');
  static const soft = XBadgeThemeVariant('soft');
  static const surface = XBadgeThemeVariant('surface');
  static const outline = XBadgeThemeVariant('outline');

  static const values = [solid, soft, surface, outline];

  const XBadgeThemeVariant(String value) : super('badge.$value');
}

class XBadgeThemeStyle extends XBadgeStyle {
  static Style get value => Style(
        XBadgeStyle.base(),
        XBadgeThemeVariant.solid(_solidVariant()),
        XBadgeThemeVariant.soft(_softVariant()),
        XBadgeThemeVariant.surface(_surfaceVariant()),
        XBadgeThemeVariant.outline(_outlineVariant()),
      );
}

Style get _solidVariant {
  return Style(_container.color.$accent(), _label.style.color.$neutral(1));
}

Style get _softVariant {
  return Style(
    _container.color.$accentAlpha(3),
    _label.style.color.$accentAlpha(11),
  );
}

Style get _surfaceVariant {
  return Style(
    _container.color.$accentAlpha(2),
    _container.border.all.width(1),
    _container.border.all.color.$accentAlpha(6),
    _label.style.color.$accentAlpha(11),
  );
}

Style get _outlineVariant {
  return Style(
    _container.color.transparent(),
    _container.border.width(1),
    _container.border.color.$accentAlpha(8),
    _label.style.color.$accentAlpha(11),
  );
}
