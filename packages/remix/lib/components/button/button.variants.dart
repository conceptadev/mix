import 'package:mix/mix.dart';

abstract class ButtonVariant extends Variant {
  const ButtonVariant(super.name);
}

class ButtonSize extends ButtonVariant {
  const ButtonSize(super.name);

  static const xsmall = ButtonSize('remix.button.xsmall');
  static const small = ButtonSize('remix.button.small');
  static const medium = ButtonSize('remix.button.medium');
  static const large = ButtonSize('remix.button.large');

  static List<ButtonSize> get values => [xsmall, small, medium, large];
}

class ButtonType extends ButtonVariant {
  const ButtonType(super.name);

  static const primary = ButtonType('remix.button.primary');
  static const secondary = ButtonType('remix.button.secondary');
  static const destructive = ButtonType('remix.button.destructive');
  static const outline = ButtonType('remix.button.outline');
  static const ghost = ButtonType('remix.button.ghost');
  static const link = ButtonType('remix.button.link');

  static List<ButtonType> get values => [
        primary,
        secondary,
        destructive,
        outline,
        ghost,
        link,
      ];
}
