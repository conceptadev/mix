import '../core/dto/double_dto.dart';

class HeightAttribute extends DoubleAttribute {
  const HeightAttribute(super.value);

  factory HeightAttribute.from(double width) =>
      HeightAttribute(DoubleDto(width));

  @override
  HeightAttribute merge(HeightAttribute? other) =>
      HeightAttribute(other?.value ?? value);
}

class WidthAttribute extends DoubleAttribute {
  const WidthAttribute(super.value);

  factory WidthAttribute.from(double width) => WidthAttribute(DoubleDto(width));

  @override
  WidthAttribute merge(WidthAttribute? other) =>
      WidthAttribute(other?.value ?? value);
}
