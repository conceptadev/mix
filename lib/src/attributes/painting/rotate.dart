import '../base_attribute.dart';

class RotateUtility {
  const RotateUtility();

  /// Rotate widget 90 degrees
  RotateAttribute get r90 => const RotateAttribute(1);

  /// Rotate widget 180 degrees
  RotateAttribute get r180 => const RotateAttribute(2);

  /// Rotate widget 270 degrees
  RotateAttribute get r270 => const RotateAttribute(3);

  /// Rotate widget 360 degrees
  RotateAttribute get r360 => const RotateAttribute(4);
}

class RotateAttribute extends Attribute<int> {
  const RotateAttribute(this.quarterTurns);

  final int quarterTurns;
  @override
  int get value => quarterTurns;
}
