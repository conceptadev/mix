import 'package:mix/mix.dart';

interface class IButtonVariant extends Variant {
  const IButtonVariant(super.name);
}

class ButtonSize extends IButtonVariant {
  const ButtonSize(super.name);

  static const small = ButtonSize('small');
  static const medium = ButtonSize('medium');
  static const large = ButtonSize('large');
  static const xlarge = ButtonSize('xlarge');

  static List<ButtonSize> get values => [small, medium, large, xlarge];
}

class ButtonVariant extends IButtonVariant {
  const ButtonVariant(super.name);

  static const solid = ButtonVariant('solid');
  static const soft = ButtonVariant('soft');
  static const surface = ButtonVariant('surface');
  static const outline = ButtonVariant('outline');
  static const ghost = ButtonVariant('ghost');

  static List<ButtonVariant> get values => [
        solid,
        soft,
        surface,
        outline,
        ghost,
      ];
}
