import 'package:mix/src/attributes/animation/animated_mix.dart';

import '../../base_attribute.dart';

class OpacityUtility {
  const OpacityUtility();
  OpacityAttribute call(double opacity) => OpacityAttribute(opacity);
}

class OpacityAttribute extends Attribute<double> with AnimatedMix<double> {
  OpacityAttribute(this.opacity);

  final double opacity;
  @override
  double get value => opacity;
}
