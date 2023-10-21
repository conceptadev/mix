import '../core/dto/double_dto.dart';

class WidthAttribute extends DoubleAttribute {
  const WidthAttribute(super.value);

  factory WidthAttribute.from(double width) => WidthAttribute(DoubleDto(width));

  @override
  WidthAttribute merge(WidthAttribute? other) =>
      WidthAttribute(other?.value ?? value);
}
