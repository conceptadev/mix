part of 'checkbox.dart';

abstract interface class ICheckboxVariant extends RemixVariant {
  const ICheckboxVariant(String name) : super('checkbox.$name');
}

class CheckboxVariant extends ICheckboxVariant {
  const CheckboxVariant(String name) : super('variant.$name');

  static const solid = CheckboxVariant('solid');
  static const soft = CheckboxVariant('soft');
  static const surface = CheckboxVariant('surface');
  static const outline = CheckboxVariant('outline');
  static const ghost = CheckboxVariant('ghost');

  static List<CheckboxVariant> get values => [
        solid,
        soft,
        surface,
        outline,
        ghost,
      ];
}

class CheckboxSize extends ICheckboxVariant {
  const CheckboxSize(String name) : super('size.$name');

  static const small = CheckboxSize('small');
  static const medium = CheckboxSize('medium');
  static const large = CheckboxSize('large');

  static List<CheckboxSize> get values => [small, medium, large];
}
