import 'package:demo/helpers/use_case_state.dart';
import 'package:flutter/material.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

final _key = GlobalKey();

@widgetbook.UseCase(
  name: 'Checkbox Component',
  type: RxCheckbox,
)
Widget buildCheckboxUseCase(BuildContext context) {
  final knobState = WidgetbookState.of(context);

  Widget buildCheckbox(CheckboxVariant variant) {
    return Column(
      children: [
        Text(variant.label),
        const SizedBox(height: 10),
        RxCheckbox(
          value: context.knobs.boolean(label: 'Checked', initialValue: true),
          onChanged: (value) => knobState.updateKnob('Checked', value),
          variant: variant,
          size: context.knobs.list(
            label: 'Size',
            options: CheckboxSize.values,
            initialOption: CheckboxSize.medium,
            labelBuilder: (value) => value.name.split('.').last,
          ),
          disabled: context.knobs.boolean(
            label: 'Disabled',
            initialValue: true,
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
      children: CheckboxVariant.values.map(buildCheckbox).toList(),
    ),
  );
}
