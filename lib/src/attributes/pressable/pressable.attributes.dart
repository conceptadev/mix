import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/attributes/dynamic/variant.attributes.dart';
import 'package:mix/src/attributes/pressable/pressable.notifier.dart';

class DisabledAttribute extends VariantAttribute {
  const DisabledAttribute(List<Attribute> props) : super('disabled', props);
  @override
  bool shouldApply(BuildContext context) {
    final pressable = PressableNotifier.of(context);
    return pressable?.disabled == true;
  }
}

class PressingAttribute extends VariantAttribute {
  const PressingAttribute(List<Attribute> props) : super('pressing', props);
  @override
  bool shouldApply(BuildContext context) {
    final pressable = PressableNotifier.of(context);

    return pressable?.pressing == true;
  }
}

class HoverAttribute extends VariantAttribute {
  const HoverAttribute(List<Attribute> props) : super('hover', props);
  @override
  bool shouldApply(BuildContext context) {
    final pressable = PressableNotifier.of(context);

    return pressable?.hovering == true;
  }
}

class FocusedAttribute extends VariantAttribute {
  const FocusedAttribute(List<Attribute> props) : super('focus', props);
  @override
  bool shouldApply(BuildContext context) {
    final pressable = PressableNotifier.of(context);
    return pressable?.focused == true;
  }
}
