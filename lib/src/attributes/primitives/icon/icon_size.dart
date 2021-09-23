import '../../base_attribute.dart';

import 'package:mix/src/attributes/animation/animated_mix.dart';

class IconSizeUtility {
  const IconSizeUtility();
  IconSizeAttribute call(double iconSize) => IconSizeAttribute(iconSize);
}

class IconSizeAttribute extends Attribute<double> with AnimatedMix<double> {
  IconSizeAttribute(this.iconSize);

  final double iconSize;

  @override
  double get value => iconSize;
}
