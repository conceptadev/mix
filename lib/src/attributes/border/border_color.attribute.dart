import '../base/color.attribute.dart';

class BorderColorAttribute extends ColorAttribute {
  const BorderColorAttribute(super.color, {super.modifier});

  @override
  BorderColorAttribute merge(BorderColorAttribute? other) {
    return BorderColorAttribute(
      other?.value ?? value,
      modifier: other?.modifier ?? modifier,
    );
  }
}
