import 'package:mix/src/attributes/attribute.dart';
import 'package:mix/src/attributes/widgets/pressable/pressable.attributes.dart';

class PressableUtility {
  const PressableUtility._();

  static FocusedAttribute focus(Attribute attribute) {
    return FocusedAttribute(attribute);
  }

  static DisabledAttribute disabled(Attribute attribute) {
    return DisabledAttribute(attribute);
  }

  static PressingAttribute pressing(Attribute attribute) {
    return PressingAttribute(attribute);
  }

  static HoverAttribute hover(Attribute attribute) {
    return HoverAttribute(attribute);
  }
}
