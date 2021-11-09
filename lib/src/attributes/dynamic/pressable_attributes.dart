import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/base_attribute.dart';

class DisabledAttribute extends PressableAttribute {
  const DisabledAttribute(Attribute attribute) : super(attribute);
  @override
  bool shouldApply(BuildContext context) {
    final pressable = PressableNotifier.of(context);
    return pressable?.disabled != null;
  }
}

class PressingAttribute extends PressableAttribute {
  const PressingAttribute(Attribute attribute) : super(attribute);
  @override
  bool shouldApply(BuildContext context) {
    final pressable = PressableNotifier.of(context);
    return pressable?.pressing != null;
  }
}

class HoveringAttribute extends PressableAttribute {
  const HoveringAttribute(Attribute attribute) : super(attribute);
  @override
  bool shouldApply(BuildContext context) {
    final pressable = PressableNotifier.of(context);
    return pressable?.hovering != null;
  }
}

class FocusedAttribute extends PressableAttribute {
  const FocusedAttribute(Attribute attribute) : super(attribute);
  @override
  bool shouldApply(BuildContext context) {
    final pressable = PressableNotifier.of(context);
    return pressable?.focused != null;
  }
}
