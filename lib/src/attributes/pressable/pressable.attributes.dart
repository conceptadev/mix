import 'package:flutter/material.dart';
import 'package:mix/src/attributes/common/attribute.dart';
import 'package:mix/src/attributes/pressable/pressable.notifier.dart';

class DisabledAttribute<T extends Attribute> extends VariantAttribute<T> {
  const DisabledAttribute(List<T> props) : super('disabled', props);
  @override
  bool shouldApply(BuildContext context) {
    final pressable = PressableNotifier.of(context);
    return pressable?.disabled == true;
  }
}

class PressingAttribute<T extends Attribute> extends VariantAttribute<T> {
  const PressingAttribute(List<T> props) : super('pressing', props);
  @override
  bool shouldApply(BuildContext context) {
    final pressable = PressableNotifier.of(context);

    return pressable?.pressing == true;
  }
}

class HoverAttribute<T extends Attribute> extends VariantAttribute<T> {
  const HoverAttribute(List<T> props) : super('hover', props);
  @override
  bool shouldApply(BuildContext context) {
    final pressable = PressableNotifier.of(context);

    return pressable?.hovering == true;
  }
}

class FocusedAttribute<T extends Attribute> extends VariantAttribute<T> {
  const FocusedAttribute(List<T> props) : super('focus', props);
  @override
  bool shouldApply(BuildContext context) {
    final pressable = PressableNotifier.of(context);
    return pressable?.focused == true;
  }
}
