import '../base/double.attribute.dart';

class WidthAttribute extends DoubleAttribute {
  const WidthAttribute(super.value);

  @override
  WidthAttribute merge(WidthAttribute? other) =>
      WidthAttribute(other?.value ?? value);
}

class HeightAttribute extends DoubleAttribute {
  const HeightAttribute(super.value);

  @override
  HeightAttribute merge(HeightAttribute? other) =>
      HeightAttribute(other?.value ?? value);
}
