import '../base_attribute.dart';

class AspectRationUtility {
  const AspectRationUtility();
  AspectRatioAttribute call(double aspectRatio) =>
      AspectRatioAttribute(aspectRatio);
}

class AspectRatioAttribute extends Attribute<double> {
  const AspectRatioAttribute(this.aspectRatio);

  final double aspectRatio;
  @override
  double get value => aspectRatio;
}
