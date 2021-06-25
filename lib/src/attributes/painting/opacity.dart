import '../base_attribute.dart';

class OpacityUtility {
  OpacityAttribute build(double opacity) => OpacityAttribute(opacity);
}

class OpacityAttribute extends Attribute<double> {
  const OpacityAttribute(this.opacity);

  final double opacity;

  double get value => opacity;
}
