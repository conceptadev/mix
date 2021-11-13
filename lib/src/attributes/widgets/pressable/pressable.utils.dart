import 'package:mix/src/attributes/attribute.dart';
import 'package:mix/src/attributes/widgets/pressable/pressable.attributes.dart';

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

typedef SpreadFunc<T extends DynamicAttribute> = T Function(
    List<Attribute> attributes);

class PositionalParameterFunc<T extends DynamicAttribute> {
  const PositionalParameterFunc(this.func);
  final SpreadFunc<T> func;

  /// Attribute params to list
  T spreadDynamic([
    Attribute? p1,
    Attribute? p2,
    Attribute? p3,
    Attribute? p4,
    Attribute? p5,
    Attribute? p6,
  ]) {
    final attributes = <Attribute>[];

    if (p1 != null) {
      attributes.add(p1);
    }
    if (p2 != null) {
      attributes.add(p2);
    }
    if (p3 != null) {
      attributes.add(p3);
    }
    if (p4 != null) {
      attributes.add(p4);
    }
    if (p5 != null) {
      attributes.add(p5);
    }
    if (p6 != null) {
      attributes.add(p6);
    }

    return func(attributes);
  }
}
