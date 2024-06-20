import 'package:mix/mix.dart';

class RemixButtonTypes {
  RemixButtonTypes();

  final primary = const ButtonType('remix.button.primary');
  final secondary = const ButtonType('remix.button.secondary');
  final destructive = const ButtonType('remix.button.destructive');
  final outline = const ButtonType('remix.button.outline');
  final ghost = const ButtonType('remix.button.ghost');
  final link = const ButtonType('remix.button.link');
}

class RemixButtonSizes {
  RemixButtonSizes();

  final xsmall = const ButtonSize('remix.button.xsmall');
  final small = const ButtonSize('remix.button.small');
  final medium = const ButtonSize('remix.button.medium');
  final large = const ButtonSize('remix.button.large');
}

class ButtonSize extends Variant {
  const ButtonSize(super.name);

  static const xsmall = ButtonSize('remix.button.xsmall');
  static const small = ButtonSize('remix.button.small');
  static const medium = ButtonSize('remix.button.medium');
  static const large = ButtonSize('remix.button.large');
}

class ButtonType extends Variant {
  const ButtonType(super.name);

  static const primary = ButtonType('remix.button.primary');
  static const secondary = ButtonType('remix.button.secondary');
  static const destructive = ButtonType('remix.button.destructive');
  static const outline = ButtonType('remix.button.outline');
  static const ghost = ButtonType('remix.button.ghost');
  static const link = ButtonType('remix.button.link');
}
