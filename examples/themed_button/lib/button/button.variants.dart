import 'package:mix/mix.dart';

class ButtonSize extends Variant {
  const ButtonSize._(super.name);
  // Sizes
  static const xsmall = ButtonSize._('button.xsmall');
  static const small = ButtonSize._('button.small');
  static const medium = ButtonSize._('button.medium');
  static const large = ButtonSize._('button.large');

  static const values = [
    xsmall,
    small,
    medium,
    large,
  ];
}

class ButtonType extends Variant {
  const ButtonType._(super.name);
  // Types
  static const primary = ButtonType._('button.primary');
  static const secondary = ButtonType._('button.secondary');
  static const destructive = ButtonType._('button.destructive');
  static const outline = ButtonType._('button.outline');
  static const ghost = ButtonType._('button.ghost');
  static const link = ButtonType._('button.link');

  static const values = [
    primary,
    secondary,
    destructive,
    outline,
    ghost,
    link,
  ];
}
