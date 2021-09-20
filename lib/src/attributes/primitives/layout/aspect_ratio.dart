import 'package:mix/src/attributes/animation/animated_mix.dart';

import '../../base_attribute.dart';

class AspectRatioUtility {
  const AspectRatioUtility();
  AspectRatioAttribute call(double aspectRatio) =>
      AspectRatioAttribute(aspectRatio);
}

class AspectRatioAttribute extends Attribute<double> with AnimatedMix<double> {
  AspectRatioAttribute(this.aspectRatio);

  final double aspectRatio;
  @override
  double get value => aspectRatio;
}
