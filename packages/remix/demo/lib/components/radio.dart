import 'package:demo/helpers/use_case_state.dart';
import 'package:flutter/material.dart';
import 'package:remix/components/radio/radio_variants.dart';
import 'package:remix/components/radio/radio_widget.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Radio Component',
  type: RxRadio,
)
Widget buildRadioUseCase(BuildContext context) {
  final knobState = WidgetbookState.of(context);

  Widget buildRadio(RadioVariant variant) {
    return Column(
      children: [
        Text(variant.label),
        const SizedBox(height: 10),
        RxRadio(
          value: context.knobs.boolean(label: 'Selected', initialValue: true),
          onChanged: (value) => knobState.updateKnob('Selected', value),
          variant: variant,
          size: context.knobs.list(
            label: 'Size',
            options: RadioSize.values,
            initialOption: RadioSize.medium,
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

  return Wrap(
    spacing: 12,
    runSpacing: 12,
    children: RadioVariant.values.map(buildRadio).toList(),
  );
}
