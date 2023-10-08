import '../base/double.attribute.dart';

class HeightAttribute extends DoubleAttribute {
  const HeightAttribute(super.value);

  @override
  HeightAttribute merge(HeightAttribute? other) =>
      HeightAttribute(other?.value ?? value);
}
