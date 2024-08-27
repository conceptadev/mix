part of 'callout.dart';

class XCalloutThemeVariant extends Variant {
  static const soft = XCalloutThemeVariant('soft');
  static const surface = XCalloutThemeVariant('surface');
  static const outline = XCalloutThemeVariant('outline');

  static const values = [soft, surface, outline];

  const XCalloutThemeVariant(String value) : super('callout.$value');
}

class XCalloutThemeStyle {
  static Style get value => Style(
        XCalloutStyle.base(),
        _baseStyle(),
        XCalloutThemeVariant.soft(_softVariant()),
        XCalloutThemeVariant.surface(_surfaceVariant()),
        XCalloutThemeVariant.outline(_outlineVariant()),
      );
}

Style get _baseStyle {
  return Style(
    _flex.gap(16),
    _flex.wrap.padding(16),
    _container.borderRadius(8),
    _icon.color.$accentAlpha(11),
    _icon.size(20),
    _text.style.color.$accentAlpha(11),
    _text.style.fontWeight.w400(),
  );
}

Style get _softVariant {
  return Style(
    _container.color.$accentAlpha(3),
    _container.border.all.width(0),
    _container.border.all.style.none(),
  );
}

Style get _surfaceVariant {
  return Style(
    _container.color.$accentAlpha(2),
    _container.border.width(1),
    _container.border.color.$accentAlpha(5),
  );
}

Style get _outlineVariant {
  return Style(
    _container.color.transparent(),
    _container.border.width(1),
    _container.border.color.$accentAlpha(8),
  );
}
