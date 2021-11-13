import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/attributes/pressable/pressable.attributes.dart';

class PressableUtility {
  const PressableUtility._();

  static FocusedAttribute focus(List<Attribute> attributes) {
    return FocusedAttribute(attributes);
  }

  static DisabledAttribute disabled(List<Attribute> attributes) {
    return DisabledAttribute(attributes);
  }

  static PressingAttribute pressing(List<Attribute> attributes) {
    return PressingAttribute(attributes);
  }

  static HoverAttribute hover(List<Attribute> attributes) {
    return HoverAttribute(attributes);
  }
}
