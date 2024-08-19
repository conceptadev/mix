part of 'card.dart';

interface class ICardVariant extends RemixVariant {
  const ICardVariant(String name) : super('card.$name');
}

class CardVariant extends ICardVariant {
  const CardVariant(String name) : super('variant.$name');

  static const outline = CardVariant('outline');
  static const soft = CardVariant('soft');
  static const surface = CardVariant('surface');
  static const ghost = CardVariant('ghost');

  static List<CardVariant> get values => [
        outline,
        soft,
        surface,
        ghost,
      ];
}

class CardSize extends ICardVariant {
  const CardSize(String name) : super('size.$name');

  static const size1 = CardSize('size1');
  static const size2 = CardSize('size2');
  static const size3 = CardSize('size3');

  static List<CardSize> get values => [size1, size2, size3];
}
