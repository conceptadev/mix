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
        _flex.wrap.padding.all.$space(3),
        CardThemeVariant.surface(_surface()),
        CardThemeVariant.ghost(_ghost()),
      );
}

Style get _surface => Style(
      _container.borderRadius.all.$radius(2),
      $on.hover(_container.border.color.$neutral(8)),
    );

Style get _ghost => Style(
      _container.border.none(),
      $on.hover(_container.color.$neutral(3)),
    );
