import '../base_attribute.dart';

class IconSizeUtility {
  IconSizeAttribute call(double iconSize) => IconSizeAttribute(iconSize);
}

class IconSizeAttribute extends Attribute<double> {
  const IconSizeAttribute(this.iconSize);
  final double iconSize;

  double get value => iconSize;
}
