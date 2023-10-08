import '../base/double.attribute.dart';

class GapSizeAttribute extends DoubleAttribute {
  const GapSizeAttribute(double value) : super(value);

  @override
  GapSizeAttribute merge(GapSizeAttribute? other) {
    if (other == null) return this;

    return GapSizeAttribute(other.value);
  }
}
