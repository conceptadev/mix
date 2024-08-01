import 'package:demo/helpers/use_case_state.dart';
import 'package:flutter/material.dart';
import 'package:remix/components/switch/switch.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

final _key = GlobalKey();

@widgetbook.UseCase(
  name: 'Switch Component',
  type: RxSwitch,
)
Widget buildSwitchUseCase(BuildContext context) {
  final knobState = WidgetbookState.of(context);

  Widget buildSwitch(SwitchVariant variant) {
    return Column(
      children: [
        Text(variant.label),
        const SizedBox(height: 10),
        RxSwitch(
          value: context.knobs.boolean(label: 'Toggle', initialValue: true),
          onChanged: (value) => knobState.updateKnob('Toggle', value),
          variant: variant,
          size: context.knobs.list(
            label: 'Size',
            options: SwitchSize.values,
            initialOption: SwitchSize.medium,
            labelBuilder: (value) => value.label,
          ),
          disabled: context.knobs.boolean(
            label: 'Disabled',
            initialValue: false,
          ),
        ),
      ],
    );
  }

  return KeyedSubtree(
    key: _key,
    child: Wrap(
      spacing: 12,
      runSpacing: 12,
      children: SwitchVariant.values.map(buildSwitch).toList(),
    ),
  );
}
