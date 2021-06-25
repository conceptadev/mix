import '../base_attribute.dart';

class AspectRationUtility {
  AspectRatioAttribute call(double aspectRatio) =>
      AspectRatioAttribute(aspectRatio);
}

class AspectRatioAttribute extends Attribute<double> {
  const AspectRatioAttribute(this.aspectRatio);

  final double aspectRatio;

  double get value => aspectRatio;
}
