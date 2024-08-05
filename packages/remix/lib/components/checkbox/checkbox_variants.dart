part of 'checkbox.dart';

abstract interface class ICheckboxVariant extends RemixVariant {
  const ICheckboxVariant(String name) : super('checkbox.$name');
}

class CheckboxVariant extends ICheckboxVariant {
  const CheckboxVariant(String name) : super('variant.$name');

  static const soft = CheckboxVariant('soft');
  static const surface = CheckboxVariant('surface');

  static List<CheckboxVariant> get values => [
        soft,
        surface,
      ];
}

class CheckboxSize extends ICheckboxVariant {
  const CheckboxSize(String name) : super('size.$name');

  static const small = CheckboxSize('small');
  static const medium = CheckboxSize('medium');
  static const large = CheckboxSize('large');

  static List<CheckboxSize> get values => [small, medium, large];
}
