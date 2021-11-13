import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/attributes/attribute.dart';

class DisabledAttribute extends DynamicAttribute {
  const DisabledAttribute(List<Attribute> props) : super(props);
  @override
  bool shouldApply(BuildContext context) {
    final pressable = PressableNotifier.of(context);
    return pressable?.disabled != null;
  }
}

class PressingAttribute extends DynamicAttribute {
  const PressingAttribute(List<Attribute> props) : super(props);
  @override
  bool shouldApply(BuildContext context) {
    final pressable = PressableNotifier.of(context);
    return pressable?.pressing != null;
  }
}

class HoverAttribute extends DynamicAttribute {
  const HoverAttribute(List<Attribute> props) : super(props);
  @override
  bool shouldApply(BuildContext context) {
    final pressable = PressableNotifier.of(context);
    return pressable?.hovering != null;
  }
}

class FocusedAttribute extends DynamicAttribute {
  const FocusedAttribute(List<Attribute> props) : super(props);
  @override
  bool shouldApply(BuildContext context) {
    final pressable = PressableNotifier.of(context);
    return pressable?.focused != null;
  }
}
