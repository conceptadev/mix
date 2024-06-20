import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix/components/checkbox/tokens/checkbox_attr.dart';

class CheckboxSpec extends Spec<CheckboxSpec> {
  final FlexSpec flexContainer;
  final BoxSpec innerContainer;
  final IconSpec icon;
  final TextSpec label;

  const CheckboxSpec({
    required this.flexContainer,
    required this.innerContainer,
    required this.icon,
    required this.label,
  });

  const CheckboxSpec.empty()
      : flexContainer = const FlexSpec.empty(),
        innerContainer = const BoxSpec.empty(),
        icon = const IconSpec.empty(),
        label = const TextSpec.empty();

  @override
  CheckboxSpec copyWith({
    FlexSpec? flexContainer,
    BoxSpec? innerContainer,
    IconSpec? icon,
    TextSpec? label,
  }) {
    return CheckboxSpec(
      flexContainer: flexContainer ?? this.flexContainer,
      innerContainer: innerContainer ?? this.innerContainer,
      icon: icon ?? this.icon,
      label: label ?? this.label,
    );
  }

  static CheckboxSpec of(BuildContext context) {
    final mix = MixProvider.of(context);

    return mix.attributeOf<CheckboxSpecAttribute>()?.resolve(mix) ??
        const CheckboxSpec.empty();
  }

  @override
  CheckboxSpec lerp(CheckboxSpec other, double t) {
    return CheckboxSpec(
      flexContainer: flexContainer.lerp(other.flexContainer, t),
      innerContainer: innerContainer.lerp(other.innerContainer, t),
      icon: icon.lerp(other.icon, t),
      label: label.lerp(other.label, t),
    );
  }

  @override
  List<Object?> get props => [
        flexContainer,
        innerContainer,
        icon,
        label,
      ];
}
