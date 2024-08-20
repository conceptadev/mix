part of 'checkbox.dart';

abstract interface class ICheckboxVariant extends RemixVariant {
  const ICheckboxVariant(String name) : super('checkbox.$name');
}

class CheckboxVariant extends ICheckboxVariant {
  static const soft = CheckboxVariant('soft');
  static const surface = CheckboxVariant('surface');

  const CheckboxVariant(String name) : super('variant.$name');

  static List<CheckboxVariant> get values => [soft, surface];
}

class CheckboxSize extends ICheckboxVariant {
  static const small = CheckboxSize('small');
  static const medium = CheckboxSize('medium');
  static const large = CheckboxSize('large');

  const CheckboxSize(String name) : super('size.$name');

  static List<CheckboxSize> get values => [small, medium, large];
}
