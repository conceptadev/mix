import 'package:mix/src/attributes/base_attribute.dart';

class GapSizeUtility {
  const GapSizeUtility();
  GapSizeAttribute call(double gapSize) => GapSizeAttribute(gapSize);
}

class GapSizeAttribute extends Attribute<double> {
  const GapSizeAttribute(this.gapSize);
  final double gapSize;
  @override
  double get value => gapSize;
}
