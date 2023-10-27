import '../../core/dto/dtos.dart';
import '../../core/style_attribute.dart';

abstract class DoubleAttribute
    extends ModifiableDtoAttribute<DoubleAttribute, DoubleDto, double> {
  const DoubleAttribute(super.value);
}
