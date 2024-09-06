part of '../segmented_control.dart';

@MixableSpec()
class SegmentedControlButtonSpec extends Spec<SegmentedControlButtonSpec>
    with _$SegmentedControlButtonSpec, Diagnosticable {
  final FlexSpec flex;
  final BoxSpec container;
  final IconSpec icon;
  final TextSpec label;

  /// {@macro button_spec_of}
  static const of = _$SegmentedControlButtonSpec.of;

  static const from = _$SegmentedControlButtonSpec.from;

  const SegmentedControlButtonSpec({
    BoxSpec? container,
    FlexSpec? flex,
    IconSpec? icon,
    TextSpec? label,
    super.modifiers,
    super.animated,
  })  : flex = flex ?? const FlexSpec(),
        container = container ?? const BoxSpec(),
        icon = icon ?? const IconSpec(),
        label = label ?? const TextSpec();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    _debugFillProperties(properties);
  }
}
