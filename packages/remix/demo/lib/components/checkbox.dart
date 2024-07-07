import 'package:flutter/material.dart';
import 'package:remix/remix.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Checkbox Component',
  type: RxCheckbox,
)
Widget buildCheckboxUseCase(BuildContext context) {
  Widget buildCheckbox(CheckboxVariant variant) {
    return RxCheckbox(
      value: context.knobs.boolean(label: 'Value', initialValue: true),
      onChanged: (value) {},
      size: context.knobs.list(
        label: 'Size',
        options: CheckboxSize.values,
        initialOption: CheckboxSize.medium,
        labelBuilder: (value) => value.name.split('.').last,
      ),
      disabled: context.knobs.boolean(label: 'Disabled', initialValue: false),
    );
  }

  return Wrap(
    spacing: 12,
    runSpacing: 12,
    children: CheckboxVariant.values.map(buildCheckbox).toList(),
  );
}
