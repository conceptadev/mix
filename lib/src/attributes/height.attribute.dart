import '../core/dto/double.dto.dart';

class HeightAttribute extends DoubleAttribute {
  const HeightAttribute(super.value);

  factory HeightAttribute.from(double width) =>
      HeightAttribute(DoubleDto(width));

  @override
  HeightAttribute merge(HeightAttribute? other) =>
      HeightAttribute(other?.value ?? value);
}
