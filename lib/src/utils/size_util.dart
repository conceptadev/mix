import '../attributes/value_attributes.dart';
import '../core/dto/dtos.dart';

HeightAttribute height(double value) {
  return HeightAttribute(DoubleDto(value));
}

WidthAttribute width(double value) {
  return WidthAttribute(DoubleDto(value));
}
