import 'package:mix/mix.dart';

abstract interface class IBadgeVariant extends Variant {
  const IBadgeVariant(super.name);
}

class BadgeVariant extends IBadgeVariant {
  const BadgeVariant(super.name);

  static const solid = BadgeVariant('remix.badge.solid');
  static const soft = BadgeVariant('remix.badge.soft');
  static const surface = BadgeVariant('remix.badge.surface');
  static const outline = BadgeVariant('remix.badge.outline');

  static List<BadgeVariant> get values => [solid, soft, surface, outline];
}

class BadgeSize extends IBadgeVariant {
  const BadgeSize(super.name);

  static const small = BadgeSize('remix.badge.small');
  static const medium = BadgeSize('remix.badge.medium');
  static const large = BadgeSize('remix.badge.large');

  static List<BadgeSize> get values => [small, medium, large];
}
