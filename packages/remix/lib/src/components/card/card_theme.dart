part of 'card.dart';

class CardThemeVariant extends Variant {
  static const surface = CardThemeVariant('surface');
  static const ghost = CardThemeVariant('ghost');

  static const values = [surface, ghost];

  const CardThemeVariant(String value) : super('card.$value');
}

class XCardThemeStyle {
  static Style get value => Style(
        XCardStyle.base(),
        _container.padding.all.$space(3),
        CardThemeVariant.surface(_surface()),
        CardThemeVariant.ghost(_ghost()),
      );
}

Style get _surface => Style(
      _container.borderRadius.all.$radius(2),
      $on.hover(_container.border.color.$neutral(8)),
      $on.dark(
        _container.color.$neutral(12),
        _container.border.width(1),
        _container.border.color.$neutral(11),
        _container.border.color.withOpacity(0.4),
      ),
    );

Style get _ghost => Style(
      _container.border.none(),
      _container.color.transparent(),
      $on.hover(_container.color.$neutral(3)),
      $on.dark(
        _container.border.color.$neutral(8),
        $on.hover(_container.color.$neutral(12)),
      ),
    );
