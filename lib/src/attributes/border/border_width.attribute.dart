import '../base/double.dto.dart';

class BorderWidthAttribute extends DoubleDto {
  const BorderWidthAttribute(super.value, {super.modifier});

  @override
  BorderWidthAttribute merge(BorderWidthAttribute? other) {
    return BorderWidthAttribute(
      other?.value ?? value,
      modifier: other?.modifier ?? modifier,
    );
  }
}
