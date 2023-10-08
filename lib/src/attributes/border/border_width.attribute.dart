import '../base/double.attribute.dart';

class BorderWidthAttribute extends DoubleAttribute {
  const BorderWidthAttribute(super.value, {super.modifier});

  @override
  BorderWidthAttribute merge(BorderWidthAttribute? other) {
    return BorderWidthAttribute(
      other?.value ?? value,
      modifier: other?.modifier ?? modifier,
    );
  }
}
