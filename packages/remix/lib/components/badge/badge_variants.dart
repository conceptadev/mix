import 'package:remix/helpers/variant.dart';

abstract interface class IBadgeVariant extends RemixVariant {
  const IBadgeVariant(String name) : super('badge.$name');
}

class BadgeVariant extends IBadgeVariant {
  const BadgeVariant(String name) : super('variant.$name');

  static const solid = BadgeVariant('solid');
  static const soft = BadgeVariant('soft');
  static const surface = BadgeVariant('surface');
  static const outline = BadgeVariant('outline');

  static List<BadgeVariant> get values => [solid, soft, surface, outline];
}

class BadgeSize extends IBadgeVariant {
  const BadgeSize(String name) : super('size.$name');

  static const small = BadgeSize('small');
  static const medium = BadgeSize('medium');
  static const large = BadgeSize('large');

  static List<BadgeSize> get values => [small, medium, large];
}
