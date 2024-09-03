part of 'progress.dart';

class XProgressThemeVariant extends Variant {
  static const soft = XProgressThemeVariant('soft');
  static const surface = XProgressThemeVariant('surface');

  static const values = [soft, surface];

  const XProgressThemeVariant(String value) : super('progress.$value');
}

class XProgressThemeStyle {
  static Style get value => Style(
        XProgressStyle.base(),
        _baseStyle(),
        XProgressThemeVariant.surface(_surfaceVariant()),
        XProgressThemeVariant.soft(_softVariant()),
      );
}

Style get _baseStyle {
  return Style(
    _track.color.$neutral(6),
    _fill.color.$accent(),
    _container.clipBehavior.hardEdge(),
    _outerContainer.clipBehavior.hardEdge(),
    _outerContainer.shapeDecoration.shape.roundedRectangle(),
  );
}

Style get _surfaceVariant {
  return Style(
    _track.color.$neutral(3),
    _fill.color.$accent(9),
    _outerContainer.chain
      ..border.width(1)
      ..border.color.$neutralAlpha(6),
    $on.dark(
      _track.color.$neutral(12),
      _outerContainer.chain
        ..border.color.$white()
        ..border.color.withOpacity(0.1),
    ),
  );
}

Style get _softVariant {
  return Style(
    $progress.track.color.$neutral(4),
    $on.dark($progress.track.color.$neutral(12)),
  );
}
