part of 'switch.dart';

interface class ISwitchVariant extends RemixVariant {
  const ISwitchVariant(String name) : super('switch.$name');
}

class SwitchSize extends ISwitchVariant {
  static const small = SwitchSize('small');
  static const medium = SwitchSize('medium');
  static const large = SwitchSize('large');

  const SwitchSize(String name) : super('size.$name');

  static List<SwitchSize> get values => [small, medium, large];
}

class SwitchVariant extends ISwitchVariant {
  static const solid = SwitchVariant('solid');
  static const soft = SwitchVariant('soft');
  static const surface = SwitchVariant('surface');
  static const outline = SwitchVariant('outline');

  const SwitchVariant(String name) : super('variant.$name');

  static List<SwitchVariant> get values => [solid, soft, surface, outline];
}
