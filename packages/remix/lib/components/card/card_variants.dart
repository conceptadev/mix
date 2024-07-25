part of 'card.dart';

interface class ICardVariant extends RemixVariant {
  const ICardVariant(String name) : super('card.$name');
}

class CardVariant extends ICardVariant {
  const CardVariant(String name) : super('variant.$name');

  static const solid = CardVariant('solid');
  static const soft = CardVariant('soft');
  static const surface = CardVariant('surface');
  static const ghost = CardVariant('ghost');

  static List<CardVariant> get values => [
        solid,
        soft,
        surface,
        ghost,
      ];
}
