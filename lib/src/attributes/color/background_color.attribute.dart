import '../base/color.attribute.dart';

class BackgroundColorAttribute extends ColorAttribute {
  const BackgroundColorAttribute(super.color, {super.modifier});

  @override
  BackgroundColorAttribute merge(BackgroundColorAttribute? other) {
    return BackgroundColorAttribute(
      other?.value ?? value,
      directive: other?.modifier ?? modifier,
    );
  }
}
