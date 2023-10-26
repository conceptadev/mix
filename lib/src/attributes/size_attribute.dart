import '../core/dto/double_dto.dart';

class HeightAttribute extends DoubleAttribute {
  const HeightAttribute(super.value);

  @override
  HeightAttribute create(value) => HeightAttribute(value);
}

class WidthAttribute extends DoubleAttribute {
  const WidthAttribute(super.value);

  @override
  WidthAttribute create(value) => WidthAttribute(value);
}
