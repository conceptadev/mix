import 'package:mix/mix.dart';

abstract interface class ICheckboxVariant extends Variant {
  const ICheckboxVariant(super.name);
}

class CheckboxState extends ICheckboxVariant {
  const CheckboxState._(super.name);

  static const checked = CheckboxState._('remix.checkbox.checked');
  static const unchecked = CheckboxState._('remix.checkbox.unchecked');
}

class CheckboxVariant extends ICheckboxVariant {
  const CheckboxVariant(super.name);

  static const solid = CheckboxVariant('remix.checkbox.solid');
  static const outline = CheckboxVariant('remix.checkbox.outline');
  static const surface = CheckboxVariant('remix.checkbox.surface');

  static List<CheckboxVariant> get values => [solid, outline, surface];
}

class CheckboxSize extends ICheckboxVariant {
  const CheckboxSize(super.name);

  static const small = CheckboxSize('remix.checkbox.small');
  static const medium = CheckboxSize('remix.checkbox.medium');
  static const large = CheckboxSize('remix.checkbox.large');

  static List<CheckboxSize> get values => [small, medium, large];
}
