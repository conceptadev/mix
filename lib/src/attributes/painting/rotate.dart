import '../base_attribute.dart';

class RotateUtility {
  /// Rotate widget 90 degrees
  RotateAttribute get r90 => RotateAttribute(1);

  /// Rotate widget 180 degrees
  RotateAttribute get r180 => RotateAttribute(2);

  /// Rotate widget 270 degrees
  RotateAttribute get r270 => RotateAttribute(3);

  /// Rotate widget 360 degrees
  RotateAttribute get r360 => RotateAttribute(4);
}

class RotateAttribute extends Attribute<int> {
  const RotateAttribute(this.quarterTurns);

  final int quarterTurns;

  int get value => quarterTurns;
}
