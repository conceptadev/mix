import 'package:mix/mix.dart';
import 'package:remix/components/checkbox/tokens/checkbox_spec.dart';

class CheckboxSpecAttribute extends SpecAttribute<CheckboxSpec> {
  const CheckboxSpecAttribute({
    this.flexContainer = const FlexSpecAttribute(),
    this.innerContainer = const BoxSpecAttribute(),
    this.icon = const IconSpecAttribute(),
    this.label = const TextSpecAttribute(),
  });

  final FlexSpecAttribute flexContainer;
  final BoxSpecAttribute innerContainer;
  final IconSpecAttribute icon;
  final TextSpecAttribute label;

  @override
  CheckboxSpecAttribute merge(covariant CheckboxSpecAttribute? other) {
    return CheckboxSpecAttribute(
      flexContainer: flexContainer.merge(other?.flexContainer),
      innerContainer: innerContainer.merge(other?.innerContainer),
      icon: icon.merge(other?.icon),
      label: label.merge(other?.label),
    );
  }

  @override
  List<Object?> get props => [
        flexContainer,
        innerContainer,
        icon,
        label,
      ];

  @override
  CheckboxSpec resolve(MixData mix) {
    return CheckboxSpec(
      flexContainer: flexContainer.resolve(mix),
      innerContainer: innerContainer.resolve(mix),
      icon: icon.resolve(mix),
      label: label.resolve(mix),
    );
  }
}
