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
    _flex.chain
      ..gap(12)
      ..crossAxisAlignment.center()
      ..mainAxisAlignment.start()
      ..wrap.padding(16),
    _container.borderRadius(8),
    _icon.chain
      ..color.$accentAlpha(11)
      ..size(20),
    _text.chain
      ..style.color.$accentAlpha(11)
      ..style.fontWeight.w400(),
  );
}

Style get _softVariant {
  return Style(
    _container.chain
      ..color.$accentAlpha(3)
      ..border.all.width(0)
      ..border.all.style.none(),
    $on.dark(
      _container.color.$accent(12),
      _text.style.color.$accent(8),
      _icon.color.$accent(8),
    ),
  );
}

Style get _surfaceVariant {
  return Style(
    _container.chain
      ..color.$accentAlpha(2)
      ..border.width(1)
      ..border.color.$accentAlpha(5),
    $on.dark(
      _container.color.$accentAlpha(6),
      _container.border.color.$accent(11),
      _text.style.color.$accent(8),
      _icon.color.$accent(8),
    ),
  );
}

Style get _outlineVariant {
  return Style(
    _container.chain
      ..color.transparent()
      ..border.width(1)
      ..border.color.$accentAlpha(8),
    $on.dark(
      _container.chain
        ..color.transparent()
        ..border.color.$accent(11),
      _text.style.color.$accent(8),
      _icon.color.$accent(8),
    ),
  );
}
