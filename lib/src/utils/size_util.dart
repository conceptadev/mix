import '../attributes/size_attribute.dart';
import '../core/dto/double_dto.dart';

HeightAttribute height(double value) {
  return HeightAttribute(DoubleDto(value));
}

WidthAttribute width(double value) {
  return WidthAttribute(DoubleDto(value));
}
